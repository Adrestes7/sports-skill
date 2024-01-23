
class Sport {

  String sportName;
  double userGrade;
  double feedbackGrade;
  int numberOfPersons;
  Sport(this.sportName, this.userGrade, this.feedbackGrade, this.numberOfPersons);

  static fromJson(dynamic data,){
    return Sport(data["name"], data["initialGrade"], data["feedbackGrade"], data["numberOfPersons"]);
  }
}