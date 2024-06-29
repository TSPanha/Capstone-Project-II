import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class FillProfileScreen extends StatefulWidget {
  @override
  _FillProfileScreenState createState() => _FillProfileScreenState();
}

class _FillProfileScreenState extends State<FillProfileScreen> {
  TextEditingController _dateController = TextEditingController();
  File? _profileImage;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/icons/app_icon.svg', // path to your SVG asset
          height: 35,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Fill Your Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.person, size: 50, color: Colors.grey)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Icon(Icons.edit, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                _selectDate(context);
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorScheme.primary, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              items: <String>['Male', 'Female', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Handle save action
              },
              child: Text('Save'),
              style: ElevatedButton.styleFrom(
                // primary: Colors.black,
                // onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
