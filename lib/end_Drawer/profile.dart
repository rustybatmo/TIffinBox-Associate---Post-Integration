import 'package:avatar_letter/avatar_letter.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:phnauthnew/end_Drawer/accsettings.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 200.0,
                child: ClipPath(
                  clipper: BackgroundClipper(),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0xFF616161).withOpacity(0.2),
                                      blurRadius: 4.0, // soften the shadow
                                      spreadRadius: 0.1, //extend the shadow
                                      offset: Offset(
                                        2.5,
                                        2.5,
                                      ), // Offset in x and y axes from the container
                                    ),
                                  ],
                                  color: Colors.white),
                              height: 30.0,
                              width: 40.0,
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
                          SizedBox(width: 100.0),
                          Padding(
                            padding:
                                const EdgeInsets.only(top:15.0),
                            child: Text(
                              'PROFILE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
                            
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.only(left:25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text('Email ID', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,letterSpacing: 0.5,color: Colors.black
                ),),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text('Arunkumar@gmail.com', style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,letterSpacing: 0.5,color: Colors.grey[600]
                  ),),
                ),
                SizedBox(height: 30.0,),
                Text('Mobile', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,letterSpacing: 0.5,color: Colors.black
                ),),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text('+91 - 9566913419', style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,letterSpacing: 0.5,color: Colors.grey[600]
                  ),),
                ),
                SizedBox(height: 30.0,),
                Text('Home Address', style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,letterSpacing: 0.5,color: Colors.black
                ),),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 330.0,
                    ),
                    // color: Colors.redAccent,
                    child: Text('269 A, Pavizham street,S V Colony, Anna Nagar, Vadavalli, Coimbatore - 641041', style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w400,letterSpacing: 0.5,color: Colors.grey[600]
                    ),),
                  ),
                ),
              ],),
            ),
            ],
          ),
        Positioned(
          left:150,
          top:150,
          child: DottedBorder(
            borderType: BorderType.Circle,
            radius: Radius.circular(40),
            padding: EdgeInsets.all(0),
            dashPattern: [8,3],
            color: Colors.grey[700],
            strokeWidth: 5.0,
            child: AvatarLetter(
                backgroundColorHex: null,
                textColorHex: null,
                size: 100,
                backgroundColor: Colors.orange[900],
                textColor: Colors.white,
                fontSize: 50,
                upperCase: true,
                numberLetters: 2,
                letterType: LetterType.Circular,
                text: 'Arun Kumar',
                ),
          ),    
        ),
        Positioned(
        right:70,
        top:190,
          child: InkWell(
            onTap: (){
              Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountSettings()));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.black,
              ),
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.edit,size: 30.0,color: Colors.white,),
              ),
            ),
          ),    
        ),
          
        Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/logo.png',scale: 20.0,)),
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
  
    path.lineTo(0, size.height);
    // path.lineTo(
    //     size.width - (size.width * 0.8), size.height - (size.height * 0.2));

    // path.lineTo(size.width, size.height* 0.8);
    var ctrlpt1 = Offset(0, size.height*0.8);
    var endpt1 = Offset(size.width * 0.2, size.height * 0.8);
    path.quadraticBezierTo(ctrlpt1.dx, ctrlpt1.dy, endpt1.dx, endpt1.dy);
    var ctrlpt2 = Offset(size.width, size.height*0.8);
    var endpt2 = Offset(size.width, size.height * 0.6);
    path.lineTo(size.width*0.8, size.height * 0.8);
    path.quadraticBezierTo(ctrlpt2.dx, ctrlpt2.dy, endpt2.dx, endpt2.dy);
    // path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
