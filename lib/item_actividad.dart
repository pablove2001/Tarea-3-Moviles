import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final int index;
  final String nombre;
  final String imagen;

  ItemActividad(
      {super.key,
      required this.index,
      required this.nombre,
      required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            child: Image(
              image: NetworkImage("${imagen}"),
              fit: BoxFit.cover,
            ),
          ),
          Text("Day ${index + 1}", style: TextStyle(fontSize: 11)),
          Text("${nombre}"),
        ],
      ),
    );
  }
}
