

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
  String country;
  String city;
  String title;
  String description;
  String mainPhotoUrl;
  List<String> photoUrls;

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
      this.country,
      this.city,
      this.title,
      this.description,
      this.mainPhotoUrl,
      this.photoUrls);

  static Event fromJson(dynamic data){
    return Event(data['id'] ?? "", data['category'] ?? "",
        data['subCategory']?? "", data['date']?? "",
        data['startTime']?? "", data['endTime']?? "",
        data['price']?? "", data['numberOfPersons']?? "",
        data['location']?? "", data ['country']?? "", data ['city']?? "",
        data['title']?? "",
        data['description']?? "",data['mainPhotoUrl']?? "",
        List<String>.from(data['photoUrls'] ?? []), );
  }
}


