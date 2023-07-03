import 'package:flutter/material.dart';

class MyClientList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          
          title: Text('Client List',),
          backgroundColor: Color.fromARGB(255, 52, 153, 207),
        ),
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

  ClientData({
    required this.sNo,
    required this.id,
    required this.clientName,
    required this.products,
    required this.users,
    required this.location,
    required this.wellness,
    required this.status,
  });
}

class ClientList extends StatefulWidget {
  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
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

  Future<ClientData?> showAddDialog() async {
    TextEditingController sNoController = TextEditingController();
    TextEditingController idController = TextEditingController();
    TextEditingController clientController = TextEditingController();
    TextEditingController productsController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    return showDialog<ClientData>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Create Client',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              SizedBox(height: 5),
              buildTextFormField('S.No', sNoController),
              buildTextFormField('Id', idController),
              buildTextFormField('Client Name', clientController),
              buildTextFormField('Product Type', productsController),
              buildTextFormField('Location', locationController),
              SizedBox(height: 5),
              Divider(
                
                color: Colors.grey,
                thickness: 1.0,
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
              child: Text('Add'),
              onPressed: () {
                ClientData newClient = ClientData(
                  sNo: sNoController.text,
                  id: idController.text,
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
    );
  }

  Future<ClientData?> showEditDialog(ClientData currentItem) async {
    TextEditingController sNoController =
        TextEditingController(text: currentItem.sNo);
    TextEditingController idController =
        TextEditingController(text: currentItem.id);
    TextEditingController clientController =
        TextEditingController(text: currentItem.clientName);
    TextEditingController productsController =
        TextEditingController(text: currentItem.products);
    TextEditingController locationController =
        TextEditingController(text: currentItem.location);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Client'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextFormField('S.No', sNoController),
              buildTextFormField('Id', idController),
              buildTextFormField('Client Name', clientController),
              buildTextFormField('Products', productsController),
              buildTextFormField('Location', locationController),
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
                  id: idController.text,
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

  Widget buildTextFormField(
      String labelText, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          labelText: labelText,
        ),
      ),
    );
  }

  Widget buildText(String text) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
              DataColumn(label: Text('Actions')),
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
    );
  }
}
