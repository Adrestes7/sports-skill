import 'package:flutter/material.dart';
import 'package:sports_app/widgets/CategoryTypeList.dart';


class CategoryTypes extends StatefulWidget {
  const CategoryTypes({super.key});

  @override
  State<CategoryTypes> createState() => _CategoryTypesState();
}

class _CategoryTypesState extends State<CategoryTypes> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf (context);
    final textTheme = Theme.of (context). textTheme;

    //change this with backend connection when created.
    final List<Map<String, dynamic>> CategoryTypes = [

      {'type': 'Sports', 'icon': Icons.sports_soccer},
      {'type': 'Party', 'icon': Icons.party_mode},
      {'type': 'Outdoor', 'icon': Icons.outdoor_grill},
      {'type': 'Gaming', 'icon': Icons.gamepad},
      {'type': 'Study', 'icon': Icons.book},
      {'type': 'Business', 'icon': Icons.money},

    ];
    return SizedBox(
    height: 56.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: CategoryTypes.length,
        itemBuilder:(context, index){
      return Container (
        width: size.width* 0.2,
        margin: const EdgeInsets.only(
          left: 4.0,
          top: 4.0,
          right: 4.0,
        ),

        child: Column(
          children: [
            Icon(CategoryTypes[index]['icon']),
              const SizedBox (height: 2.0),

            Text(CategoryTypes[index]['type'],
              style: textTheme.bodySmall!.copyWith(
                fontWeight: (index == selectedIndex)
                    ? FontWeight.bold
                    : FontWeight.normal,

              ),
            ),
            (index == selectedIndex) ? Container (
              margin: const EdgeInsets.only(top: 8.0),
              height: 2.0,
              width: 64.0,
              color: Colors.blue,
            )
                : const SizedBox()
          ],
        )
      );
       },
     ),
    );
  }
}


