import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomDraggableScrollableSheet extends StatefulWidget {
  const CustomDraggableScrollableSheet({super.key});

  @override
  State<CustomDraggableScrollableSheet> createState() =>
      _CustomDraggableScrollableSheetState();
}

class _CustomDraggableScrollableSheetState
    extends State<CustomDraggableScrollableSheet> {
  double _sheetPosition = 0.5;
  final double _dragSensitivity = 600;
 
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: _sheetPosition,
      builder: (BuildContext context, ScrollController scrollController) {
        return ColoredBox(
          color: colorScheme.primary,
          child: Column(
            children: <Widget>[
              Grabber(
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _sheetPosition -= details.delta.dy / _dragSensitivity;
                    if (_sheetPosition < 0.25) {
                      _sheetPosition = 0.25;
                    }
                    if (_sheetPosition > 1.0) {
                      _sheetPosition = 1.0;
                    }
                  });
                },
                isOnDesktopAndWeb: _isOnDesktopAndWeb,
              ),
              Flexible(
                child: ListView.builder(
                  controller: _isOnDesktopAndWeb ? null : scrollController,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        'Item $index',
                        style: TextStyle(color: colorScheme.surface),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool get _isOnDesktopAndWeb {
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}

/// A draggable widget that accepts vertical drag gestures
/// and this is only visible on desktop and web platforms.
class Grabber extends StatelessWidget {
  const Grabber({
    super.key,
    required this.onVerticalDragUpdate,
    required this.isOnDesktopAndWeb,
  });

  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final bool isOnDesktopAndWeb;

  @override
  Widget build(BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      child: Container(
        width: double.infinity,
        color: colorScheme.onSurface,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: 32.0,
            height: 4.0,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
