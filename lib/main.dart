import 'package:flutter/material.dart';
// import 'package:nordic_nrf_mesh_example/src/app.dart';

// void main() => runApp(const NordicNrfMeshExampleApp());
import 'package:get/get.dart';

import 'screens/connections_screen.dart';


List<int> connectedDevices = [];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
     home: const ConnectionsScreen(),
    
    );
  }
}
