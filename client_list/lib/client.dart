import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Client List',
    home: ClientListWidget1(),
  ));
}

class ClientListWidget1 extends StatefulWidget {
  const ClientListWidget1({Key? key}) : super(key: key);

  @override
  State<ClientListWidget1> createState() => ClientListWidgetState();
}

class ClientListWidgetState extends State<ClientListWidget1> {
  void createClient() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          //contentPadding: EdgeInsets.zero,

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    color: Colors.white,
                    //  padding: EdgeInsets.all(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create Client',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                          ),
                          padding: EdgeInsets.only(left: 150),
                          color: Color.fromARGB(255, 29, 27, 27),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                      // SizedBox(height: 8),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              SizedBox(height: 5),
              // SizedBox(height: 8),
              buildText('Client Name'),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      labelText: 'Client Name'),
                ),
              ),
              buildText('Location'),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Location',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      labelText: 'Location'),
                ),
              ),
              buildText('Product Type'),
              Container(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Product Type',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      labelText: 'Product Type'),
                ),
              ),
              buildText('TPA List'),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'TPA List',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      labelText: 'TPA List'),
                ),
              ),
              buildText('Insurance Company'),
              Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Insurance Company',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      labelText: 'Insurance Company'),
                ),
              ),
              Divider(
                color: Colors.grey,
                thickness: 1.0,
              ),
              SizedBox(height: 5),
              Align(
                //padding: EdgeInsets.fromLTRB(0, 10, 0, 8),
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: createClient,
                  child: Text('Create Client'),
                ),
              ),
            ],
          ),
        ),
      );

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
      body: Center(
        child: ElevatedButton(
          onPressed: createClient,
          child: Text('Create Client'),
        ),
      ),
    );
  }
}
