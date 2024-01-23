
import 'package:sports_app/entities/Event.dart';

class FromJsonConverter{
  static Event newEventfromJson(dynamic data){
    Event event  = Event();
    event.addEventData(data['id'] ?? "", data['categor'] ?? "",
        data['subCategory']?? "", data['date']?? "",
        data['startTime']?? "", data['endTime']?? "",
        data['price']?? "", data['numberOfPersons']?? "",
        data['location']?? "", data ['country']?? "", data ['city']?? "",
        data['title']?? "",
        data['description']?? "" "",
        List<String>.from(data['photoUrls'] ?? []),);
    return event;
  }

}