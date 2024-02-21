import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sports_app/entities/Profile.dart';
import 'package:sports_app/services/UsersService.dart';
import 'package:sports_app/services/LocalStorage.dart';

class ViewProfilePage extends StatefulWidget {

  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => Profile_State();
}

class Profile_State extends State<ViewProfilePage> {
  late Future<Profile> _profile;

  @override
  void initState() {
    //String? serializedToken = LocalStorage.prefs.getString("token");
    //Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(serializedToken!);
    //String id = jwtDecodedToken["Uid"];
    _profile = UserService.getProfileData('1');
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
                                          Text("Calificación de la comunidad: ${profile.sports[index].feedbackGrade}"),
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
