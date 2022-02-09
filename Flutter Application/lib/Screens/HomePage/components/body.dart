import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/ChatBot/internal_med.dart';
import 'package:flutter_auth/Screens/ChatBot/paediatrics.dart';
import 'package:flutter_auth/Screens/ChatBot/obs_gyn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    Size size = MediaQuery.of(context).size;
 return new Scaffold(
   body: new Container(
     padding: new EdgeInsets.all(18.22),
        child: Center(
          child: new Column(
          children: <Widget>[
          new Card(
            margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.medical_services_rounded),
                  title: Text('Internal Medicine'),
                  subtitle: Text('Medical specialty dealing with the prevention, diagnosis, and treatment of internal diseases'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('LEARN MORE'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('TRY OUT'),
                      onPressed: () {
                        Navigator.push(
                            context,
                        MaterialPageRoute(
                          builder: (context) {
                            return InternalMedicine();
                          },
                        ), );
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
   new Card(
     margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: <Widget>[
         const ListTile(
           leading: Icon(Icons.child_care_outlined),
           title: Text('Paediatrics'),
           subtitle: Text('Medical specialty that involves the medical care of infants, children, and adolescents'),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             TextButton(
               child: const Text('LEARN MORE'),
               onPressed: () {/* ... */},
             ),
             const SizedBox(width: 8),
             TextButton(
               child: const Text('TRY OUT'),
               onPressed: () {
                   Navigator.push(
                            context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Paediatrics();
                          },
                        ), );
                 },
             ),
             const SizedBox(width: 8),
           ],
         ),
       ],
     ),
   ),
            new Card(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: new Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Icon(Icons.baby_changing_station),
                    title: Text('Obstetrics/Gynaecology'),
                    subtitle: Text('Medical specialty that encompasses the two subspecialties of obstetrics & gynecology'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                        child: const Text('LEARN MORE'),
                        onPressed: () {/* ... */},
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        child: const Text('TRY OUT'),
                        onPressed: () {
                           Navigator.push(
                            context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ObsGyn();
                          },
                        ), );
                         },
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
              ),
            ),
   ]
        ),
      ),
   ),
      appBar: new AppBar(
    leading:Icon(
      Icons.local_hospital,
        ),
    title:
    Column(
      children: [
        Text('Clinical Rotations'),
        Text(
            'Logged' +(user == null ? ' out' : ' in')+ '',
        style: TextStyle(
            fontSize: 12
        ),
        ),
      ],
    ),
    backgroundColor: Colors.purple,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.history_edu_rounded,
                  size: 26.0,
                ),
              )
          ),
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen();
                      },
                    ),
                  );
                },
                child: Icon(
                    Icons.logout
                ),
              )
          ),
        ],

   ),
    );



  }
}
