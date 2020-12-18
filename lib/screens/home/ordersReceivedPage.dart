import 'package:flutter/material.dart';
import 'package:phnauthnew/modals/orderReceived.dart';
import 'package:phnauthnew/screens/services/databaseService.dart';
import 'package:phnauthnew/styling.dart';
// import 'package:phnauthnew/styling.dart';
import 'package:provider/provider.dart';

class OrdersReceivedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    return SafeArea(
      right: false,
      left: false,
      bottom: false,
      child: Scaffold(
        body: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.grey[300], Colors.grey[100]])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10.0),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, top: 10.0, bottom: 12.0),
                    child: backContainerButton(context),
                  ),
                  SizedBox(width: 25.0),
                  Text(
                    'Orders Received',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              StreamBuilder<List<OrderReceived>>(
                stream: database.ordersReceivedStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final orders = snapshot.data;
                    final children =
                        orders.map((order) => _orderCard(order)).toList();
                    return Column(
                      // physics: NeverScrollableScrollPhysics(),
                      children: children,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _orderCard(OrderReceived order) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 3.5, // soften the shadow
            spreadRadius: 3.0, //extend the shadow
            offset:
                Offset(-1.0, 5.0), // Offset in x and y axes from the container
          ),
        ],
      ),
      child: Card(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 10.0),
                Image.asset(
                  'assets/images/guy_avtar.png',
                  scale: 8.0,
                ),
                SizedBox(width: 15.0),
                Container(
                  // color: Colors.blue,
                  constraints: BoxConstraints(
                    maxWidth: 235.0,
                    minWidth: 235.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Container(
                      // color: Colors.green,
                      child: Text(
                      order.customerName,
                      style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w700),
                      ),  
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(order.orderID),
                        SizedBox(
                          width: 30.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          height: 5.0,
                          width: 5.0,
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Text('2m ago'),
                      ],
                    ),
                    ],
                  ),
                ),
                // SizedBox(width: 10.0,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.phone,
                            size: 22.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Text(
                'Delivery Address',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Container(
                // color: Colors.redAccent,
                constraints: BoxConstraints(
                  maxWidth: 260.0,
                  minWidth: 260.0,
                ),
                child: Text(order.address),
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Row(
                children: [
                  Text(
                    'Order Details',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 85.0),
                  Text(
                    'Order Amt.',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 170.0,
                      minWidth: 170.0,
                    ),
                    color: Colors.amber[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: order.items
                            .map((item) => Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item['name']),
                                    Text(item['price']),
                                    Text(item['quantity']),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Container(
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Text(
                          '₹ ',
                          style: TextStyle(
                              fontSize: 28.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '140',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Row(
                children: [
                  Container(
                    color: Colors.green[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: Text(
                        'DELIVERED',
                        style: TextStyle(
                            color: Colors.green[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Container(
                    color: Colors.amber[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: Text(
                        'NOT PAID',
                        style: TextStyle(
                            color: Colors.amber[700],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        size: 30.0,
                      ),
                      onPressed: () {}),
                  // SizedBox(width: 5.0),
                ],
              ),
            ),
            SizedBox(height: 8.0)
          ],
        ),
      ),
    ),
  );
}
// Widget _buildContents(BuildContext context) {
//   final database = Provider.of<Database>(context);

//   return StreamBuilder<List<OrderReceived>>(
//     stream: database.ordersReceivedStream(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         final orders = snapshot.data;
//         final children =
//             orders.map((order) => _orderReceivedCard(order)).toList();
//         return ListView(
//           children: children,
//         );
//       }
//       return Center(
//         child: CircularProgressIndicator(),
//       );
//     },
//   );
// }

// Widget _orderReceivedCard(OrderReceived order) {
//   return Card(
//     child: Column(
//       children: [
//         Text(order.customerName),
//         Text(order.orderID),
//         Text(order.address),
//         Container(
//           height: 100,
//           child: ListView(
//             children: order.items
//                 .map((item) => Column(
//                       children: [
//                         Text(item['name']),
//                         Text(item['price']),
//                         Text(item['quantity']),
//                       ],
//                     ))
//                 .toList(),
//           ),
//         )
//       ],
//     ),
//   );
// }
