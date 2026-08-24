import 'package:flutter/material.dart';

void main() {
  runApp(const AppMovil());
}

class AppMovil extends StatefulWidget {
  const AppMovil({super.key});

  @override
  State<AppMovil> createState() => _AppMovilState();
}

class _AppMovilState extends State<AppMovil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hospital San Jose",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Menu principal"),
          backgroundColor: Colors.redAccent,
          foregroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              Image(
                image: NetworkImage('https://picsum.photos/330/200'),
                height: 120,
                width: 120,
              ),
              Card(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.home, color: Colors.blue),
                  label: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Inicio',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
              Card(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.contact_mail_sharp,
                    color: Colors.blue,
                  ),
                  label: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Datos Personales',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
              Card(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.payment_sharp, color: Colors.blue),
                  label: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Metodo de Pago',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Inicio'),
              subtitle: Text("Portal Medico"),
              trailing: Icon(Icons.arrow_circle_right),
              leading: Icon(Icons.access_alarms_sharp),
            ),
            ListTile(
              title: Text('Inicio'),
              subtitle: Text("Medicina General"),
              trailing: Icon(Icons.arrow_circle_right),
              leading: Icon(Icons.access_alarms_sharp),
            ),
            ListTile(
              title: Text('Medicina Especializada'),
              subtitle: Text("Citas Medicas"),
              trailing: Icon(Icons.arrow_circle_right),
              leading: Icon(Icons.access_alarms_sharp),
            ),
            ListTile(
              title: Text('Psicologia'),
              subtitle: Text("Citas Medicas"),
              trailing: Icon(Icons.arrow_circle_right),
              leading: Icon(Icons.access_alarms_sharp),
            ),
          ],
        ),
      ),
    );
  }
}
