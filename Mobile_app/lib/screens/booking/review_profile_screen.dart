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
    );
  }

  Widget _buildReviewRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 16)),
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
      ],
    );
  }
}
