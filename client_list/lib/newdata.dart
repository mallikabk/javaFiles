import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client_list/clientData.dart';

void main() {
  runApp(MyClientListData11());
}

class MyClientListData11 extends StatelessWidget {
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

  //final TextEditingController _idcontroller = TextEditingController();
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

  Future<void> fetchClients() async {
    final Uri url = Uri.parse('http://localhost:8087/client/allClients');
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
    final Uri url = Uri.parse('http://localhost:8087/client/addClient');
    final ClientsData newClient = ClientsData(
      clientName: _clientNameController.text,
      productType: _productTypeController.text,
      users: _usersController.text,
      location: _locationController.text,
      tpaList: _tpaListController.text,
      insurancecompany: _insuranceCompanyController.text,
      // id: int.parse(_idcontroller.text),
    );

    final http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(newClient.toMap()),
    );

    if (response.statusCode == 200) {
      // Client added successfully, update the client list
      fetchClients();
      clearTextFields();
      Navigator.of(context).pop(); // Close the dialog
    } else {
      throw Exception('Failed to add client');
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
            SizedBox(height: 16),
            buildTextFormField('Client Name', _clientNameController),
            buildTextFormField('Product Type', _productTypeController),
            buildTextFormField('Users', _usersController),
            buildTextFormField('Location', _locationController),
            buildTextFormField('TPA List', _tpaListController),
            buildTextFormField(
              'Insurance Company',
              _insuranceCompanyController,
            ),
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: addClient,
            child: Text('Create Client'),
          ),
          ElevatedButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClientsData>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final clientdata = snapshot.data!;
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(), // Empty container to fill the space
                      ),
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
                    ],
                  ),
                  DataTable(
                    columns: const [
                      DataColumn(
                          label: Text("ID",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue))),
                      DataColumn(
                          label: Text(
                        "ClientName",
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),
                      )),
                      DataColumn(
                          label: Text("ProductName",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))),
                      DataColumn(
                          label: Text("TPAList",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))),
                      DataColumn(
                          label: Text("Insurancecompany",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))),
                      DataColumn(
                          label: Text("User",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))),
                      DataColumn(
                          label: Text("Location",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue))),
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
                            DataCell(Text(e.location))
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
