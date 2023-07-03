import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:client_list/clientData.dart';

class MyClientListData1 extends StatelessWidget {
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
        Uri.parse('http://localhost:8087/client/deleteClient/$clientId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      // Client deleted successfully, update the client list
      fetchClients();
    } else {
      throw Exception('Failed to delete client');
    }
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
    final Uri url = Uri.parse('http://localhost:8087/client/updateClient');

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

  void openAddClientDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Client'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _clientNameController,
                  decoration: InputDecoration(labelText: 'Client Name'),
                ),
                TextField(
                  controller: _productTypeController,
                  decoration: InputDecoration(labelText: 'Product Type'),
                ),
                TextField(
                  controller: _usersController,
                  decoration: InputDecoration(labelText: 'Users'),
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  controller: _tpaListController,
                  decoration: InputDecoration(labelText: 'TPA List'),
                ),
                TextField(
                  controller: _insuranceCompanyController,
                  decoration: InputDecoration(labelText: 'Insurance Company'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                addClient();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                clearTextFields();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void openEditClientDialog(ClientsData client) {
    _clientNameController.text = client.clientName;
    _productTypeController.text = client.productType;
    _usersController.text = client.users;
    _locationController.text = client.location;
    _tpaListController.text = client.tpaList;
    _insuranceCompanyController.text = client.insurancecompany;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Client'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _clientNameController,
                  decoration: InputDecoration(labelText: 'Client Name'),
                ),
                TextField(
                  controller: _productTypeController,
                  decoration: InputDecoration(labelText: 'Product Type'),
                ),
                TextField(
                  controller: _usersController,
                  decoration: InputDecoration(labelText: 'Users'),
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                TextField(
                  controller: _tpaListController,
                  decoration: InputDecoration(labelText: 'TPA List'),
                ),
                TextField(
                  controller: _insuranceCompanyController,
                  decoration: InputDecoration(labelText: 'Insurance Company'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                ClientsData updatedClient = ClientsData(
                  id: client.id,
                  clientName: _clientNameController.text,
                  productType: _productTypeController.text,
                  users: _usersController.text,
                  location: _locationController.text,
                  tpaList: _tpaListController.text,
                  insurancecompany: _insuranceCompanyController.text,
                );
                Navigator.pop(context);
                updateClient(updatedClient);
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void openDeleteClientDialog(ClientsData client) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Client'),
          content: Text('Are you sure you want to delete this client?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                deleteClient(client.id);
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void clearTextFields() {
    _clientNameController.clear();
    _productTypeController.clear();
    _usersController.clear();
    _locationController.clear();
    _tpaListController.clear();
    _insuranceCompanyController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              openAddClientDialog();
            },
            child: Text('Add Client'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: clients.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(clients[index].clientName),
                  subtitle: Text(clients[index].productType),
                  onTap: () {
                    openEditClientDialog(clients[index]);
                  },
                  onLongPress: () {
                    openDeleteClientDialog(clients[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MyClientListData1());
}
