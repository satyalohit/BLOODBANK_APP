import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class DonateScreen extends StatefulWidget {
  static const routename = '/donorscreen';

  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  Future<void> Datatransfer() async {
    var url = Uri.parse('');
    final response = await http.post(url,
        body: jsonEncode({
          "firstname": firstnamecontroller.text,
          "lastname": lastnamecontroller.text,
          "age": agecontroller.text,
          "bloodgroup": _currentbloodgroup,
          "email": emailcontroller.text,
          "phone": phonenocontroller.text,
          "district": districtcontroller.text,
          "gender": _currentgender,
          "state": statecontroller.text,
        }));
    final responseBody = jsonDecode(response.body);

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseBody["message"].toString())));
  }

  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonenocontroller = TextEditingController();
  final districtcontroller = TextEditingController();
  final statecontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  var bloodGroup = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  var _currentbloodgroup = "";
  var gender = ["Male", "Female", "others"];
  var _currentgender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'FirstName',
                      hintText: 'Enter your FirstName',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    controller: firstnamecontroller,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your firstname';
                      }
                    },
                  ),
                  TextFormField(
                    controller: lastnamecontroller,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'LastName',
                      hintText: 'Enter your LastName',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your Lastname';
                      }
                    },
                  ),
                  TextFormField(
                    controller: agecontroller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Age',
                      hintText: 'Enter your Age',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your age';
                      } else if (int.tryParse(value) < 18) {
                        return 'Only 18+ people can donate';
                      }
                    },
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      hintText: 'Enter your Email address',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter emailaddress';
                      }
                    },
                  ),
                  TextFormField(
                    maxLength: 10,
                    maxLengthEnforced: true,
                    controller: phonenocontroller,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'PhoneNo',
                      hintText: 'Enter your PhoneNo',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your PhoneNumber';
                      }
                    },
                  ),
                  TextFormField(
                    controller: statecontroller,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'State',
                      hintText: 'Enter your State',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your State';
                      }
                    },
                  ),
                  TextFormField(
                    controller: districtcontroller,
                    keyboardType: TextInputType.name,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'District',
                      hintText: 'Enter your District',
                      hintStyle: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your District';
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                        menuMaxHeight: 200,
                        items: gender.map((gen) {
                          return DropdownMenuItem(
                            child: Text(gen),
                            value: gen,
                          );
                        }).toList(),
                        onChanged: (String gen) {
                          setState(() {
                            this._currentgender = gen;
                          });
                        },
                        value: _currentgender,
                        hint: Text('BLOODGROUP'),
                      ),
                      DropdownButton<String>(
                        hint: Text('GENDER'),
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                        menuMaxHeight: 200,
                        items: bloodGroup.map((group) {
                          return DropdownMenuItem<String>(
                            child: Text(group),
                            value: group,
                          );
                        }).toList(),
                        onChanged: (String group) {
                          setState(() {
                            this._currentbloodgroup = group;
                          });
                        },
                        value: _currentbloodgroup,
                      ),
                    ],
                  ),
                  FlatButton(
                    height: 50,
                    onPressed: () {
                      if (!_formkey.currentState.validate()) {
                        return;
                      }
                    },
                    child: Text(
                      'Donate',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
