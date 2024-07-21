import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  String _age = '';
  String _gender = 'Male';
  String _description = '';
  String _selectedChronicDisease = 'None';
  String _otherChronicDisease = '';

  final List<String> _chronicDiseases = ['None', 'Diabetes', 'Hypertension', 'Asthma'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Icon(Icons.monitor_heart_outlined, color: Colors.white),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text(
                'Swasthya',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            backgroundColor: const Color.fromRGBO(240, 56, 88, 1), // Background color
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onSaved: (value) {
                  _age = value!;
                },
              ),
              SizedBox(height: 16),
              Text('Gender'),
              ToggleButtons(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Male'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Female'),
                  ),
                ],
                isSelected: [_gender == 'Male', _gender == 'Female'],
                onPressed: (int index) {
                  setState(() {
                    _gender = index == 0 ? 'Male' : 'Female';
                  });
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Chronic Diseases'),
                value: _selectedChronicDisease,
                onChanged: (newValue) {
                  setState(() {
                    _selectedChronicDisease = newValue!;
                  });
                },
                items: _chronicDiseases.map((disease) {
                  return DropdownMenuItem<String>(
                    value: disease,
                    child: Text(disease),
                  );
                }).toList(),
              ),
              if (_selectedChronicDisease == 'Other') ...[
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Other Chronic Disease'),
                  validator: (value) {
                    if (_selectedChronicDisease == 'Other' && value!.isEmpty) {
                      return 'Please enter the other chronic disease';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _otherChronicDisease = value!;
                  },
                ),
              ],
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: Text('Submit and Go to Home Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}
