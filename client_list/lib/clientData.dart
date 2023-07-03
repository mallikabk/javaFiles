import 'dart:convert';

List<ClientsData> ClientsDataFromJson(String str) => List<ClientsData>.from(
    json.decode(str).map((x) => ClientsData.fromJson(x)));

String ClientsDataToJson(List<ClientsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientsData {
  int id;
  String clientName;
  String productType;
  String users;
  String location;
  String tpaList;
  String insurancecompany;

  ClientsData({
     this.id=0,
    required this.clientName,
    required this.productType,
    required this.users,
    required this.location,
    required this.tpaList,
    required this.insurancecompany,
  });

  factory ClientsData.fromJson(Map<String, dynamic> json) => ClientsData(
        id: json["id"],
        clientName: json["clientName"],
        productType: json["productType"],
        users: json["users"],
        location: json["location"],
        tpaList: json["tpaList"],
        insurancecompany: json["insurancecompany"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientName": clientName,
        "productType": productType,
        "users": users,
        "location": location,
        "tpaList": tpaList,
        "insurancecompany": insurancecompany,
      };
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clientName': clientName,
      'productType': productType,
      'location': location,
      'users': users,
      'tpaList': tpaList,
      'insurancecompany': insurancecompany,
    };
  }

  factory ClientsData.fromMap(Map<String, dynamic> map) {
    return ClientsData(
      id: map['id'],
      clientName: map['clientName'],
      productType: map['productType'],
      location: map['location'],
      users: map['users'],
      tpaList: map['tpaList'],
      insurancecompany: map['insurancecompany'],
      
    );
  }
}
