import 'package:flutter/material.dart';

class OurStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: Row(
            children: [
              Text(
                'WHAT IS OUR ',
                style: TextStyle(color: Colors.black),
              ),
              Text(
                'STORY',
                style: TextStyle(color: Colors.amber),
              ),
              Text(
                '?',
                style: TextStyle(color: Colors.black),
              ),
            ],
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0,20.0,8.0,20.0),
        child: Container(
          constraints: BoxConstraints(
              minWidth: 400.0,
              maxWidth: 400.0,
            ),
          decoration: BoxDecoration(
            color: Colors.amber[100],
            borderRadius: BorderRadius.circular(25.0),
            boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5.0, // soften the shadow
                  spreadRadius: 5.0, //extend the shadow
                  offset: Offset(
                      0.0,0.0), // Offset in x and y axes from the container
                ),
              ],
          ),
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: 380.0,
                ),
                // color: Colors.lightBlueAccent,
                child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0,40.0,20.0,0.0),
                child: Text('We thought... "What is the one thing which is being made all around us everyday that can be shared with everyone?" Home Cooked Food! When your neighbor next door or the person living a street away is preparing awesome masala dosa tonight and is willing to share it with you, would you not want to try it out? And yes, not to mention the fact that you just made a friend in your community!',
                style: TextStyle(fontSize: 18.0,letterSpacing: 0.2),
                strutStyle: StrutStyle(height: 1.5),
                ),
              ),),
              SizedBox(height: 20.0),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 380.0,
                ),
                // color: Colors.lightBlueAccent,
                child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0,0.0,20.0,0.0),
                child: Text('TiffinBox is a mobile app that aims to connect buyers and home chefs who live around them. Passionate about the concept of "Share economy", we decided that we\'d take it upon ourselves to build an app that brings together people within a community with \"Home Cooked Food\" being the common binding factor.',
                style: TextStyle(fontSize: 18.0,letterSpacing: 0.2),
                strutStyle: StrutStyle(height: 1.5),
                ),
              ),),
            ],),
        ),
      ),
    );
  }
}