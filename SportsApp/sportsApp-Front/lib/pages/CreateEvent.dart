import 'package:flutter/material.dart';

import '../services/EventsService.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}
class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
              children: [
                Card(
                  child: Text("Crear una actividad es muy fácil"),
                ),
                Card(
                  child: ListTile(
                    title: Text("1. Cuentanos un poco más de tu actividad"),
                    subtitle: Text(
                        "Comparte información básica como ubicación, horario y categoría"),
                  ),
                ),
                Card(
                    child: ListTile(
                      title: Text("2. Confirma la información y listo ya creaste tu evento"),
                    )
                ),
              ]
          ),

    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.arrow_forward),
      onPressed: () {
        Navigator.pushNamed(context, '/category');
      },)
    );
  }
}
