import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client_list/clientData.dart';

class MyClientListData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Client List'),
          backgroundColor: Color.fromARGB(255, 52, 153, 207),
          centerTitle: true,
        ),
        body: ClientList(),
      ),
    );
  }
}

class ClientList extends StatefulWidget {
  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  List<ClientsData> clients = [];
  int currentPage = 0;                           // Current page index
  int rowsPerPage = 5;                           // Rows per page
  List<int> availableRowsPerPage = [5, 10, 15];  // Available rows per page options
  int selectedRowsPerPage = 5;                   // Selected rows per page option
  String selectedSearchColumn = 'Campaign Name'; // Selected search column
  String searchText = '';                   
 
  Future<List<ClientsData>> fetchData() async {
    final response = await http.get(
      Uri.parse("http://localhost:8087/client/allClients"),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodedData = jsonDecode(response.body);
      final clientDataList =
          decodedData.map((item) => ClientsData.fromJson(item)).toList();
      return clientDataList;
    } else {
      throw Exception("Failed to fetch data");
    }
  }

  final TextEditingController _clientNameController = TextEditingController();
  final TextEditingController _productTypeController = TextEditingController();
  final TextEditingController _usersController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _tpaListController = TextEditingController();
  final TextEditingController _insuranceCompanyController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchClients();
  }

  Future<void> deleteClient(int clientId) async {
    final url =
        Uri.parse('http://192.168.3.192:8087/client/deleteClient/$clientId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      fetchClients();
    } else {
      throw Exception('Failed to delete client');
    }
  }

  Future<void> fetchClients() async {
    final Uri url = Uri.parse('http://192.168.3.192:8087/client/allClients');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<ClientsData> fetchedClients =
          data.map((item) => ClientsData.fromMap(item)).toList();

      setState(() {
        clients = fetchedClients;
      });
    } else {
      throw Exception('Failed to fetch clients');
    }
  }

  Future<void> addClient() async {
    final Uri url = Uri.parse('http://192.168.3.192:8087/client/addClient');
    final ClientsData newClient = ClientsData(
      clientName: _clientNameController.text,
      productType: _productTypeController.text,
      users: _usersController.text,
      location: _locationController.text,
      tpaList: _tpaListController.text,
      insurancecompany: _insuranceCompanyController.text,
    );

    final http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newClient.toMap()),
    );

    if (response.statusCode == 200) {
      fetchClients();
      clearTextFields();
    } else {
      throw Exception('Failed to add client');
    }
  }

  Future<void> updateClient(ClientsData updatedClient) async {
    final Uri url = Uri.parse('http://192.168.3.192:8087/client/updateClient');

    final http.Response response = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(updatedClient.toMap()),
    );

    if (response.statusCode == 200) {
      fetchClients();
    } else {
      throw Exception('Failed to update client');
    }
  }

  void clearTextFields() {
    _clientNameController.clear();
    _productTypeController.clear();
    _usersController.clear();
    _locationController.clear();
    _tpaListController.clear();
    _insuranceCompanyController.clear();
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

  Widget buildTextFormField(
    String labelText,
    TextEditingController controller,
  ) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                labelText: labelText,
              ),
            ),
          )
        ],
      ),
    );
  }

  PopupMenuItem<String> popUpInfo(String txt) {
    return PopupMenuItem<String>(
      value: txt,
      child: Text(txt),
    );
  }

  DataColumn columnInfo(String text) {
    return DataColumn(
        label: Text(text,
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black)));
  }

  void openAddClientDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Create Client',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Divider(
              color: Colors.grey,
              thickness: 1.0,
            ),
            SizedBox(height: 16),
            buildTextFormField('Client Name', _clientNameController),
            buildTextFormField('Product Type', _productTypeController),
            buildTextFormField('Users', _usersController),
            buildTextFormField('Location', _locationController),
            buildTextFormField('TPA List', _tpaListController),
            Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextFormField(
                controller: _insuranceCompanyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  labelText: 'Insurance Company',
                ),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              addClient();
            },
            child: Text('Create Client'),
          ),
        ],
      ),
    );
  }

  Future<ClientsData?> showEditDialog(ClientsData client) async {
    TextEditingController _clientNameController =
        TextEditingController(text: client.clientName);
    TextEditingController _productTypeController =
        TextEditingController(text: client.productType);
    TextEditingController _usersController =
        TextEditingController(text: client.users);
    TextEditingController _locationController =
        TextEditingController(text: client.location);
    TextEditingController _tpaListController =
        TextEditingController(text: client.tpaList);
    TextEditingController _insuranceCompanyController =
        TextEditingController(text: client.insurancecompany);
    TextEditingController _idcontroller =
        TextEditingController(text: client.id.toString());
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Client'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextFormField('Id', _idcontroller),
              buildTextFormField('Client Name', _clientNameController),
              buildTextFormField('Product Type', _productTypeController),
              buildTextFormField('Location', _locationController),
              buildTextFormField('Users', _usersController),
              buildTextFormField('TPA List', _tpaListController),
              buildTextFormField(
                  'Insurance Company', _insuranceCompanyController),
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
                Navigator.pop(context);
                final newClient = ClientsData(
                  id: client.id,
                  clientName: _clientNameController.text,
                  productType: _productTypeController.text,
                  users: _usersController.text,
                  location: _locationController.text,
                  tpaList: _tpaListController.text,
                  insurancecompany: _insuranceCompanyController.text,
                );
                updateClient(newClient);
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
                deleteClient(index);
              },
            ),
          ],
        );
      },
    );
  }

  void showPopupMenu(BuildContext context, ClientsData data) {
    final List<PopupMenuEntry<String>> popupItems = [
      popUpInfo("Add product"),
      popUpInfo("Add User"),
      popUpInfo("Edit"),
      popUpInfo("CLient Archive"),
      popUpInfo("Product Archive"),
      popUpInfo("Delete"),
    ];
    showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(230, 180, 200, 300),
      items: popupItems,
      elevation: 8,
    ).then((value) {
      if (value == 'Show Products') {
      } else if (value == 'Show Products') {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add Product',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Add Product',
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else if (value == 'Delete') {
        showDeleteDialog(data.id);
      } else if (value == 'Edit') {
        showEditDialog(data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ClientsData> filteredCampaigns = clients.where((campaign) {
      switch (selectedSearchColumn) {
        case 'S.NO':
          return clients..toString().contains(searchText);
        case 'Campaign Name':
          return clients.contains(searchText);
        case 'Type':
          return clients.type.contains(searchText);
        case 'Status':
          return clients.status.contains(searchText);
        case 'Start Date':
          return clients.startDate.toString().contains(searchText);
        case 'End Date':
          return clients.endDate.toString().contains(searchText);
        case 'Campaign Owner':
          return clients.campaignOwner.contains(searchText);
        default:
          return false;
      }
    }).toList();

    return FutureBuilder<List<ClientsData>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final clientdata = snapshot.data!;
          return Scaffold(
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(350, 0, 0, 0)),
                      Flexible(
                        child: SizedBox(
                          width: 200,
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Search',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 8.0),
                              hintStyle: TextStyle(fontSize: 12.0),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                borderSide: BorderSide(
                                  color: Color.fromARGB(247, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      DropdownButton<String>(
                        // Step 3.
                        value: dropDownVal,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownVal = newValue!;
                          });
                        },
                      
                        items: <String>[
                          'client Name',
                          'location',
                          'insuranceCompany',
                          'tpa List'
                        ]
                            .map<DropdownMenuItem<String>>(
                              (String v) => DropdownMenuItem<String>(
                                value: v,
                                child: Text(
                                  v,
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            )
                            .toList(),
                      ),

                      //   })
                      // // Container(
                      //   child: TextFormField(
                      //     decoration: InputDecoration(
                      //         border: OutlineInputBorder(
                      //             borderRadius:
                      //                 BorderRadius.all(Radius.circular(20.0)))),
                      //   ),
                      // ),
                      // Expanded(
                      //     child: Container() ),
                      // // ),
                      Padding(padding: EdgeInsets.fromLTRB(500, 0, 0, 0)),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                            onPressed: openAddClientDialog,
                            child: Text('Create Client'),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[400],
                          ),
                          child: const Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DataTable(
                    columns: [
                      columnInfo("ID"),
                      columnInfo("ClientName"),
                      columnInfo("Product Name"),
                      columnInfo("TPA List"),
                      columnInfo("Insurance Company"),
                      columnInfo("Users"),
                      columnInfo("Location"),
                      columnInfo("Actions"),
                    ],
                    rows: clientdata
                        .map(
                          (e) => DataRow(cells: [
                            DataCell(Text(e.id.toString())),
                            DataCell(Text(e.clientName)),
                            DataCell(Text(e.productType)),
                            DataCell(Text(e.tpaList)),
                            DataCell(Text(e.insurancecompany)),
                            DataCell(Text(e.users)),
                            DataCell(Text(e.location)),
                            DataCell(IconButton(
                              onPressed: () {
                                showPopupMenu(context, e);
                              },
                              icon: const Icon(Icons.more_vert),
                            )),
                          ]),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
