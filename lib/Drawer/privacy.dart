import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'PRIVACY POLICY',
          style: TextStyle(color: Colors.black),
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
        child: Center(
          child: Container(
            constraints: BoxConstraints(
                      minWidth:  MediaQuery.of(context).size.width*0.94,
                      maxWidth:  MediaQuery.of(context).size.width*0.94,
                      minHeight: MediaQuery.of(context).size.height,
                      maxHeight: MediaQuery.of(context).size.height,
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
                Flexible(
                  child: ListView(                
                    children: [
                      Column(
                        children: [
                          Container(
                            constraints: BoxConstraints(
                              maxWidth: 380.0,
                            ),
                            decoration: BoxDecoration(),
                            // color: Colors.lightBlueAccent,
                            child: Padding(
                            padding: const EdgeInsets.fromLTRB(25.0,20.0,20.0,0.0),
                            child: Text('Good things happen when people can move, whether across town or toward their dreams. Opportunities appear, open up, become reality. What started as a way to tap a button to get a ride has led to billions of moments of human connection as people around the world go all kinds of places in all kinds of ways with the help of our technology.',
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
                            child: Text('In addition to giving riders a way to get from point A to point B, we\'re working to bring the future closer with self-driving technology and urban air transport, helping people order food quickly and affordably, removing barriers to healthcare, creating new freight-booking solutions, and helping companies provide a seamless employee travel experience.',
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
                            child: Text('Whether you’re in the back seat or behind the wheel, your safety is essential. We are committed to doing our part, and technology is at the heart of our approach. We partner with safety advocates and develop new technologies and systems to help improve safety and help make it easier for everyone to get around.',
                            style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
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
                            child: Text('It’s our goal to create a workplace that is inclusive and reflects the diversity of the cities we serve—where everyone can be their authentic self, and where that authenticity is celebrated as a strength. By creating an environment where people from every background can thrive, we’ll make Uber a better company—for our employees and our customers.',
                            style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                            strutStyle: StrutStyle(height: 1.5),
                            ),
                          ),),
                          SizedBox(height: 50.0),
                        ],),                    
                    ],
                  ),
                ),
                SizedBox(height: 70.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
