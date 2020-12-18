import 'package:flutter/material.dart';
import 'package:phnauthnew/Drawer/ourstory.dart';
import 'package:phnauthnew/Drawer/privacy.dart';
import 'package:phnauthnew/Drawer/ts.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: Text(
            'About Us',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3.5, // soften the shadow
                  spreadRadius: 0.5, //extend the shadow
                  offset: Offset(
                      1.5, 2.5), // Offset in x and y axes from the container
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
      body: Column(children: [
        SizedBox(height: 20.0,),
        InkWell(
          onTap: (){
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OurStory()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:           
            Row(children: [
              SizedBox(width: 15.0),
              Icon(Icons.info),
              SizedBox(width: 35.0),
              Container(
                // color: Colors.redAccent,
                constraints: BoxConstraints(
                  minWidth: 150.0,
                  maxWidth: 150.0,
                ),
                child: Row(
                  children: [
                    Text('WHAT IS '),
                    Text('TIFFINBOX',style: TextStyle(color: Colors.amber),),
                  ],
                ),
              ),            
              SizedBox(width: 120.0),
              Icon(Icons.arrow_forward_ios,size: 20.0,)
            ],),
          ),
        ),
        Divider(
          height: 10.0,
          thickness: 1.0,
          indent: 5.0,
          endIndent: 5.0,
          color: Colors.amber,
        ),
        InkWell(
          onTap: (){
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TermService()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              SizedBox(width: 15.0),
              Icon(Icons.local_library),
              SizedBox(width: 35.0),
              Container(
                // color: Colors.redAccent,
                constraints: BoxConstraints(
                  minWidth: 150.0,
                  maxWidth: 150.0,
                ),
                child: Text('TERMS OF SERVICE')),
              SizedBox(width: 120.0),
              Icon(Icons.arrow_forward_ios,size: 20.0,)
            ],),
          ),
        ),
        Divider(
          height: 10.0,
          thickness: 1.0,
          indent: 5.0,
          endIndent: 5.0,
          color: Colors.amber,
        ),
        InkWell(
          onTap: (){
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PrivacyPolicy()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              SizedBox(width: 15.0),
              Icon(Icons.security),
              SizedBox(width: 35.0),
              Container(
                // color: Colors.redAccent,
                constraints: BoxConstraints(
                  minWidth: 150.0,
                  maxWidth: 150.0,
                ),
                child: Text('PRIVACY POLICY')),
              SizedBox(width: 120.0),
              Icon(Icons.arrow_forward_ios,size: 20.0,)
            ],),
          ),
        ),
        Divider(
          height: 10.0,
          thickness: 1.0,
          indent: 5.0,
          endIndent: 5.0,
          color: Colors.amber,
        ),
      ],),
    );
  }
}