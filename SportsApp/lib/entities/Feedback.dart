
class Feedback{

  double grade;
  int numberOfPersons;

  Feedback(this.grade, this.numberOfPersons);

  static Feedback fromJson(dynamic data){
    return Feedback(data["grade"], data["numberOfPersons"]);
  }
}