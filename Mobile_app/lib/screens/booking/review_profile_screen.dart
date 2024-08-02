import 'package:doc_care/screens/booking/payment_screen.dart';
import 'package:flutter/material.dart';

class ReviewProfile extends StatefulWidget {
  @override
  _ReviewProfileState createState() => _ReviewProfileState();
}

class _ReviewProfileState extends State<ReviewProfile> {
  String days = '3 Days';
  List<String> symptoms = ['Difficulty sleeping', 'Fever', 'Loss of taste'];
  bool takingMedications = false;
  bool allergic = false;
  bool medicalConditions = false;
  bool surgeries = false;
  bool familyHistory = false;

  void _changeValue(String field) {
    // Navigate to the form or handle change action here
    print('Change $field');
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Review Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Make sure all details are correct as these information would aid the Medical Practitioner.',
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 16),
            _buildReviewRow('How long have you felt this way?', days),
            _buildReviewRow('List of symptoms', symptoms.join(', ')),
            _buildReviewRow(
                'Active Medications', takingMedications ? 'Yes' : 'No'),
            _buildReviewRow('Drug Allergies', allergic ? 'Yes' : 'No'),
            _buildReviewRow(
                'Medical Conditions', medicalConditions ? 'Yes' : 'No'),
            _buildReviewRow('Surgeries', surgeries ? 'Yes' : 'No'),
            _buildReviewRow('Family History', familyHistory ? 'Yes' : 'No'),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: colorScheme.primary,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll<Color>(colorScheme.primary),
              foregroundColor:
                  WidgetStatePropertyAll<Color>(colorScheme.onPrimary),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentScreen()),
              );
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0, // Adjust the font size as needed
                    ),
                  ),
                  Container(
                    height: 1.0, // Adjust the height of the line
                    width: 20.0, // Adjust the width of the line
                    color:
                        colorScheme.onPrimary, // Adjust the color of the line
                    margin: EdgeInsets.symmetric(
                        horizontal: 8.0), // Adjust the margin around the line
                  ),
                  Text(
                    'Confirm Payment',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16.0, // Adjust the font size as needed
                    ),
                  ),
                  Icon(Icons.chevron_right_outlined,
                      size: 24.0, color: colorScheme.onPrimary),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(value, style: TextStyle(fontSize: 16)),
            ),
            GestureDetector(
              onTap: () => _changeValue(title),
              child: Text('(Change)', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
        SizedBox(height: 16),
        Divider(
          thickness: 0.3,
          color: Colors.black,
        ),
      ],
    );
  }
}
