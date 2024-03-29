import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/widgets/Providers.dart';
/*
class CreateEventPhotosDisplay extends StatefulWidget {
  const CreateEventPhotosDisplay({Key? key}) : super(key: key);

  @override
  State<CreateEventPhotosDisplay> createState() =>
      _CreateEventPhotosDisplayState();
}

class _CreateEventPhotosDisplayState extends State<CreateEventPhotosDisplay> {
  late XFile file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Photos'),
      ),
      body: _buildReorderableList(),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/create_event_add_title');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReorderableList() {
    return ReorderableListView(
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          //final String movedItem = _reorderedPhotos.removeAt(oldIndex);
          //_reorderedPhotos.insert(newIndex, movedItem);

          // Update the order in the provider
          EventProvider eventProvider =
          Provider.of<EventProvider>(context, listen: false);
          //eventProvider.updatePhotoOrder(_reorderedPhotos);
        });
      },
      //children: _reorderedPhotos
          .map(
            (imageUrl) => ListTile(
          key: ValueKey(imageUrl),
          title: _buildGridItem(imageUrl),
        ),
      )
          .toList(),
    );
  }

  Widget _buildGridItem(String imageUrl) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Image.network(
          imageUrl,
          fit: BoxFit.cover,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    EventProvider eventProvider =
    Provider.of<EventProvider>(context, listen: false);
    file = eventProvider.file;
  }
}
*/









