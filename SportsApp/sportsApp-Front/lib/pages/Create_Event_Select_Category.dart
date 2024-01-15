import 'package:flutter/material.dart';
import '../entities/Categorytypeslist.dart';
import '../services/EventsService.dart';
import 'package:sports_app/entities/LoadedPhotoslist.dart';

class SelectEventCategory extends StatefulWidget {
  const SelectEventCategory({Key? key}) : super(key: key);

  @override
  _SelectEventCategoryState createState() => _SelectEventCategoryState();
}

class _SelectEventCategoryState extends State<SelectEventCategory> {
  late List<Map<String, dynamic>> categoryTypes;

  @override
  void initState() {
    super.initState();
    // Initialize categoryTypes with the data from CategoryTypes list
    categoryTypes = CategoryTypesList as List<Map<String, dynamic>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 30.0),
                child: TextButton(
                  onPressed: () {
                    // Add functionality for "Save & Exit" button, to return home check Airbnb
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.white,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Save & Exit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 30.0),
                child: TextButton(
                  onPressed: () {
                    // Functionality for "Save & Exit" button at the end
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Questions?',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 16.0, // Spacing between columns
          mainAxisSpacing: 16.0, // Spacing between rows
        ),
        itemCount: categoryTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Handle category item tap
              print(
                  'Selected category: ${categoryTypes[index]["name"]}'); // Access category name
              // Add navigation or other actions based on the selected category
            },
            child: Card(
              elevation: 2.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      categoryTypes[index]["icon"],
                      size: 50.0,
                      color: Colors.blue, // Change color as needed
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      categoryTypes[index]["type"],
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: () {

              Navigator.pushNamed(context, '/create_event_main_info');

            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              ),
            ),
            child: Text(
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
}
