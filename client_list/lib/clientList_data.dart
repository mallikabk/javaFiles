import 'package:flutter/material.dart';

// void main() {
//   runApp(MyClientList());
// }

class MyClientlist extends StatelessWidget {
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'List of Clients',
  //     theme: ThemeData(primarySwatch: Colors.blueGrey),
  //     home: ClientList(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Client List'),
          backgroundColor: Color.fromARGB(255, 52, 153, 207),
        ),
        // appBar: AppBar(
        //   title: Text('List of Clients'),
        //   backgroundColor: Colors.white,
        //   elevation: 6,
        //   toolbarHeight: 60,
        //   toolbarOpacity: 1.0,
        //   bottomOpacity: 1.0,
        //   bottom: PreferredSize(
        //     preferredSize: Size.fromHeight(6),
        //     child: Container(
        //       decoration: BoxDecoration(
        //         color: Color(0xFF000000).withOpacity(0.29),
        //         boxShadow: [
        //           BoxShadow(
        //             color: Color(0xFF000000).withOpacity(0.29),
        //             offset: Offset(0, 3),
        //             blurRadius: 6,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        body: ClientList(),
      ),
    );
  }
}

class ClientData {
  String sNo;
  String id;
  String clientName;
  String products;
  String users = '5';
  String location;
  String wellness = '---';
  String status = 'Active';

  ClientData(
      {required this.sNo,
      required this.id,
      required this.clientName,
      required this.products,
      required this.users,
      required this.location,
      required this.wellness,
      required this.status});
}

class ClientList extends StatefulWidget {
  @override
  State<ClientList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ClientList> {
  List<ClientData> clients = [];
  void addClient(ClientData item) {
    setState(() {
      clients.add(item);
    });
  }

  void editItem(int index, ClientData newClient) {
    setState(() {
      clients[index] = newClient;
    });
  }

  void deleteItem(int index) {
    setState(() {
      clients.removeAt(index);
    });
  }

  // Widget buildText(String text) {
  //   return Align(
  //     alignment: Alignment.topLeft,
  //     child: Text(
  //       text,
  //       style: TextStyle(
  //         fontWeight: FontWeight.normal,
  //         fontSize: 15,
  //       ),
  //     ),
  //   );
  // }

  Future<ClientData?> showAddDialog() async {
    TextEditingController sNoController = TextEditingController();
    TextEditingController id1Coontroller = TextEditingController();
    TextEditingController clientController = TextEditingController();
    TextEditingController productsController = TextEditingController();
    TextEditingController usersController = TextEditingController();

    TextEditingController locationController = TextEditingController();
    TextEditingController wellnessController = TextEditingController();
    TextEditingController statuscontroller = TextEditingController();

    return showDialog<ClientData>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Client'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: sNoController,
                decoration: InputDecoration(labelText: 'S.No'),
              ),
              TextFormField(
                controller: id1Coontroller,
                decoration: InputDecoration(labelText: 'Id'),
              ),
              TextFormField(
                controller: clientController,
                decoration: InputDecoration(labelText: 'Client Name'),
              ),
              TextFormField(
                controller: productsController,
                decoration: InputDecoration(labelText: 'Products'),
              ),
              // TextFormField(
              //   controller: usersController,
              //   decoration: InputDecoration(labelText: 'Users'),
              // ),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
              ),
              // TextFormField(
              //   controller: wellnessController,
              //   decoration: InputDecoration(labelText: 'Wellness'),
              // ),
              // TextFormField(
              //   controller: statuscontroller,
              //   decoration: InputDecoration(labelText: 'Status'),
              // ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                ClientData newClient = ClientData(
                  sNo:'1',
                  id: id1Coontroller.text,
                  clientName: clientController.text,
                  products: productsController.text,
                  users: '4',
                  location: locationController.text,
                  wellness: '--',
                  status: 'Active',
                );
                Navigator.pop(context, newClient);
              },
            ),
          ],
        );
      },

      // context: context,
      // builder: (context) => AlertDialog(
      //   //contentPadding: EdgeInsets.zero,

      //   content: Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       Stack(
      //         children: [
      //           Container(
      //             color: Colors.white,
      //             //  padding: EdgeInsets.all(),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 Text(
      //                   'Create Client',
      //                   style: TextStyle(
      //                     fontWeight: FontWeight.normal,
      //                     fontSize: 18,
      //                   ),
      //                 ),
      //                 IconButton(
      //                   icon: Icon(
      //                     Icons.close,
      //                   ),
      //                   padding: EdgeInsets.only(left: 150),
      //                   color: Color.fromARGB(255, 29, 27, 27),
      //                   onPressed: () {
      //                     Navigator.of(context).pop();
      //                   },
      //                 ),
      //               ],
      //               // SizedBox(height: 8),
      //             ),
      //           ),
      //         ],
      //       ),
      //       Divider(
      //         color: Colors.grey,
      //         thickness: 1.0,
      //       ),
      //       SizedBox(height: 5),
      //       // SizedBox(height: 8),
      //       buildText('Client Name'),
      //       Container(
      //         padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.all(Radius.circular(4.0)),
      //               ),
      //               labelText: 'Client Name'),
      //         ),
      //       ),
      //       buildText('Location'),
      //       Container(
      //         padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //               hintText: 'Location',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.all(Radius.circular(4.0)),
      //               ),
      //               labelText: 'Location'),
      //         ),
      //       ),
      //       buildText('Product Type'),

      //       Container(
      //         padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      //         child: TextFormField(
      //           controller: statuscontroller,
      //           decoration: InputDecoration(
      //               hintText: 'Product Type',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.all(Radius.circular(4.0)),
      //               ),
      //               labelText: 'Product Type'),
      //         ),
      //       ),
      //       buildText('TPA List'),
      //       Container(
      //         padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //               hintText: 'TPA List',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.all(Radius.circular(4.0)),
      //               ),
      //               labelText: 'TPA List'),
      //         ),
      //       ),
      //       buildText('Insurance Company'),
      //       Container(
      //         padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      //         child: TextFormField(
      //           decoration: InputDecoration(
      //               hintText: 'Insurance Company',
      //               border: OutlineInputBorder(
      //                 borderRadius: BorderRadius.all(Radius.circular(4.0)),
      //               ),
      //               labelText: 'Insurance Company'),
      //         ),
      //       ),
      //       Divider(
      //         color: Colors.grey,
      //         thickness: 1.0,
      //       ),
      //       SizedBox(height: 5),
      //       Align(
      //         //padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      //         alignment: Alignment.bottomRight,
      //         child: ElevatedButton(
      //           onPressed: showAddDialog,
      //           child: Text('Create Client'),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Future<ClientData?> showEditDialog(ClientData currentItem) async {
    TextEditingController sNoController =
        TextEditingController(text: currentItem.sNo);
    TextEditingController id1Coontroller =
        TextEditingController(text: currentItem.id);
    TextEditingController clientController =
        TextEditingController(text: currentItem.clientName);
    TextEditingController productsController =
        TextEditingController(text: currentItem.products);
    TextEditingController usersController =
        TextEditingController(text: currentItem.users);

    TextEditingController locationController =
        TextEditingController(text: currentItem.location);
    TextEditingController wellnessController =
        TextEditingController(text: currentItem.wellness);
    TextEditingController statuscontroller =
        TextEditingController(text: currentItem.status);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Edit Client'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: sNoController,
                  decoration: InputDecoration(labelText: 'S.No'),
                ),
                TextFormField(
                  controller: id1Coontroller,
                  decoration: InputDecoration(labelText: 'Id'),
                ),
                TextFormField(
                  controller: clientController,
                  decoration: InputDecoration(labelText: 'Client Name'),
                ),
                TextFormField(
                  controller: productsController,
                  decoration: InputDecoration(labelText: 'Products'),
                ),
                TextFormField(
                  controller: usersController,
                  decoration: InputDecoration(labelText: 'Users'),
                ),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextFormField(
                  controller: wellnessController,
                  decoration: InputDecoration(labelText: 'Wellness'),
                ),
                TextFormField(
                  controller: statuscontroller,
                  decoration: InputDecoration(labelText: 'Status'),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                  child: Text('Update'),
                  onPressed: () {
                    ClientData newClient = ClientData(
                      sNo: sNoController.text,
                      id: id1Coontroller.text,
                      clientName: clientController.text,
                      products: productsController.text,
                      users: usersController.text,
                      location: locationController.text,
                      wellness: wellnessController.text,
                      status: statuscontroller.text,
                    );
                    Navigator.pop(context, newClient);
                  })
            ]);
      },
    );
  }

  Future<void> showDeleteDialog(int index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Client'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.pop(context);
                deleteItem(index);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // Row(
        //   children: [
        //     Container(
        //       child: Align(
        //         alignment: Alignment.centerRight,
        //         child: ElevatedButton(
        //             onPressed: () async {
        //               ClientData? newItem = await showAddDialog();
        //               if (newItem != null) {
        //                 addItem(newItem);
        //               }
        //             },
        //             child: Text('Create Client')),
        //       ),
        //     ),
        //   ],
        // ),
        Row(
          children: [
            Expanded(
              child: Container(), // Empty container to fill the space
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 40, 0),
              child: ElevatedButton(
                onPressed: () async {
                  ClientData? newItem = await showAddDialog();
                  if (newItem != null) {
                    addClient(newItem);
                  }
                },
                child: Text('Create Client'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            DataTable(
              columns: [
                DataColumn(label: Text('S.No')),
                DataColumn(label: Text('Id')),
                DataColumn(label: Text('Client Name')),
                DataColumn(label: Text('Products')),
                DataColumn(label: Text('Users')),
                DataColumn(label: Text('Location')),
                DataColumn(label: Text('Wellness')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Actions'))
              ],
              rows: clients.map((client) {
                return DataRow(cells: [
                  DataCell(Text(client.sNo)),
                  DataCell(Text(client.id)),
                  DataCell(Text(client.clientName)),
                  DataCell(Text(client.products)),
                  DataCell(Text(client.users)),
                  DataCell(Text(client.location)),
                  DataCell(Text(client.wellness)),
                  DataCell(Text(client.status)),
                  DataCell(Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          ClientData? newItem = await showEditDialog(client);
                          if (newItem != null) {
                            editItem(clients.indexOf(client), newItem);
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          showDeleteDialog(clients.indexOf(client));
                        },
                      ),
                    ],
                  )),
                ]);
              }).toList(),
            ),
          ],
        ),
      ],
    )
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () async {
        //     ClientData? newItem = await showAddDialog();
        //     if (newItem != null) {
        //       addItem(newItem);
        //     }
        //   },
        // ),
        );
  }
}
