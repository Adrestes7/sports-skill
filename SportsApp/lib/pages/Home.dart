import 'package:flutter/material.dart';
import 'package:sports_app/pages/CreatedEventInfo.dart';
import 'package:sports_app/services/EventsService.dart';
import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/widgets/CategoryTypeList.dart';

class Home extends StatefulWidget {
  const Home({Key? key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Event> events = [];
  late Future<List<Event>> _events;

  void initState() {
    super.initState();
    _events = EventService.getHomeData().then((value) {
      setState(() {
        events = value;
      });
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        elevation: 2.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: const Offset(0.0, 1.0),
              )
            ],
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: CategoryTypes(),
              ),
              Positioned(
                top: 25.0,
                right: 15.0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.tune),
                ),
              ),
              Positioned(
                left: 16.0,
                right: 72.0,
                top: 13.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home_search_filter');
                  },
                  child: Hero(
                    tag: 'home_search',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 8.0,
                            spreadRadius: 5.0,
                            offset: const Offset(0.0, 4.0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 2.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'What do you want to do?',
                                style: textTheme.bodyMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Any date • Any where • Invite friends',
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: FutureBuilder<List<Event>>(
        future: _events,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Profile not found'));
          } else {
            events = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                  clipBehavior: Clip.antiAlias,
                  width: size.width,
                  height: size.width - 10.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: PageView(
                    children: events[index].photoUrls.map((imageUrls) {
                      return Image.network(
                        imageUrls,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Placeholder(); // Display a placeholder image or error message
                        },
                      );
                    }).toList(),
                  ),
                ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              events[index].location,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              events[index].title,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              '\$${events[index].price} COP total',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month),
                            SizedBox(width: 4.0),
                            Text(events[index].date.toString()),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                  ]
                );
              }
            );
          }
        },
      ),
    );
  }
}
