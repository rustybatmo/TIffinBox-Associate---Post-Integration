import 'package:flutter/material.dart';
import 'package:phnauthnew/screens/phone_auth/SMSCode.dart';

class PhonePage extends StatelessWidget {
  final String _prefix = '+91';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Transform.scale(
                  scale: 0.7,
                  child: Image.asset(
                    'assets/images/logo.png',
                    fit: BoxFit.contain,
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: _buildContent(context),
    );
  }

  void _phoneNumberEntered(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SMSCode(
              phoneNumber: '+91 ' + _phoneNumber.text,
            ),
          ));
    }
  }

  final TextEditingController _phoneNumber = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _buildContent(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
                child: Container(
                  // color: Colors.redAccent,
                  child: Image.asset('assets/images/Phone_illustration.png'),
                  height: 130.0,
                  width: 130.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'What is your phone number?',
                style: TextStyle(
                    fontSize: 20.0,
                    letterSpacing: 0.2,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                'You will receive a code to verify your number.',
                style: TextStyle(fontSize: 12.0),
              ),
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 30.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20.0),
                      initialValue: _prefix,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 5.0),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: 20.0),
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        hintStyle: TextStyle(fontSize: 16.0),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        isDense: true,
                      ),
                      controller: _phoneNumber,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      }),
                  ),
                ),
              ],
            ),
            SizedBox(height: 210.0),
            FloatingActionButton(
              onPressed: () {
                return _phoneNumberEntered(context);
              },
              backgroundColor: Colors.amber[600],
              elevation: 0.0,
              child: Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ],
        ));
  }
}
