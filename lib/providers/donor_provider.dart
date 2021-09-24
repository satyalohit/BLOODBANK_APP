import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import './details.dart';

class DonorProvider with ChangeNotifier {
  List<Details> _donorlist = [
    Details(
        firstname: "satya",
        lastname: "lohit",
        age: 20,
        email: "siddulohit1@gmail.com",
        phoneno: "9246699902",
        state: "ANDHRAPRADESH",
        district: "krishna",
        gender: "male",
        bloodgroup: "O+"),
    Details(
        firstname: "bablu",
        lastname: "prathyush",
        age: 22,
        email: "prathyush@gmail.com",
        phoneno: "8555005847",
        state: "Andhrapradesh",
        district: "krishnalanka",
        gender: "female",
        bloodgroup: "AB+")
  ];

  List<Details> get donorlist {
    return [..._donorlist];
  }

  // Future<void> addDonor() async {
  //   var url = Uri.parse('');
  //   final response = await http.post(url,
  //       body: jsonEncode({
  //         //  "bloodgroup": _currentbloodgroup,
  //         //  "district": districtcontroller.text,
  //         //  "state": statecontroller.text,
  //       }));
  //   Map<String, dynamic> responseBody = jsonDecode(response.body);

  //   List<dynamic> persons = responseBody["persons"] as List<dynamic>;

  //   if (persons != null) {
  //     persons.forEach((person) {
  //       print(person);
  //       _donorlist.add(Details(
  //           firstname: person['firstname'],
  //           lastname: person['lastname'],
  //           age: person['age'],
  //           email: person['email'],
  //           phoneno: person['phone'],
  //           state: person['state'],
  //           district: person['district'],
  //           gender: person['gender'],
  //           bloodgroup: person['bloodgroup']));
  //     });
  // }

  addDonor() {
    _donorlist.add(Details(
        firstname: "bablu",
        lastname: "prathyush",
        age: 22,
        email: "prathyush@gmail.com",
        phoneno: "8555005847",
        state: "Andhrapradesh",
        district: "krishnalanka",
        gender: "female",
        bloodgroup: "AB+"));
    notifyListeners();
  }
}
