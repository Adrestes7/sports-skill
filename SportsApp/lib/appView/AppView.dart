import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/Home.dart';
import '../pages/ViewProfile.dart';
import '../pages/ViewProfile.dart';
import '../pages/CreateEvent.dart';


class AppView extends StatefulWidget {
  const AppView({Key? key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _currentIndex = 0;
  final List<Widget> tabs = [
    Home(),
    ViewProfilePage(id: '1'),
    CreateEvent()
    //Screen(), // Pending to add User events and chat with communities, we need the user
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tribe'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/Icons/Search_light.svg',

              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/Icons/User_box_light.svg',

              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/Icons/Add_square_light.svg',

              ),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/Icons/Order_light.svg',

              ),
              label: 'Activity',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'Assets/Icons/Chat_alt_2_light.svg',

              ),
              label: 'Communities',
            ),
          ],

          selectedItemColor: Colors.blue, // Color of selected icon
          unselectedItemColor: Colors.black, // Color of unselected icons
          selectedLabelStyle: const TextStyle(
              color: Colors.red,
              fontSize: 10), // Color of selected label
          unselectedLabelStyle: const TextStyle(
              color: Colors.black,
              fontSize: 10) // Color of unselected labels

      ),
      floatingActionButton: _currentIndex != 0
          ? null
          : FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/event');
        },
      ),
    );
  }
}