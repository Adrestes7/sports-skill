

class Event {

  String id;
  String category;
  String subCategory;
  String date;
  String startTime;
  String endTime;
  String price;
  String numberOfPersons;
  String location;
  String title;
  String description;

  Event(
      this.id,
      this.category,
      this.subCategory,
      this.date,
      this.startTime,
      this.endTime,
      this.price,
      this.numberOfPersons,
      this.location,
      this.title,
      this.description);
  
  static Event fromJson(dynamic data){
    return Event(data['id'], data['categor'], data['subCategory'], data['date'], data['startTime'], data['endTime'], data['price'], data['numberOfPersons'], data['address'], data['title'], data['description']);
  }
}