import 'dart:convert';
import 'package:client_list/clientData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Tempfetch extends StatefulWidget {
  const Tempfetch({Key? key}) : super(key: key);

  @override
  State<Tempfetch> createState() => _TempfetchState();
}

class _TempfetchState extends State<Tempfetch> {
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

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ClientsData>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final clientdata = snapshot.data!;
          return DataTable(
            columns: const [
              DataColumn(label: Text("ID")),
              DataColumn(label: Text("ClientName")),
              DataColumn(label: Text("ProductName")),
              DataColumn(label: Text("TPAList")),
              DataColumn(label: Text("Insurancecompany")),
              DataColumn(label: Text("UserList")),
              DataColumn(label: Text("Location")),
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
                    
                  ]),
                )
                .toList(),
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
