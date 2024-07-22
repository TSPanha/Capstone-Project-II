import 'package:doc_care/screens/booking/choose_doctor_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectConcernScreen(),
    );
  }
}

class SelectConcernScreen extends StatelessWidget {
  final List<Map<String, dynamic>> frequentlyUsedConcerns = [
    {
      'icon': Icons.local_hospital,
      'title': 'Medical Officers',
      'doctors': 365,
      'route': MedicalOfficersScreen(),
    },
    {'icon': Icons.child_care, 'title': 'Child Specialist', 'doctors': 75},
  ];

  final List<Map<String, dynamic>> caders = [
    {
      'icon': Icons.favorite,
      'title': 'Cardiologist',
      'subtitle': 'Heart Specialist',
      'doctors': 75,
      'route': MedicalOfficersScreen(),
    },
    {
      'icon': Icons.psychology,
      'title': 'Neurologist',
      'subtitle': 'Brain Specialist',
      'doctors': 33
    },
    {
      'icon': Icons.local_hospital_sharp,
      'title': 'Dentist',
      'subtitle': 'Dental Surgeon',
      'doctors': 119
    },
    {
      'icon': Icons.remove_red_eye,
      'title': 'Ophthalmologist',
      'subtitle': 'Eye Specialist',
      'doctors': 102
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Concern'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Frequently used Concern.',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...frequentlyUsedConcerns.map((concern) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(concern['icon'], color: Colors.white),
                    ),
                    title: Text(concern['title']!),
                    subtitle: Text('${concern['doctors']} available doctors'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => concern['route']),
                      );
                    },
                  );
                }).toList(),
                Divider(
                  color: Colors.grey[200],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Caders',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'See more',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                ...caders.map((cader) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(cader['icon'], color: Colors.white),
                    ),
                    title: Text(cader['title']!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cader['subtitle']!),
                        Text('${cader['doctors']} available doctors'),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle tap
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
