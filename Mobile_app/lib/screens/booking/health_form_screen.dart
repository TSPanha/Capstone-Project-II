import 'package:doc_care/screens/booking/review_profile_screen.dart';
import 'package:flutter/material.dart';

class HealthForm extends StatefulWidget {
  @override
  _HealthFormState createState() => _HealthFormState();
}

class _HealthFormState extends State<HealthForm> {
  int selectedDays = 3;
  Map<String, bool> generalSymptoms = {
    'Difficulty sleeping': false,
    'Fatigue / weakness': false,
    'Fever': false,
    'Loss of appetite': false,
    'Mood changes': false,
    'Night sweats': false,
  };
  Map<String, bool> headNeckSymptoms = {
    'Congestions': false,
    'Ear pain': false,
    'Eye redness': false,
    'Headaches': false,
    'Loss of smell': false,
    'Loss of taste': false,
  };
  bool? isTakingMedications;
  bool? isAllergic;
  bool? hasMedicalConditions;
  bool? hadSurgeries;
  bool? familyMedicalConditions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: Text('Health Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
                'Kindly provide the patient\'s medical information and history.',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text('How long have you felt this way?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            DropdownButton<int>(
              value: selectedDays,
              onChanged: (value) {
                setState(() {
                  selectedDays = value!;
                });
              },
              items: [for (var i = 1; i <= 30; i++) i]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value Days',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Do you have any of these symptoms?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text('General symptoms',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: generalSymptoms.keys.take(3).map((String key) {
                      return CheckboxListTile(
                        title: Text(key, style: TextStyle(fontSize: 14)),
                        value: generalSymptoms[key],
                        onChanged: (bool? value) {
                          setState(() {
                            generalSymptoms[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: generalSymptoms.keys.skip(3).map((String key) {
                      return CheckboxListTile(
                        title: Text(key, style: TextStyle(fontSize: 14)),
                        value: generalSymptoms[key],
                        onChanged: (bool? value) {
                          setState(() {
                            generalSymptoms[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Text('Head / Neck',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: headNeckSymptoms.keys.take(3).map((String key) {
                      return CheckboxListTile(
                        title: Text(key, style: TextStyle(fontSize: 14)),
                        value: headNeckSymptoms[key],
                        onChanged: (bool? value) {
                          setState(() {
                            headNeckSymptoms[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: headNeckSymptoms.keys.skip(3).map((String key) {
                      return CheckboxListTile(
                        title: Text(key, style: TextStyle(fontSize: 14)),
                        value: headNeckSymptoms[key],
                        onChanged: (bool? value) {
                          setState(() {
                            headNeckSymptoms[key] = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Are you currently taking any medications?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text(
                'Please consider any medications you are currenty taking, including those taken in a regular basis.'),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Yes'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: isTakingMedications,
                      onChanged: (bool? value) {
                        setState(() {
                          isTakingMedications = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('No'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: isTakingMedications,
                      onChanged: (bool? value) {
                        setState(() {
                          isTakingMedications = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            if (isTakingMedications == true)
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Medication 1'),
                    onChanged: (value) {
                      // Handle medication name input
                    },
                  ),
                  TextField(
                    decoration:
                        InputDecoration(labelText: 'How Long (in days)'),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      // Handle medication duration input
                    },
                  ),
                ],
              ),
            SizedBox(height: 16),
            Text('Are you allergic to any of the drugs listed?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text(
                'See list the medications you might be allergic to below. \nExamples: Amoxicillin, Bactrim, Aspirin'),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Yes'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: isAllergic,
                      onChanged: (bool? value) {
                        setState(() {
                          isAllergic = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('No'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: isAllergic,
                      onChanged: (bool? value) {
                        setState(() {
                          isAllergic = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Do you have any medical conditions?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text(
                'Not sure? Choose yes to browse a list of conditions and diseases. \nExamples: High Cholesterol, Insomnia, Asthma'),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Yes'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: hasMedicalConditions,
                      onChanged: (bool? value) {
                        setState(() {
                          hasMedicalConditions = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('No'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: hasMedicalConditions,
                      onChanged: (bool? value) {
                        setState(() {
                          hasMedicalConditions = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Have you had any surgeries?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text('Examples: Appendectomy, Tonsillectomy, Knee replacement.'),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Yes'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: hadSurgeries,
                      onChanged: (bool? value) {
                        setState(() {
                          hadSurgeries = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('No'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: hadSurgeries,
                      onChanged: (bool? value) {
                        setState(() {
                          hadSurgeries = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Has anyone in your family had any medical conditions?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            SizedBox(height: 8),
            Text(
                'Please only include first-degree relatives (parents, siblings, and children)'),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Yes'),
                    leading: Radio<bool>(
                      value: true,
                      groupValue: familyMedicalConditions,
                      onChanged: (bool? value) {
                        setState(() {
                          familyMedicalConditions = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('No'),
                    leading: Radio<bool>(
                      value: false,
                      groupValue: familyMedicalConditions,
                      onChanged: (bool? value) {
                        setState(() {
                          familyMedicalConditions = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
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
                    MaterialPageRoute(builder: (context) => ReviewProfile()),
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
                        'Review Profile',
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
}
