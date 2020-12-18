import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10.0, bottom: 12.0),
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
                SizedBox(width: 10.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withOpacity(0.15),
                            blurRadius: 3.5, // soften the shadow
                            spreadRadius: 0.05, //extend the shadow
                            offset: Offset(-0.5,
                                1.0), // Offset in x and y axes from the container
                          ),
                        ],
                      ),
                      child: TextFormField(
                        onTap: () {},
                        decoration: InputDecoration(
                          hintText: 'Search for area, street name...',
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 1.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.gps_fixed,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                        onTap: () {
                          // Navigator.push(context,
                          // MaterialPageRoute(builder: (context) => ConfirmLocation()));
                        },
                        child: Text('Current Location',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.red,
                            ))),
                  ],
                ),
              ),
            ),
            place(),
            place(),
          ],
        ),
      ),
    );
  }
}

Widget place()
 {
  return InkWell(
    onTap: () {},
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5.0),
                child: Icon(Icons.home),
              ),
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 40.0, right: 20.0, bottom: 10.0),
            child: Text(
              '269, A, Ground Floor, Daisy Apartment, Vadavalli Main Road, Thondamuthur, Coimbatore - 641074 ',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      ),
    ),
  );
}
