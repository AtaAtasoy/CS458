import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:project4/utils/inputValidator.dart';

class FormScreen extends StatefulWidget {
  static String routeName = "/form";
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue1 = 'Male';
  String dropdownValue2 = 'No';

  TextEditingController myController = TextEditingController();
  final nameFieldController = TextEditingController();
  final ageFieldController = TextEditingController();

  @override
  void dispose() {
    nameFieldController.dispose();
    ageFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00a79B),
        title: Text("Submit Information"),
      ),
      body: ListView(children: [
              Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            Row(
              children: [
                Container(
                  width: 80,
                  child: Align(
                    child: Text('Name : '),
                    alignment: Alignment.centerRight,
                  ),
                ),
                SizedBox(width: 10.0),
                Flexible(
                  child: TextFormField(
                      controller: nameFieldController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (!validateNameInput(value)) {
                          return 'Invalid name input!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      key: Key('name-field'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Name')),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Container(
                  width: 80,
                  child: Align(
                    child: Text('Age : '),
                    alignment: Alignment.centerRight,
                  ),
                ),
                SizedBox(width: 10.0),
                Flexible(
                  child: TextFormField(
                      controller: ageFieldController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some value';
                        } else if (int.tryParse(value) == null) {
                          return 'Please enter a valid number!';
                        } else if (int.parse(value) < 0 ||
                            int.parse(value) > 130) {
                          return 'Please enter a valid number!';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      key: Key('age-field'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Age')),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Container(
                  width: 80,
                  child: Align(
                    child: Text('Gender : '),
                    alignment: Alignment.centerRight,
                  ),
                ),
                SizedBox(width: 10.0),
                DropdownButton<String>(
                  key: Key('gender-dropdown'),
                  value: dropdownValue1,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue1 = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Container(
                  width: 80,
                  child: Align(
                    child: Text('Vaccinated : '),
                    alignment: Alignment.centerRight,
                  ),
                ),
                SizedBox(width: 10.0),
                DropdownButton<String>(
                  key: Key('vaccinated-dropdown'),
                  value: dropdownValue2,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  },
                  items: <String>['Yes', 'No']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Container(
                  width: 80,
                  child: Align(
                    child: Text('Symptoms : '),
                    alignment: Alignment.centerRight,
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: MultiSelect(
                    autovalidateMode: AutovalidateMode.always,
                    titleText: 'Choose Symptoms',
                    maxLength: 7,
                    validator: (dynamic value) {
                      return value == null
                          ? 'Please select one or more option(s)'
                          : null;
                    },
                    errorText: 'Please select one or more option(s)',
                    dataSource: [
                      {
                        "display": "None",
                        "value": 1,
                      },
                      {
                        "display": "Tired",
                        "value": 2,
                      },
                      {
                        "display": "Dizzy",
                        "value": 3,
                      },
                      {
                        "display": "Fever",
                        "value": 4,
                      },
                      {
                        "display": "Coughing",
                        "value": 5,
                      },
                      {
                        "display": "Breathing",
                        "value": 6,
                      },
                      {
                        "display": "Sleepy",
                        "value": 7,
                      }
                    ],
                    textField: 'display',
                    valueField: 'value',
                    filterable: true,
                    required: true,
                    onSaved: (value) {
                      print('The saved values are $value');
                    },
                    change: (value) {
                      print('The selected values are $value');
                    },
                    selectIcon: Icons.arrow_drop_down_circle,
                    saveButtonColor: Theme.of(context).primaryColor,
                    checkBoxColor: Theme.of(context).primaryColorDark,
                    cancelButtonColor: Theme.of(context).primaryColorLight,
                    responsiveDialogSize: Size(600, 800),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF00a79B),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data is Valid', key: Key('valid-data-prompt'))),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Data is NOT Valid!!!', key: Key('invalid-data-prompt'))),
                    );
                  }
                },
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Submit Details!")])),
          ],
        ),
      ),
      ],)
    );
  }
}
