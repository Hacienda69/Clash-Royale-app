import 'package:flutter/material.dart';

void showFiltersMenu(BuildContext context) {
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      const Offset(0, 0),
      overlay.localToGlobal(overlay.size.bottomRight(Offset.zero)),
    ),
    Offset.zero & overlay.size,
  );

  showMenu(
    context: context,
    position: position,
    items: [
      const PopupMenuItem(
        child: Text('Opción 1'),
      ),
      const PopupMenuItem(
        child: Text('Opción 2'),
      ),
      // Agrega más opciones según sea necesario
    ],
  );
}
