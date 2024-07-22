import 'package:doc_care/screens/booking/choose_date_screen.dart';
import 'package:flutter/material.dart';

class MedicalOfficersScreen extends StatefulWidget {
  @override
  _MedicalOfficersScreenState createState() => _MedicalOfficersScreenState();
}

class _MedicalOfficersScreenState extends State<MedicalOfficersScreen> {
  String? selectedDoctor;

  final List<Map<String, String>> doctors = [
    {'name': 'Dr. Frank Ufondu', 'hospital': 'HisGlory Specialist Hospitals'},
    {
      'name': 'Dr. Chukwuma Obinna',
      'hospital': 'HisGlory Specialist Hospitals'
    },
    {'name': 'Dr. Emeka Agbo', 'hospital': 'HisGlory Specialist Hospitals'},
    {
      'name': 'Dr. Chukwunomso Iwegbu',
      'hospital': 'Havana Specialist Hospitals'
    },
    {'name': 'Dr. Uchendu Ebuka', 'hospital': 'Havana Specialist Hospitals'},
    {'name': 'Dr. Chidinma Nwokoro', 'hospital': 'Havana Specialist Hospitals'},
    {'name': 'Dr. Adekunle Philips', 'hospital': 'Randle General Hospitals'},
    {'name': 'Dr. Ayobami Ayodele', 'hospital': 'Marigold Hospital'},
  ];

  void onDoctorSelected(String doctor) {
    setState(() {
      selectedDoctor = doctor;
    });
  }

  void onNextPage() {
    if (selectedDoctor != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChooseDateScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Officers'),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceChip(
                label: Text('Available Today'),
                selected: true,
              ),
              ChoiceChip(
                label: Text('In-Person'),
                selected: false,
              ),
              ChoiceChip(
                label: Text('Via Text'),
                selected: false,
              ),
            ],
          ),
          Divider(
            color: Colors.grey[200],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Hospitals close-by',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...doctors.sublist(0, 3).map((doctor) {
                  return GestureDetector(
                    onTap: () => onDoctorSelected(doctor['name']!),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedDoctor == doctor['name']
                                ? colorScheme
                                    .primary // Border color when selected
                                : Colors
                                    .transparent, // No border when not selected
                            width: 1, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              8), // Optional: Adjust border radius
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Medical Officer'),
                              Text(
                                doctor['name']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4 ? Icons.star : Icons.star_border,
                                    size: 16,
                                    color: Colors.amber,
                                  );
                                }),
                              ),
                              Text(doctor['hospital']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Available doctors',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ...doctors.sublist(3).map((doctor) {
                  return GestureDetector(
                    onTap: () => onDoctorSelected(doctor['name']!),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedDoctor == doctor['name']
                                ? colorScheme
                                    .primary // Border color when selected
                                : Colors
                                    .transparent, // No border when not selected
                            width: 1, // Border width
                          ),
                          borderRadius: BorderRadius.circular(
                              8), // Optional: Adjust border radius
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Medical Officer'),
                              Text(
                                doctor['name']!,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4 ? Icons.star : Icons.star_border,
                                    size: 16,
                                    color: Colors.amber,
                                  );
                                }),
                              ),
                              Text(doctor['hospital']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                onPressed: selectedDoctor != null ? onNextPage : null,
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
                        'Book an Appointment',
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
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final String selectedDoctor;

  NextPage({required this.selectedDoctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Doctor'),
      ),
      body: Center(
        child: Text('You selected: $selectedDoctor'),
      ),
    );
  }
}
