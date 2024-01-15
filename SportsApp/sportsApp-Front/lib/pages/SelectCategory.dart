import 'package:flutter/material.dart';
import '../entities/Category.dart';
import '../services/EventsService.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  late Future<List<Category>> _categories;
  @override
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
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 30.0),
                  child: TextButton(
                    onPressed: () {
                      // Add functionality for "Save & Exit" button, to return home check Airbnb
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
                      'Save & Exit',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Which is your activity Category?',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
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
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Categories not found'));
              } else {
                List<Category> categories = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(categories.length, (index) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/eventInfo');
                              },
                              child: Column(
                                children: <Widget>[
                                  const Icon(IconData(0xe5f2,
                                      fontFamily: "MaterialIcons")),
                                  Text(categories[index].name),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              }
            }));
  }
}
