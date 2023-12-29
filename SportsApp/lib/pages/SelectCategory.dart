import 'package:flutter/material.dart';
import '../entities/Category.dart';
import '../services/EventsService.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    EventService.getCategoryData()
        .then((value) => categories = value)
        .whenComplete(() => setState(() {}));
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
                  child: Text(
                    'Save & Exit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
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
      body: Padding(
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
                        Icon(IconData(0xe5f2, fontFamily: "MaterialIcons")),
                        Text(categories[index].name),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}


