
import 'package:flutter/material.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/canvas/tools/eraser.dart';
import 'package:saber/components/toolbar/toolbar_button.dart';

class Toolbar extends StatelessWidget {
  const Toolbar({
    Key? key,
    required this.setTool,
    required this.currentTool,

    required this.undo,
    required this.isUndoPossible,
    required this.redo,
    required this.isRedoPossible,

    required this.toggleFingerDrawing,
    required this.isFingerDrawingEnabled,
  }) : super(key: key);

  final ValueChanged<Tool> setTool;
  final Tool currentTool;

  final VoidCallback undo;
  final bool isUndoPossible;
  final VoidCallback redo;
  final bool isRedoPossible;

  final VoidCallback toggleFingerDrawing;
  final bool isFingerDrawingEnabled;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surface,
      ),
      child: Material(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ToolbarIconButton(
                    tooltip: "Fountain pen",
                    selected: currentTool == Pen.currentPen,
                    onPressed: () {
                      setTool(Pen.currentPen);
                    },
                    child: const Icon(Icons.brush),
                  ),
                  ToolbarIconButton(
                    tooltip: "Colour",
                    onPressed: null,
                    child: const Icon(Icons.palette),
                  ),
                  ToolbarIconButton(
                    tooltip: "Eraser",
                    selected: currentTool is Eraser,
                    onPressed: () {
                      setTool(Eraser());
                    },
                    child: const Icon(Icons.remove), // todo: better eraser icon
                  ),
                  ToolbarIconButton(
                    tooltip: "Photo",
                    onPressed: null,
                    child: const Icon(Icons.photo_size_select_actual),
                  ),
                  ToolbarIconButton(
                    tooltip: "Toggle finger drawing",
                    selected: isFingerDrawingEnabled,
                    onPressed: toggleFingerDrawing,
                    child: const Icon(Icons.gesture),
                  ),
                  ToolbarIconButton(
                    tooltip: "Undo",
                    onPressed: isUndoPossible ? undo : null,
                    child: const Icon(Icons.undo),
                  ),
                  ToolbarIconButton(
                    tooltip: "Redo",
                    onPressed: isRedoPossible ? redo : null,
                    child: const Icon(Icons.redo),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}