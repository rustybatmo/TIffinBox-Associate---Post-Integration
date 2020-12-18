import 'package:flutter/material.dart';
import 'package:phnauthnew/end_Drawer/editdetails.dart';
import 'package:phnauthnew/end_Drawer/location.dart';
import 'package:phnauthnew/styling.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      right: false,
      left: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(children: [
            Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
            child: backContainerButton(context),
          ),
            SizedBox(width: 30.0),
            Text(
              'Account Settings',
              style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black),
            ),
          ],),
          Center(
            child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
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
              ),
              constraints: BoxConstraints(
                minWidth: MediaQuery.of(context).size.width*0.90,
                maxWidth: MediaQuery.of(context).size.width*0.90,
              ),
              // color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.0),
                    Text('Full Name',style: TextStyle(fontSize: 16.0,color: Colors.grey),),
                    SizedBox(height: 10.0),
                    Text('Guru Prabhu',style: TextStyle(fontSize: 16.0),),
                    SizedBox(height: 20.0),
                    Text('Email ID',style: TextStyle(fontSize: 16.0,color: Colors.grey),),
                    SizedBox(height: 10.0),
                    Text('Guruprabhu1997@gmail.com',style: TextStyle(fontSize: 16.0),),
                    SizedBox(height: 20.0),
                    Text('Mobile Number',style: TextStyle(fontSize: 16.0,color: Colors.grey),),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                      Text('+91 - 9566913419',style: TextStyle(fontSize: 16.0),),
                      SizedBox(width: 130.0),
                      Icon(Icons.check_circle,color: Colors.greenAccent[400],),
                      SizedBox(width: 5.0),
                      Text('Verified',style: TextStyle(color: Colors.greenAccent[400],),),
                      SizedBox(width: 20.0),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text('Upload Profile pic',style: TextStyle(fontSize: 16.0,color: Colors.grey),),
                    SizedBox(height: 15.0),
                    InkWell(
                      onTap: () {print('Choose File Tapped');} ,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
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
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical:5.0,horizontal: 15.0),
                          child: Text('Choose File'),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    InkWell(onTap: (){
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditDetails()));
                    },
                    child: Text('Edit Details',style: TextStyle(color: Colors.amber,fontSize: 16.0),
                    ),),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),            
              ),
          ),
          SizedBox(height: 30.0),
          Center(
            child: Container(
              decoration: BoxDecoration(
              color: Colors.white,
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
              ),     
              constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width*0.90,
              maxWidth: MediaQuery.of(context).size.width*0.90,
              ),              
              child: Padding(
                padding: const EdgeInsets.only(left:10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                SizedBox(height: 20.0),
                Text('Home Address',style: TextStyle(fontSize: 16.0,color: Colors.grey),),
                SizedBox(height: 20.0),
                Container(                  
                  // color: Colors.purpleAccent,
                  constraints: BoxConstraints(
                    minWidth: 310.0,
                    maxWidth: 310.0,
                    minHeight: 65.0,
                    maxHeight: 65.0,
                  ),
                  child: Text('269 A, Pavizham street, SV Colony, Anna Nagar, Vadavalli, Coimbatore - 641061',
                  style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),strutStyle: StrutStyle(height: 1.2),),
                ),
                SizedBox(height: 20.0),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Location()));
                  },
                  child: Text('Change Address',style: TextStyle(color: Colors.amber,fontSize: 16.0),
                  ),),
                SizedBox(height: 20.0),                
            ],
          ),
              ),),
          ),
        ],),
      ),
    );
  }
}