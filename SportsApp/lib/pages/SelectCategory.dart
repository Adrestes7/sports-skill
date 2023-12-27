import 'package:flutter/material.dart';

import '../entities/Category.dart';
import '../services/EventsService.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({super.key});

  @override
  State<SelectCategory> createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  List<Category> categories = [];
  @override
  void initState(){
    super.initState();
    EventService.getCategoryData().then((value) => categories = value).whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(categories.length, (index) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, '/eventInfo')
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(IconData(0xe5f2, fontFamily: "MaterialIcons")),
                        Text(categories[index].name)
                      ],
                    ),
                  ),
                ],
              ),
            );
          })
      ),
    );
  }
}
