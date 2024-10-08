import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eirmuplb/database/asset_database.dart';
import 'package:eirmuplb/database/user_info_database.dart';
import 'package:eirmuplb/home.dart';
import 'package:eirmuplb/reusable_widgets/reusable_widget.dart';
import 'package:eirmuplb/termsconditions.dart';
import 'package:eirmuplb/utils/colors_utils.dart';
import 'package:eirmuplb/model/userphonenumber.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

const List<String> listSex = <String>['Male', 'Female', 'Other', 'Prefer not to Say'];
const List<String> listRegion = <String>['Region I – Ilocos Region', 'Region II – Cagayan Valley', 'Region III – Central Luzon', 'Region IV‑A – CALABARZON', 'MIMAROPA Region', 'Region V – Bicol Region', 'Region VI – Western Visayas', 'Region VII – Central Visayas', 'Region VIII – Eastern Visayas', 'Region IX – Zamboanga Peninsula', 'Region X – Northern Mindanao', 'Region XI – Davao Region', 'Region XII – SOCCSKSARGEN', 'Region XIII – Caraga', 'NCR – National Capital Region', 'CAR – Cordillera Administrative Region', 'BARMM – Bangsamoro Autonomous Region in Muslim Mindanao'];
const List<String> listDemographic = <String>['Farmer', 'Researcher', 'Other'];

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
// On start - check if phone number is saved on sqflite db by checking if userphonenumber table is empty
// if (yes) { }
//if (no) { redirect to homepage()}
class _SignUpScreenState extends State<SignUpScreen> {
  late UserPhoneNumberModel userphonenumber;
  var registrationCheck;
  TextEditingController _lastnameTextController = TextEditingController();
  TextEditingController _firstnameTextController = TextEditingController();
  TextEditingController _middlenameTextController = TextEditingController();
  TextEditingController _extensionTextController = TextEditingController();
  TextEditingController _birthdayTextController = TextEditingController();
  TextEditingController _phonenumberTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _postalcodeTextController = TextEditingController();
  TextEditingController _municipalityTextController = TextEditingController();
  TextEditingController _barangayTextController = TextEditingController();

  String dropdownSexValue = listSex.first;
  String dropdownRegionValue = listRegion.first;
  String dropdownDemographicValue = listDemographic.first;

  final GlobalKey<FormState> _formKey = GlobalKey();

  void initState() {
    super.initState();
    //open userphonenumber table
    registrationCheck = userIsRegistered();
  }

  @override
  void dispose() {
    _lastnameTextController.dispose();
    _firstnameTextController.dispose();
    _middlenameTextController.dispose();
    _extensionTextController.dispose();
    _birthdayTextController.dispose();
    _phonenumberTextController.dispose();
    _emailTextController.dispose();
    _postalcodeTextController.dispose();
    _municipalityTextController.dispose();
    _barangayTextController.dispose();
    super.dispose();
  }

  Future <bool> userIsRegistered() async {
    var userCount = await EIRMUserInfoDatabase.instance.tableIsEmpty();
    if (userCount! > 0) {
      return true;
    }
    else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (registrationCheck == true){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeRoute()));
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0xFF27ae60),
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text('USER REGISTRATION', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text('* Required details'),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text('NAME', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  TextFormField(
                    controller: _lastnameTextController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name *',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: FormBuilderValidators.required(errorText: "Please enter your last name"),
                  ),
                  TextFormField(
                    controller: _firstnameTextController,
                    decoration: const InputDecoration(
                      labelText: 'First Name *',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: FormBuilderValidators.required(errorText: "Please enter your first name"),
                  ),
                  TextFormField(
                    controller: _middlenameTextController,
                    decoration: const InputDecoration(
                      labelText: 'Middle Name (optional)',
                    ),
                  ),
                  TextFormField(
                    controller: _extensionTextController,
                    decoration: const InputDecoration(
                      labelText: 'Extension (optional)',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text('BIRTHDAY', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  // TextFormField(
                  //   controller: _birthdayTextController,
                  //   decoration: const InputDecoration(
                  //     labelText: 'MMDDYYYY or MM/DD/YYYY *',
                  //   ),
                  //   // The validator receives the text that the user has entered.
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter your birth date';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  TextFormField(
                    readOnly: true,
                    controller: _birthdayTextController,
                    validator: FormBuilderValidators.required(errorText: "Please enter your birth date"),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'MM/DD/YYYY*',
                    ),
                    onTap: () async{
                      DateTime? _startDate = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime.now(), initialEntryMode: DatePickerEntryMode.inputOnly,);
                      if (_startDate != null) {
                        setState(() {
                          _birthdayTextController.text = DateFormat('MM-dd-yyyy').format(_startDate);
                          print(_startDate);
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text('CONTACT DETAILS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: _phonenumberTextController,
                    decoration: const InputDecoration(
                      labelText: 'Mobile Number (09XXXXXXXXX) *',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.minLength(11, errorText: "Phone number must be 11 digits long at minimum"),
                      FormBuilderValidators.required(errorText: "Please enter your phone number")
                    ]),
                  ),
                  TextFormField(
                    controller: _emailTextController,
                    validator: FormBuilderValidators.email(),
                    decoration: const InputDecoration(
                      labelText: 'Email Address (optional)',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text('SEX', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownSexValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownSexValue = value!;
                          });
                        },
                        items: listSex.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text('LOCATION', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownRegionValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownRegionValue = value!;
                          });
                        },
                        items: listRegion.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, overflow: TextOverflow.visible),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: _postalcodeTextController,
                    decoration: const InputDecoration(
                      labelText: 'Postal Code *',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                  TextFormField(
                    controller: _municipalityTextController,
                    decoration: const InputDecoration(
                      labelText: 'Municipality/City *',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: FormBuilderValidators.required(),
                  ),
                  TextFormField(
                    controller: _barangayTextController,
                    decoration: const InputDecoration(
                      labelText: 'Barangay *',
                    ),
                    // The validator receives the text that the user has entered.
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text('DEMOGRAPHICS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownDemographicValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        underline: Container(
                          height: 2,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownDemographicValue = value!;
                          });
                        },
                        items: listDemographic.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('By Signing up, you agree to our', textAlign: TextAlign.center,),
                  InkWell(
                    child: Text('Terms and Conditions of Use.', textAlign: TextAlign.center, style: TextStyle(decoration: TextDecoration.underline, )),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TCURoute()));
                    },),
                  SizedBox(
                    height: 20,
                  ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: Color(0xFF27ae60),),
                  child: ElevatedButton(
                    onPressed: () async {
                      print(FieldValue.serverTimestamp());
                      // Only if the input form is valid (the user has entered text)
                      if (_formKey.currentState!.validate()) {
                        // We will use this var to show the result
                        // of this operation to the user
                        String message;
                        userphonenumber = UserPhoneNumberModel(phone: _phonenumberTextController.text);
                        await EIRMUserInfoDatabase.instance.adduserphonenumber(userphonenumber);
                        try {
                          // Get a reference to the `users` collection
                          final collection =
                          FirebaseFirestore.instance.collection('users');

                          // Write the server's timestamp and the user's feedback
                          await collection.doc(_phonenumberTextController.text).set({
                            'timestamp': FieldValue.serverTimestamp(),
                            'lastname': _lastnameTextController.text,
                            'firstname': _firstnameTextController.text,
                            'middlename': _middlenameTextController.text,
                            'extension': _extensionTextController.text,
                            'birthday': _birthdayTextController.text,
                            'phonenumber': _phonenumberTextController.text,
                            'email': _emailTextController.text,
                            'sex': dropdownSexValue,
                            'region': dropdownRegionValue,
                            'postalcode': _postalcodeTextController.text,
                            'municipality': _municipalityTextController.text,
                            'barangay': _barangayTextController.text,
                            'demographic': dropdownDemographicValue
                          }).onError((e, _) => print("Error writing document: $e"));

                          message = 'Registration finished';
                        } catch (e) {
                          message = 'Error when sending feedback';
                        }

                        print(message);

                        // Show a snackbar with the result
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(message)));
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeRoute()));
                      }
                    },
                    child: Text('SIGN UP',
                      style: const TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors.black26;
                          }
                          return Color(0xFF27ae60);
                        }),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                  ),
                ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 50,
                  //   margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
                  //   child: ElevatedButton(
                  //     onPressed: () async {
                  //       // var databasesPath = await getDatabasesPath();
                  //       // var path = join(databasesPath!, 'demo_asset_example.db');
                  //       // deleteDatabase(path);
                  //       var count = await EIRMAssetDatabase.instance.tableIsEmpty();
                  //       print (count);
                  //     },
                  //     child: Text('table count',
                  //       style: const TextStyle(
                  //           color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
                  //     ),
                  //     style: ButtonStyle(
                  //         backgroundColor: MaterialStateProperty.resolveWith((states) {
                  //           if (states.contains(MaterialState.pressed)) {
                  //             return Colors.black26;
                  //           }
                  //           return Colors.white;
                  //         }),
                  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Your privacy is important to us. The collection, use, and disclosure of your personal data shall be in accordance with RA 10173 - Data Privacy Act of 2012', textAlign: TextAlign.center,),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Data Privacy Notice: By filling out this form, I am giving my consent to the collection, use, and disclosure of my personal data in accordance with RA 10173 - Data Privacy Act of 2012.', textAlign: TextAlign.center),
                  SizedBox(
                    height: 20,
                  ),
                  // DialogExample(),
                  // SizedBox(
                  //   height: 40,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class DialogExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
