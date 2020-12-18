import 'package:flutter/material.dart';
import 'package:phnauthnew/end_Drawer/accsettings.dart';
import 'package:phnauthnew/styling.dart';

class EditDetails extends StatelessWidget {
  
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 3.5, // soften the shadow
                  spreadRadius: 0.05, //extend the shadow
                  offset: Offset(
                      2.5, 2.5), // Offset in x and y axes from the container
                ),
              ],
              color: Colors.white,
            ),
            child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.0,
                ),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(            
            child: Text('Edit your Personal Details',style:TextStyle(
            fontSize: 20.0,fontWeight: FontWeight.bold
            ),),
          ),
          SizedBox(height: 10.0),
          Center(            
            child: Container(
              // color: Colors.redAccent,
              constraints: BoxConstraints(
                maxWidth: 350.0,
              ),
              child: Text('This is need to get in touch with you during your order pickup/delivery',style:TextStyle(
              fontSize: 14.0,),textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 40.0),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30.0),
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
                      )],
                      ),
                      child: TextFormField(
                        style: TextStyle(letterSpacing: 1.0),
                        textAlign: TextAlign.start,
                        decoration : cardbar.copyWith(hintText: 'Enter your name'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30.0),
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
                      )],
                      ),
                      child: TextFormField(
                        decoration : cardbar.copyWith(hintText: 'Enter your email address'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:30.0),
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
                      )],
                      ),
                      child: TextFormField(
                        initialValue: '9677928794',
                        decoration : cardbar.copyWith(suffixIcon: Container(
                          // color: Colors.red,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(right:40.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children:[Icon(Icons.check_circle,color: Colors.green,),SizedBox(width: 5.0),Text('Verified',style: TextStyle(color: Colors.green),)]),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Align(
              alignment: Alignment(-0.45, -1),
              child: Text('Verified number cannot be changed.',style: TextStyle(fontSize: 13.0),),
              ),
            SizedBox(height: 200.0),
          InkWell(            
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AccountSettings()));
            },
            
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical :10.5),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.amber,
                  boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 3.5, // soften the shadow
                            spreadRadius: 0.05, //extend the shadow
                            offset: Offset(3.0,3.5), // Offset in x and y axes from the container
                          ),],
                ),                
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0,vertical: 12.0),
                  child: Text('MAKE THE CHANGES',style: TextStyle(color: Colors.white,)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}