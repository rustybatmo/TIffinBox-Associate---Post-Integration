import 'package:flutter/material.dart';
import 'package:phnauthnew/modals/item.dart';
import 'package:phnauthnew/screens/services/databaseService.dart';
import 'package:provider/provider.dart';

import '../../styling.dart';

class UpdateMenuItem extends StatefulWidget {
  UpdateMenuItem({@required this.item, @required this.id});
  final Item item;
  final String id;
  @override
  _UpdateMenuItemState createState() => _UpdateMenuItemState();
}

enum TypeOfDish { veg, nonveg, none }
final TextEditingController _nameController = TextEditingController();
final TextEditingController _priceController = TextEditingController();
final TextEditingController _typeOfDishController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
// int selectedRadio;

class _UpdateMenuItemState extends State<UpdateMenuItem> {
  TypeOfDish character;

  @override
  void initState() {
    super.initState();
    // TypeOfDish character = TypeOfDish.none;
    _nameController.text = widget.item.itemName;
    _priceController.text = widget.item.pricePerServing;
    _typeOfDishController.text = widget.item.typeOfDish;
    _descriptionController.text = widget.item.dishDescription;
  }

  // setSelectedRadio(int val) {
  //   setState(() {
  //     _selectedRadio = val;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 5.0),
          child: Text(
            'Edit menu item',
            style: TextStyle(color: Colors.black),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 12.0, bottom: 12.0),
          child: backContainerButton(context),
        ),
      ),
      body: _buildContext(context),
    );
  }

  Widget _buildContext(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Basic Details',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text('What\'s the name of the menu item?',
                  style: TextStyle(
                    fontSize: 15.0,
                  )),
            ),
            TextFormField(
              controller: _nameController,
              decoration: addmenustyle.copyWith(
                  hintText: '${widget.item.itemName}', labelText: 'Enter Name'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid menu item name';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text('What\'s the price per serving?',
                  style: TextStyle(
                    fontSize: 15.0,
                  )),
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: addmenustyle.copyWith(
                  hintText: 'Price', labelText: 'Price of the menu item'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a proper price';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
              child: Text('What type of dish is this?',
                  style: TextStyle(
                    fontSize: 15.0,
                  )),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0, vertical: 5.0),
                  child: Row(
                    children: [
                      Container(
                        height: 20.0,
                        // color: Colors.purple,
                        child: ButtonBar(
                          buttonPadding: EdgeInsets.all(0),
                          children: [
                            Radio(
                              value: TypeOfDish.veg,
                              groupValue: character,
                              onChanged: (value) {
                                setState(() {
                                  character = value;
                                  _typeOfDishController.text = 'veg';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Text('VEG')
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    children: [
                      Container(
                        height: 20.0,
                        // color: Colors.greenAccent,
                        child: ButtonBar(
                          buttonPadding: EdgeInsets.all(0),
                          children: [
                            Radio(
                              value: TypeOfDish.nonveg,
                              groupValue: character,
                              onChanged: (value) {
                                setState(() {
                                  character = value;
                                  _typeOfDishController.text = 'nonveg';
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Text('NON VEG')
                    ],
                  ),
                ),
              ],
            ),
            //  Radio button
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text('Add Dish Description(Optional)',
                  style: TextStyle(
                    fontSize: 15.0,
                  )),
            ),
            TextFormField(
              controller: _descriptionController,
              decoration: addmenustyle.copyWith(
                  hintText: 'description',
                  labelText: 'Description of the menu item'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a proper price';
                }
                return null;
              },
            ),
            SizedBox(height: 100.0,),
            InkWell(
                onTap: () => _updateMenuItem(context),
                child: Container(
                  alignment: Alignment(0, 0),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 3.5, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: Offset(1.0,
                            5.0), // Offset in x and y axes from the container
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      'UPDATE MENU ITEM',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  void _updateMenuItem(BuildContext context) {
    final database = Provider.of<Database>(context);
    // var uuid = Uuid();
    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        character != TypeOfDish.none) {
      print('Everything looks alright');

      Map item = Item.toMap(
        _nameController.text,
        _descriptionController.text,
        _priceController.text,
        _typeOfDishController.text,
        widget.id,
      );

      database.updateItem(item, widget.id);
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      Navigator.pop(context);
    } else {
      print('something is off');
    }
  }
}
// Container(
//       child: SingleChildScrollView(
//         child: Form(
//           key: _formkey,
//           child: Column(
//             children: [
//               TextFormField(
//                 // initialValue: '${widget.item.itemName}',
//                 controller: _nameController,
//                 decoration: InputDecoration(
//                   hintText: '${widget.item.itemName}',
//                   labelText: 'Enter Name',
//                 ),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a valid menu item name';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _priceController,
//                 decoration: InputDecoration(
//                     hintText: 'Price', labelText: 'Price of the menu item'),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a proper price';
//                   }
//                   return null;
//                 },
//               ),
//               Column(
//                 children: [
//                   ListTile(
//                     title: const Text('Veg'),
//                     leading: Radio(
//                       value: TypeOfDish.veg,
//                       groupValue: character,
//                       onChanged: (value) {
//                         setState(() {
//                           character = value;
//                           _typeOfDishController.text = 'veg';
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     title: const Text('Nonveg'),
//                     leading: Radio(
//                       value: TypeOfDish.nonveg,
//                       groupValue: character,
//                       onChanged: (value) {
//                         setState(() {
//                           character = value;
//                           _typeOfDishController.text = 'nonveg';
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(
//                   hintText: 'description',labelText: 'Description of the menu item',
//                 ),
//                 validator: (value) {
//                   if (value.isEmpty) {
//                     return 'Please enter a proper price';
//                   }
//                   return null;
//                 },
//               ),
//               RaisedButton(
//                 onPressed: () => _updateMenuItem(context),
//                 child: Text('Update'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
