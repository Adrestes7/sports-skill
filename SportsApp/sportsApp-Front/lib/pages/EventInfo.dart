import 'package:flutter/material.dart';

class EventInfo extends StatefulWidget {
  const EventInfo({super.key});

  @override
  State<EventInfo> createState() => _EventInfoState();
}

class _EventInfoState extends State<EventInfo> {
  TextEditingController _startTime = TextEditingController();
  TextEditingController _endTime = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<String> subCategories = ["fut5", "fut7"];
    return Scaffold(
      body: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                  labelText: 'FECHA',
                  filled: true,
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              readOnly: true,
              onTap: () {
                _selectDate();
              },
            ),
            TextFormField(
              controller: _startTime,
              decoration: const InputDecoration(
                  labelText: 'tiempo de inicio',
                  filled: true,
                  prefixIcon: Icon(Icons.access_time),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              onTap: () {
                _selectTime("start");
              },
            ),
            TextField(
              controller: _endTime,
              decoration: const InputDecoration(
                  labelText: 'Tiempo final',
                  filled: true,
                  prefixIcon: Icon(Icons.access_time),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
              onTap: () {
                _selectTime("end");
              },
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                  labelText: 'Precio',
                  filled: true,
                  prefixIcon: Icon(Icons.monetization_on),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),TextField(
              controller: _locationController,
              decoration: const InputDecoration(
                  labelText: 'Direccion',
                  filled: true,
                  prefixIcon: Icon(Icons.location_on),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue))),
            ),
            DropdownButtonFormField(
                decoration: const InputDecoration(
                    labelText: 'Tipo de juego',
                    filled: true,
                    prefixIcon: Icon(Icons.category),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
                items: subCategories.map((subCategory) {
                  return DropdownMenuItem(
                    value: subCategory,
                    child: Text(subCategory),
                  );
                }).toList(),
                onChanged: (value) {})
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: Icon(Icons.save),
      ),
    );
  }
  void _showDialog(){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: const Text("¿Estás seguro de crear este evento?"),
            actions: [
              MaterialButton(
                  onPressed: (){},
                  child: const Text('Si'),
                  color: Colors.blue,
              ),
              MaterialButton(
                  onPressed: (){},
                  child: const Text('No'),
                  color: Colors.red,
              )
            ],
          );
        });
  }
  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  Future<void> _selectTime(String time) async {
    TimeOfDay? _picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (_picked != null && time == "start") {
      setState(() {
        _startTime.text = "${_picked.hour.toString().padLeft(2, '0')}:${_picked.minute.toString().padLeft(2, '0')}";
      });
    } else {
      setState(() {
        _endTime.text = "${_picked!.hour.toString().padLeft(2, '0')}:${_picked.minute.toString().padLeft(2, '0')}";
      });
    }
  }
}
