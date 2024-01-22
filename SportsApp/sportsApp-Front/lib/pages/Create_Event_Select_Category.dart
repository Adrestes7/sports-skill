import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/widgets/Providers.dart';
import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/entities/Categorietypes.dart';
import '../services/BackEndService.dart';

class SelectEventCategory extends StatefulWidget {
  const SelectEventCategory({Key? key}) : super(key: key);

  @override
  _SelectEventCategoryState createState() => _SelectEventCategoryState();
}

class _SelectEventCategoryState extends State<SelectEventCategory> {
  Category? selectedCategory;
  List<Category> categories = [];
  late Future<List<Category>> _categories;
  int _currentPage = 0;

  void initState() {
    super.initState();
    _categories = EventService.getCategoryData();
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
      body: FutureBuilder<List<Category>>(
        future: _categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<Category> categories = snapshot.data!;
            selectedCategory = categories[_currentPage];
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = categories[index];
                      _currentPage = index;
                    });
                  },
                  child: Card(
                    elevation: 2.0,
                    color: selectedCategory == categories[index] ? Colors.blue : Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            categories[index].icon,
                            style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            categories[index].name,
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
            );
          }
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                EventProvider eventProvider = Provider.of<EventProvider>(context, listen: false);
                eventProvider.updateCategoryInfo(selectedCategory!.name);
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
          ],
        ),
      ),
    );
  }
}

