import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details{
  final String firstname;
  final String lastname;
  final int age;
  final String email;
  final String phoneno;
  final String state;
  final String district;
  final String gender;
  final String bloodgroup;

  Details(
      {@required this.firstname,
      @required this.lastname,
      @required this.age,
      @required this.email,
      @required this.phoneno,
      @required this.state,
      @required this.district,
      @required this.gender,
      @required this.bloodgroup});
}
