import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/widgets/Providers.dart';
import 'package:sports_app/entities/Event.dart';
import '../services/BackEndService.dart';

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
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: () {
              // Get the EventProvider instance
              EventProvider eventProvider =
              Provider.of<EventProvider>(context, listen: false);

              // Update the event data
              eventProvider.updateEventMainInfo(_dateController.text,_startTime.text,_endTime.text,_priceController.text,_locationController.text);

              // Navigate to the next screen
              Navigator.pushNamed(context, '/create_event_load_photos');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ]),
      ),
    );
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
