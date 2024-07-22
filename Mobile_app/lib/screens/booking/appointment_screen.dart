import 'package:doc_care/screens/booking/select_concern_screen.dart';
import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final List<String> selectedReasons = [];

  void _toggleSelection(String reason) {
    setState(() {
      if (selectedReasons.contains(reason)) {
        selectedReasons.remove(reason);
      } else {
        selectedReasons.add(reason);
      }
    });
  }

  void _proceedToNextStep() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectConcernScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is the patient's current location?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 8.0),
                Text("Surulere, Lagos, Nigeria"),
                TextButton(
                  onPressed: () {
                    // Handle change location
                  },
                  child: Text("Change"),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              "What's the main reason for your visit?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildGridItem(
                    'New Health of Concern',
                    'Find a Doctor',
                    Icons.local_hospital,
                    Colors.redAccent,
                  ),
                  _buildGridItem(
                    'Routine checkup, Follow-up',
                    'Find a Doctor',
                    Icons.check_circle,
                    Colors.blueAccent,
                  ),
                  _buildGridItem(
                    'Existing or Chronic condition',
                    'Talk to a Specialist',
                    Icons.health_and_safety,
                    Colors.greenAccent,
                  ),
                  _buildGridItem(
                    'Prescriptions or Refills',
                    'Talk to a Pharmacist',
                    Icons.medical_services,
                    Colors.purpleAccent,
                  ),
                  _buildGridItem(
                    'General Mental Health Concerns',
                    'Find a Doctor',
                    Icons.psychology,
                    Colors.blueAccent,
                  ),
                  _buildGridItem(
                    'COVID-19 Symptoms',
                    'Find a Doctor',
                    Icons.coronavirus,
                    Colors.orangeAccent,
                  ),
                  _buildGridItem(
                    'Sex Health Education',
                    'Find a Doctor',
                    Icons.favorite,
                    Colors.pinkAccent,
                  ),
                  _buildGridItem(
                    'Other Medical Reasons',
                    'Find a Doctor',
                    Icons.question_answer,
                    Colors.grey,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Container(
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
                onPressed: selectedReasons.isEmpty ? null : _proceedToNextStep,
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
                        color: colorScheme
                            .onPrimary, // Adjust the color of the line
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                8.0), // Adjust the margin around the line
                      ),
                      Text(
                        'Select a Cader',
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
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      String title, String subtitle, IconData icon, Color color) {
    final bool isSelected = selectedReasons.contains(title);
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: () {
        _toggleSelection(title);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? color : color,
          border: isSelected
              ? Border.all(color: colorScheme.primary, width: 3)
              : Border(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40.0, color: Colors.black54),
              SizedBox(height: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextStepScreen extends StatelessWidget {
  final List<String> selectedReasons;

  NextStepScreen({required this.selectedReasons});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Step'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You selected the following reasons:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: selectedReasons.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(selectedReasons[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle next step action
              },
              child: Text('Proceed'),
            ),
          ],
        ),
      ),
    );
  }
}
