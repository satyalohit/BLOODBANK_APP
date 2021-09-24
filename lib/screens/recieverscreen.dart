import 'package:bloodbank/providers/details.dart';
import 'package:bloodbank/providers/donor_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RecieverScreen extends StatefulWidget {
  static const routename = '/recieverscreen';

  @override
  _RecieverScreenState createState() => _RecieverScreenState();
}

class _RecieverScreenState extends State<RecieverScreen> {
//  Future<void> customlaunch(String command) async {
//     if (await canLaunch(command)) {
//       await launch(command);
//     } else {
//       print('Could not launch ${command}');
//     }
//   }

  var bloodGroup = [
    "BLOODGROUP",
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];
  List<Details> _donors = [];
  var currentbloodgroup = "BLOODGROUP";
  var gender = ["Gender", "Male", "Female", "others"];
  var currentgender = "Gender";
  final districtcontroller = TextEditingController();
  final statecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('hello');
    return ChangeNotifierProvider<DonorProvider>(
      create: (context) => DonorProvider(),
      builder: (ctx, child) => Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                              this.currentgender = gen;
                            });
                          },
                          value: currentgender,
                        ),
                        DropdownButton<String>(
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
                              this.currentbloodgroup = group;
                            });
                          },
                          value: currentbloodgroup,
                        ),
                      ],
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
                    ),
                    FlatButton(
                      height: 50,
                      onPressed: () {
                        Provider.of<DonorProvider>(ctx, listen: false)
                            .addDonor();
                        setState(() {
                          _donors =
                              Provider.of<DonorProvider>(ctx, listen: false)
                                  .donorlist;
                        });
                      },
                      child: Text(
                        'Get details',
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
            SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Center(
                    child: ListView.builder(
                      itemCount: _donors.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ListTile(
                                leading: Icon(Icons.alarm),
                                title: Text(_donors[index].firstname +
                                    ' ' +
                                    _donors[index].lastname),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Age :" +
                                        _donors[index].age.toString()),
                                    Text("Phone :" + _donors[index].phoneno),
                                    Text("Email :" + _donors[index].email)
                                  ],
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                  launch('tel:'+_donors[index].phoneno);
                                  },
                                  icon: Icon(Icons.call),
                                )),
                            Divider()
                          ],
                        );
                      },
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
