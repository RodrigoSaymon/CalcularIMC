// // ok

// import 'package:flutter/material.dart';
// import 'package:imc/home_Page.dart'as navegacao;
// import 'package:imc/setState/imc_state_page.dart';


import 'package:flutter/material.dart';
import 'package:imc/home_Page.dart' as navegacao;
import 'package:imc/setState/imc_state_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      routes: {
        '/': (context) => const navegacao.HomePage(),
        '/imc': (context) => const ImcStatePage(),
      },
    );
  }
}


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//    const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       routes: {
//         '/': (_) => const navegacao.HomePage(),
//         '/imc': (_) => const ImcStatePage(),
//       },
//       // home: const  HomePage(),
      
//     );
//   }
// }

