import 'package:flutter/material.dart';
import 'package:sports_app/entities/Profile.dart';
import 'package:sports_app/services/EventsService.dart';

class ProfilePage extends StatefulWidget {
  final String id;

  const ProfilePage({super.key, required this.id});

  @override
  State<ProfilePage> createState() => Profile_State();
}

class Profile_State extends State<ProfilePage> {
  late Future<Profile> _profile;

  @override
  void initState() {
    _profile = EventService.getProfileData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Profile>(
            future: _profile,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('Profile not found'));
              } else {
                Profile profile = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "NOMBRE",
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 2.0),
                      ),
                      Text(
                        profile.name,
                        style: const TextStyle(
                            color: Colors.amberAccent,
                            letterSpacing: 2.0,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "APELLIDO",
                        style:
                            TextStyle(color: Colors.grey, letterSpacing: 2.0),
                      ),
                      Text(
                        profile.lastName,
                        style: const TextStyle(
                            color: Colors.amberAccent,
                            letterSpacing: 2.0,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            profile.email,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                                letterSpacing: 1.0),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            profile.address,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                                letterSpacing: 1.0),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        "DEPORTES",
                        style:
                        TextStyle(color: Colors.grey, letterSpacing: 2.0),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                          child: GridView.count(
                              crossAxisCount: 2,
                              children:
                              List.generate(profile.sports.length, (index) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          const Icon(IconData(0xe5f2,
                                              fontFamily: "MaterialIcons")),
                                          Text(profile.sports[index].sportName),
                                          Text("Calificación del usuario: ${profile.sports[index].userGrade}"),
                                          Text("Calificación de la comunidad: ${profile.sports[index].feedback.grade}"),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }))
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
