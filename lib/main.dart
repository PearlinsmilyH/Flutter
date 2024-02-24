import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("drawer"), backgroundColor: Colors.blue),
        drawer: const Drawer(
          backgroundColor: Colors.yellow,
          child: Column(
            children: [
              UserAccountsDrawerHeader(                                              //mentions current profile which is being used
                accountName: Text("Pearlin"),
                accountEmail: Text("smily@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text("PS"),
                ),
                otherAccountsPictures: [                                            //additional accounts 
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text("sp"),
                  )
                ],
              ),
              ListTile(                                                          
                leading: Icon(Icons.inbox),
                title: Text("All inboxes"),
              ),
              Divider(height: 10),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("Social"),
              ),
              Divider(height: 10),
              ListTile(
                leading: Icon(Icons.outbox),
                title: Text("Outbox"),
              ),
              Divider(height: 10),
              ListTile(
                leading: Icon(Icons.drafts),
                title: Text("Drafts"),
              ),
              Divider(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
