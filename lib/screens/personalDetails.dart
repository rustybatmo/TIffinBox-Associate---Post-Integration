import 'package:flutter/material.dart';
import 'package:phnauthnew/modals/cook.dart';
import 'package:phnauthnew/screens/landingPage.dart';
import 'package:phnauthnew/screens/services/databaseService.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../styling.dart';

class PersonalDetails extends StatelessWidget {
  PersonalDetails({
    @required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
          child: backButton(context),
        ),
      ),
      body: _buildContent(context),
    );
  }

  final String phoneNumber;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            'Complete your Personal Details',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 20.0),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset:
                          Offset(0.0, -3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: TextFormField(
                    style: TextStyle(letterSpacing: 1.0),
                    textAlign: TextAlign.start,
                    decoration: cardbar.copyWith(hintText: 'Enter your name'),
                    controller: _nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid name';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(0.0, -3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: TextFormField(
                    decoration:
                        cardbar.copyWith(hintText: 'Enter your email address'),
                    controller: _emailController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54.withOpacity(0.1),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(0.0, -3.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: TextFormField(
                    decoration: cardbar.copyWith(
                        suffixIcon: Container(
                      // color: Colors.red,
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                'Verified',
                                style: TextStyle(color: Colors.green),
                              )
                            ]),
                      ),
                    )),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a valid phonenumber';
                      }
                      return null;
                    },
                    // controller: _phoneNumber,
                    initialValue: phoneNumber,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Align(
          alignment: Alignment(-0.45, -1),
          child: Text(
            'Verified number cannot be changed.',
            style: TextStyle(fontSize: 13.0),
          ),
        ),
        SizedBox(height: 200.0),
        FloatingActionButton(
          onPressed: () {
            _submitCookDetails(context);
          },
          backgroundColor: Colors.amber[600],
          elevation: 0.0,
          child: Icon(
            Icons.arrow_forward_ios,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  void _submitCookDetails(BuildContext context) async {
    var uuid = Uuid();
    if (_formKey.currentState.validate()) {
      // print("It is valid");
      final Cook cook = Cook(
        emailAddress: _emailController.text,
        phoneNumber: phoneNumber,
        name: _nameController.text,
        uuid: uuid.v1(),
      );
      Map<String, dynamic> cookDataInMapFormat = cook.toMap();
      print(cookDataInMapFormat);
      final database = Provider.of<Database>(context);
      await database.addCook(cookDataInMapFormat);

      // LandingPage();
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingPage(
              phoneNumber: phoneNumber,
              personalDetailsProvided: true,
            ),
          ));
    } else {
      print('Invalid form');
    }
  }
}
