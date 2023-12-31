
class User {

  final String userId;
  final String name;
  final String lastName;
  final DateTime birthday;
   String location;
   List<String> eventsCreated;
   List<String> eventsSubscribed;

  User({
    required this.userId,
    required this.name,
    required this.lastName,
    required this.birthday,
    required this.location,
    required this.eventsCreated,
    required this.eventsSubscribed,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      lastName: json['lastName'],
      birthday: DateTime.parse(json['birthday']), // Parsing birthday assuming it's in a specific format
      location: json['location'],
      eventsCreated: List<String>.from(json['eventsCreated']),
      eventsSubscribed: List<String>.from(json['eventsSubscribed']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'lastName': lastName,
      'birthday': birthday.toIso8601String(), // Convert birthday to a string representation
      'location': location,
      'eventsCreated': eventsCreated,
      'eventsSubscribed': eventsSubscribed,
    };
  }
}