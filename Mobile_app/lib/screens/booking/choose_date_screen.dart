import 'package:doc_care/screens/booking/health_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChooseDateScreen extends StatefulWidget {
  @override
  _ChooseDateScreenState createState() => _ChooseDateScreenState();
}

class _ChooseDateScreenState extends State<ChooseDateScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Book an Appointment'),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 4.0,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Expanded(
                      child: Container(
                        height: 4.0,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    SizedBox(width: 4.0),
                    Expanded(
                      child: Container(
                        height: 4.0,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Confirm a date and time for your appointment with a general practitioner. Include a note as well',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'DOCTOR',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorScheme.outline),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://wallpapers.com/images/hd/cute-anime-profile-pictures-vmrch99bgo5mjm4v.jpg'), // Replace with actual image URL
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. Frank Ufondu',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('MBBS, BCS, MD (Medical Officer)'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(
                color: Colors.grey[200],
              ),
              SizedBox(height: 16),
              Text(
                'SERVICE',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorScheme.outline),
              ),
              SizedBox(height: 16),
              Center(
                child: Row(
                  children: [
                    Text(
                      'Medical Officer ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0, // Adjust the font size as needed
                      ),
                    ),
                    Container(
                      height: 2.0, // Adjust the height of the line
                      width: 20.0, // Adjust the width of the line
                      color: colorScheme.primary,
                      margin: EdgeInsets.symmetric(
                          horizontal: 8.0), // Adjust the margin around the line
                    ),
                    Text(
                      'Video Consulation \n(\$700)',
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
              SizedBox(height: 16),
              Text(
                'DATE & TIME',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorScheme.outline),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101),
                        );
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          selectedDate != null
                              ? DateFormat('dd EEE, MMM yyyy')
                                  .format(selectedDate!)
                              : 'Select Date',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final time = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (time != null) {
                          setState(() {
                            selectedTime = time;
                          });
                        }
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          selectedTime != null
                              ? selectedTime!.format(context)
                              : 'Select Time',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Divider(
                color: Colors.grey[200],
              ),
              SizedBox(height: 16),
              Text(
                'NOTE',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorScheme.outline),
              ),
              SizedBox(height: 8),
              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Type your complaints...',
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
              Text(
                'ATTACHMENTS',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: colorScheme.outline),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // Handle attachment
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    Text('Add Attachments'),
                  ],
                ),
              ),
              SizedBox(height: 16),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HealthForm()),
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
                          color: colorScheme
                              .onPrimary, // Adjust the color of the line
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  8.0), // Adjust the margin around the line
                        ),
                        Text(
                          'Health Profile',
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
      ),
    );
  }
}
