import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:phnauthnew/Drawer/drawer.dart';
import 'package:phnauthnew/end_Drawer/enddrawer.dart';
import 'package:phnauthnew/screens/home/ordersHistoryPage.dart';
import 'package:phnauthnew/screens/home/ordersReceivedPage.dart';
import 'package:phnauthnew/screens/menu%20page/menuPage.dart';
import 'package:phnauthnew/screens/services/authService.dart';
import 'package:phnauthnew/screens/services/databaseService.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  HomePage({@required this.uid});
  final uid;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context);

    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        actions: [
          Builder(builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                onPressed: () => //_onSignOut(context),
                Scaffold.of(context).openEndDrawer(),
                icon: Image.asset('assets/images/guy_avtar.png'),
                iconSize: 35.0,
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          }),
        ],
      ),
      drawer: LeftDrawer(),
      endDrawer:EndDrawer(),
      body: ListView(
              children:[ Column(
          children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.doc('cooks/${widget.uid}').snapshots(),
                builder: (context, snapshot) {
                if (snapshot.hasData) {              
                return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Let\'s make',
                  style: TextStyle(fontSize: 16.0,color: Colors.grey ),
                  ),
                  SizedBox(height: 10.0,),
                  Text('some delicious food, ${snapshot.data['name']}',style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
                ],);
                }else
                  return Text('Loading');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:15.0,vertical:20.0),
            child: Row(children: [            
              Text('Order Dashboard',style: TextStyle(fontSize:18.0,fontWeight: FontWeight.w700 ),),
              SizedBox(width: 120.0,),
              Text('Active'),
              SizedBox(width: 15.0,),
              FlutterSwitch(
                width: 40.0,
                height: 25.0,
                valueFontSize: 0.0,
                activeColor: Colors.amber,
                toggleSize: 25.0,
                value: status,
                borderRadius: 20.0,
                padding: 0.0,
                showOnOff: false,
                onToggle: (val) {
                  setState(() {
                    status = val;
                  });
                },
              ),
            ],),
          ),
          Container(
            constraints: BoxConstraints(
              minWidth: 380,
              maxWidth: 380,
              maxHeight: 300,
              minHeight: 300,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(colors: [Color(0xFFFDBB43), Color(0xFFFedea4)]),
              boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.5),
                blurRadius: 3.5, // soften the shadow
                spreadRadius: 0.05, //extend the shadow
                offset: Offset(-0.5,
                    1.0), // Offset in x and y axes from the container
              ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: InkWell(
                  onTap: () => _ordersReceivedClicked(context),
                  child: Container(
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFFFE1AB),                  
                    ),                
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('0',style: TextStyle(fontSize: 16.0),),
                      SizedBox(height: 8.0),
                      Text('Orders Received',style: TextStyle(fontSize: 16.0),),
                    ],),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0),
                child: InkWell(
                  onTap: () => _ordersHistoryClicked(context),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFFFE1AB),
                    ),                
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('View Order History',style: TextStyle(fontSize: 16.0),),
                    ],),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,bottom: 20.0),
                child: InkWell(
                  onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Provider<Database>(
                      create: (context) => FirebaseDatabase(uid: widget.uid),
                      child: MenuPage(
                        uid: widget.uid,
                      )),
                )),
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Color(0xFFFFE1AB),
                    ),                
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('6',style: TextStyle(fontSize: 16.0),),
                      SizedBox(height: 5.0),
                      Text('View Menus',style: TextStyle(fontSize: 16.0),),
                    ],),
                  ),
                ),
              ),
            ],),
          ),       
          SizedBox(height:20.0),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.5),
                blurRadius: 3.5, // soften the shadow
                spreadRadius: 2.5, //extend the shadow
                offset: Offset(-0.5,
                    1.0), // Offset in x and y axes from the container
              ),
              ],
            ),
            constraints: BoxConstraints(
              maxWidth: 390.0,
              minWidth: 390.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:15.0),
                          child: Text('Your Menus',style: TextStyle(fontSize: 18.0,color: Colors.grey),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('Attractive Menu Cards',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
                        ),
                      ],),
                  SizedBox(width: 25.0),
                  Container(         
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.local_dining,color: Colors.white,size: 40.0,),
                    ),
                  ),
                  ],),
                SizedBox(height: 15.0),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: 280.0,                                        
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0.0,8.0,8.0,0.0),
                    child: Text('Bored of texting your menu to your customers every time? Create menu\'s here and have it magically appear on your customer\'s apps.',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                  )
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 20.0),
                    child: Text('Create Menu',style: TextStyle(fontSize: 16.0,color: Colors.white,letterSpacing: 0.2,)),
                  ),
                ),
                SizedBox(height: 20.0),
              ],),
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.amber[800],Colors.amber[200]],stops: [0.35,1.0])
            ),
            constraints: BoxConstraints(
              maxWidth: 390.0,
              minWidth: 390.0,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Column(              
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:25.0),
                    child: Text('Refer a cook to TiffinBox Associate',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 340.0,
                    ),
                    // color: Colors.blueAccent,
                    child: Text('Have a friend who you think has potential to be a great cook and serve thousands of customers? Introduce them to TiffinBox Assocaite.',style: TextStyle(fontWeight: FontWeight.w700),strutStyle: StrutStyle(height:1.2),),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: 340.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Icon(Icons.share,color: Colors.white,),
                          SizedBox(width: 20.0),
                          Text('Share with Neighours',style:TextStyle(color: Colors.white,letterSpacing: 0.5)),
                        ],),
                      ),                      
                    ),
                  ),
                  SizedBox(height: 40.0),
                ],),
            ),),
            SizedBox(height: 25.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Image.asset('assets/images/logo.png',scale: 13),
                SizedBox(width: 10.0),
                Text('1980',style: TextStyle(color: Colors.amber,fontSize: 16.0)),
                SizedBox(width: 3.0,),
                Text('cooks have signed up as yet',style: TextStyle(fontSize: 16.0))
              ],),
            ),
            RaisedButton(
            onPressed: () => _onSignOut(context),
            child: Text('Sign out'),
          )
        ],),
      ],),        
    );
  }

  Future<void> _onSignOut(BuildContext context) async {
    final auth = Provider.of<AuthBase>(context);
    await auth.signOut();
  }

  void _ordersReceivedClicked(BuildContext context) {
    // final path = APIPath.getOrdersReceived(uid);
    // final CollectionReference reference =
    //     FirebaseFirestore.instance.collection(path);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Provider<Database>(
            create: (context) => FirebaseDatabase(uid: widget.uid),
            child: OrdersReceivedPage()),
      ),
    );
  }

  void _ordersHistoryClicked(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Provider<Database>(
                create: (context) => FirebaseDatabase(uid: widget.uid),
                child: OrdersHistoryPage())));
  }
}
