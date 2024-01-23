import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/entities/Event.dart';
import 'package:sports_app/widgets/Providers.dart';

class CreateEventLoadPhotos extends StatefulWidget {
  const CreateEventLoadPhotos({Key? key}) : super(key: key);

  @override
  State<CreateEventLoadPhotos> createState() => _CreateEventLoadPhotosState();
}

class _CreateEventLoadPhotosState extends State<CreateEventLoadPhotos> {

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  Future<void> takeNewPhoto() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      //Provider.of<EventProvider>(context, listen: false).addPhoto(pickedFile);
    }
  }

  Future<void> pickImageFromLibrary() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    Provider.of<EventProvider>(context, listen: false).addPhoto(imageFileList!);
    /*
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {

      String photoPath = pickedFile.path;
      Provider.of<EventProvider>(context, listen: false).addPhoto(pickedFile);
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Navigator.pop(context); // Return to home
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Add some photos of your plan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCard(
                  'Add photos from library',
                  '',
                  onTap: pickImageFromLibrary,
                ),
                _buildCard(
                  'Take a new photo',
                  '',
                  onTap: takeNewPhoto,
                ),
                _buildCard(
                  'Fetch a generic photo',
                  'This will reduce the probability of somebody assisting',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
        ]),
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, {VoidCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: onTap, // Execute the function when the card is tapped
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle.isNotEmpty) SizedBox(height: 8),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

