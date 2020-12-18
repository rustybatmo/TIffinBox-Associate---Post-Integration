import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:phnauthnew/Drawer/aboutus.dart';
import 'package:phnauthnew/end_Drawer/accsettings.dart';
import 'package:phnauthnew/screens/home/ordersHistoryPage.dart';

class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.0,
      child: ListView(
        children: [
          SizedBox(
            height: 90.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 15.0, 0.0, 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(width: 220.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 12.0, 0.0, 0.0),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomListTile(
              icon: Icons.restaurant, text: 'Cook Food', onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => Associate()));
              }),
          CustomListTile(
              icon: OMIcons.receipt, text: 'Order History', onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OrdersHistoryPage()));
              }),          
          CustomListTile(
              icon: Icons.share, text: 'Share With Neighbours',onTap: () {print('tapped');}),
          CustomListTile(
              icon: Icons.settings, text: 'Settings', onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountSettings()));
              }),
          CustomListTile(
              icon: Icons.phone_android, text: 'Contact us', onTap: () {print('tapped');}),
          CustomListTile(icon: Icons.info, text: 'About Us', onTap: () {
            Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
          }),
          SizedBox(height: 210.0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.black),
            ),
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25.0,15.0,0.0,30.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text('Version 1.1.0',style: TextStyle(fontSize: 12.0,color: Colors.grey[700],fontWeight: FontWeight.w600)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,bottom: 0.0),
                        child: Text('Build 1.0',style: TextStyle(fontSize: 12.0,color: Colors.grey[700],fontWeight: FontWeight.w600)),
                      ),
                    ],),
                    SizedBox(width: 190.0),
                    Padding(
                      padding: const EdgeInsets.only(top:4.0),
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        color: Colors.transparent,
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile({this.icon, this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: Container(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.white24,
            child: Container(
              height: 45.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        size: 24.0,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(35.0, 0.0, 30.0, 0.0),
                        child: Text(text,
                            style: TextStyle(
                              fontSize: 14.5,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
