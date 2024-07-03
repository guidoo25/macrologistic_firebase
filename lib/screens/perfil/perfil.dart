import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String role = '';
  String empresa = '';
  String userid = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString('role') ?? '';
      empresa = prefs.getString('sol') ?? '';
      userid = prefs.getString('userid') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(

              radius: 100,
              backgroundColor: Colors.black12,
            ),
            SizedBox(height: 20),
            Text('$empresa',
                style: TextStyle(
                    color: Color.fromARGB(255, 50, 51, 51), fontSize: 18)),
            if (role == '4')
              Text('Conductor',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 51, 51), fontSize: 18)),
            if (role == '3')
              Text('Admin',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 51, 51), fontSize: 18)),
            if (role != '4' && role != '3')
              Text('Rol: $role',
                  style: TextStyle(
                      color: Color.fromARGB(255, 50, 51, 51), fontSize: 18)),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
