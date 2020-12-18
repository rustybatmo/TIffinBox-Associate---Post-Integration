import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:phnauthnew/modals/item.dart';
import 'package:phnauthnew/screens/menu%20page/addMenuItemPage.dart';
import 'package:phnauthnew/screens/menu%20page/updateMenuItemPage.dart';
import 'package:phnauthnew/screens/services/databaseService.dart';
import 'package:phnauthnew/styling.dart';
import 'package:provider/provider.dart';
// import 'package:uuid/uuid.dart';

class MenuPage extends StatefulWidget {
  MenuPage({@required this.uid});
  final String uid;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'List item on your menu',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
          child: backContainerButton(context),
        ),
      ),
      body: Column(children: [
        Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search Menu Item...',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 2.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Item not on your list?'),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Provider<Database>(
                              create: (context) =>
                                  FirebaseDatabase(uid: widget.uid),
                              child: AddMenuItem()),
                        ),
                      ),
                      child: Text(
                        ' Add Now',
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        StreamBuilder<List<Item>>(
          stream: database.menuItemsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Item> items = snapshot.data;
              final children = items
                  .map((item) => ItemCard(item: item, context: context, uid: widget.uid,))
                  // .map((item) => ItemCard(item, context, widget.uid))
                  .toList();
              return Expanded(
                child: Column(
                  children: children,
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ]),
    );
  }
}

class ItemCard extends StatefulWidget {
  final Item item;
  final BuildContext context;
  final String uid;
  // item, BuildContext context, String uid;
  ItemCard({@required this.item, @required this.context,@required this.uid});
  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      // color: Colors.blueAccent,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 0.0),
            child: FlutterSwitch(
              width: 35.0,
              height: 20.0,
              valueFontSize: 0.0,
              activeColor: Colors.greenAccent[400],
              toggleSize: 20.0,
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
          ),
          SizedBox(width: 40.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
            child: Container(
              // color: Colors.blueAccent,
              constraints: BoxConstraints(
                maxWidth: 120,
                minWidth: 120,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.itemName,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w400)),
                  SizedBox(height: 5.0),
                  Text(
                    '1 serving',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 75.0),
          IconButton(
              onPressed: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Provider<Database>(
                      create: (context) => FirebaseDatabase(uid: widget.uid),
                      child: UpdateMenuItem(
                        item: widget.item,
                        id: widget.item.id,
                      ),
                    ),
                  ),
                );
              },
              icon: Icon(Icons.edit)),
          // SizedBox(width:10.0),
          IconButton(
              onPressed: () {
                return database.deleteItem(widget.item, widget.item.itemName);
              },
              icon: Icon(Icons.delete)),
          SizedBox(width: 15.0),
        ],
      ),
    );
  }
}

// Widget _itemCard(Item item, BuildContext context, String uid) {
//   final database = Provider.of<Database>(context);
//   bool status = false;
//   return Card(
//     margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
//     // color: Colors.blueAccent,
//     child: Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(8.0, 5.0, 0.0, 0.0),
//           child: FlutterSwitch(
//             width: 35.0,
//             height: 20.0,
//             valueFontSize: 0.0,
//             activeColor: Colors.greenAccent[400],
//             toggleSize: 20.0,
//             value: status,
//             borderRadius: 20.0,
//             padding: 0.0,
//             showOnOff: false,
//             onToggle: (val) {
//               setstate
//               // setState(() {
//               //   status = val;
//               // });
//             },
//           ),
//         ),
//         SizedBox(width: 40.0),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
//           child: Container(
//             // color: Colors.blueAccent,
//             constraints: BoxConstraints(
//               maxWidth: 120,
//               minWidth: 120,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(item.itemName,
//                     style:
//                         TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400)),
//                 SizedBox(height: 5.0),
//                 Text(
//                   '1 serving',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(width: 75.0),
//         IconButton(
//             onPressed: () {
//               return Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Provider<Database>(
//                     create: (context) => FirebaseDatabase(uid: uid),
//                     child: UpdateMenuItem(
//                       item: item,
//                       id: item.id,
//                     ),
//                   ),
//                 ),
//               );
//             },
//             icon: Icon(Icons.edit)),
//         // SizedBox(width:10.0),
//         IconButton(
//             onPressed: () {
//               return database.deleteItem(item, item.itemName);
//             },
//             icon: Icon(Icons.delete)),
//         SizedBox(width: 15.0),
//       ],
//     ),
//   );

  // Card(
  //   child: Column(
  //     children: [
  //       RaisedButton(
  //         onPressed: () {
  //           return database.deleteItem(item, item.itemName);
  //         },
  //         child: Text('Delete this item'),
  //       ),
  //       RaisedButton(
  //         onPressed: () {
  //           return Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => Provider<Database>(
  //                 create: (context) => FirebaseDatabase(uid: uid),
  //                 child: UpdateMenuItem(
  //                   item: item,
  //                   id: item.id,
  //                 ),
  //               ),
  //             ),
  //           );
  //         },
  //         child: Text('Update this item'),
  //       )
  //     ],
  //   ),
  // );
// }
