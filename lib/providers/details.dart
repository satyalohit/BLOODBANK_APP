import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details with ChangeNotifier {
  final String firstname;
  final String lastname;
  final int age;
  final String email;
  final String phoneno;
  Details(this.firstname, this.lastname, this.age, this.email, this.phoneno);
}
