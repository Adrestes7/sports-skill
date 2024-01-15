
import 'package:sports_app/entities/Feedback.dart';

class Sport {

  String sportName;
  double userGrade;
  Feedback feedback;

  Sport(this.sportName, this.userGrade, this.feedback);

  static fromJson(dynamic data,){
    return Sport(data["name"], data["initialGrade"], Feedback.fromJson(data["feedback"]));
  }
}