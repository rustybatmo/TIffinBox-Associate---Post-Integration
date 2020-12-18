import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phnauthnew/screens/landingPage.dart';
// import 'package:phnauthnew/screens/personalDetails.dart';
import 'package:phnauthnew/screens/services/authService.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
class SMSCode extends StatefulWidget {
  SMSCode({@required this.phoneNumber});
  final String phoneNumber;

  @override
  _SMSCodeState createState() => _SMSCodeState();
}

class _SMSCodeState extends State<SMSCode> {
  var onTapRecognizer;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _codeNumber = TextEditingController();
  bool hasError = false;
  String currentText = "";
  StreamController<ErrorAnimationType> errorController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

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

  Widget _buildContent(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 10.0),
          child: Container(
            // color: Colors.redAccent,
            child: Image.asset('assets/images/Phone_illustration_1.png'),
            height: 130.0,
            width: 130.0,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Container(
          // color: Colors.redAccent,
          constraints: BoxConstraints(maxWidth: 290.0),
          child: Column(
            children: [
              Text(
                'We have sent you a confirmation code via SMS to ',
                style: TextStyle(fontSize: 13.0),
              ),
              SizedBox(width: 5.0),
              Text(
                '+91 9677938794.',
                style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 50.0),
      //  Pin Hole Fields
      Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
            child: PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: false,
              obscuringCharacter: '*',
              animationType: AnimationType.fade,
              validator: (v) {
                if (v.length < 3) {
                  return "I'm from validator";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderWidth: 0.0,
                fieldHeight: 60,
                fieldWidth: 50,
                inactiveFillColor: Colors.amber,
                selectedFillColor: Colors.amber,
                activeFillColor: hasError ? Colors.green : Colors.amber,
              ),
              animationDuration: Duration(milliseconds: 300),
              textStyle: TextStyle(fontSize: 20, height: 1.6,color: Colors.white,fontWeight: FontWeight.bold),
              // backgroundColor: Colors.green,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: _codeNumber,
              keyboardType: TextInputType.number,
              onCompleted: (v) {
                print("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                print(value);
                setState(() {
                  currentText = value;
                });
              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
            ),
        ),
      ),

      // : If there is error, to disply error text:
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 30.0),
      //   child: Text(
      //     hasError ? "*Please fill up all the cells properly" : "",
      //     style: TextStyle(
      //         color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
      //   ),
      // ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            child: Text("Clear",style: TextStyle(fontSize: 16.0),),
            onPressed: () {
              _codeNumber.clear();
            },
          ),
          FlatButton(
            child: Text("Paste OTP",style: TextStyle(fontSize: 16.0),),
            onPressed: () {
              //  
              _codeNumber.text = "123123";
            },
          ),
        ],
      ),

      SizedBox(height: 20.0),
      Padding(
        padding: const EdgeInsets.only(left: 70.0),
        child: Row(
          children: [
            Text(
              'Didn\'t receive it? ',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(width: 3.0),
            InkWell(
              onTap: () {},
              child: Text(
                'Resend.',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 90.0),
      FloatingActionButton(
        onPressed: () {
          return _codeEntered(context);
        },
        backgroundColor: Colors.amber[600],
        elevation: 0.0,
        child: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
      SizedBox(height: 10.0),
    ]);
  }

  Future<void> _codeEntered(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context);
    print(_codeNumber.text);
    await auth.verifyPhoneNumber(widget.phoneNumber, _codeNumber.text);
    // Navigator.pop(context);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LandingPage(
            phoneNumber: widget.phoneNumber,
            personalDetailsProvided: false,
          ),
        ));
  }
}