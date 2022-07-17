import 'package:flutter/material.dart';

import 'setState/imc_state_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void _goToPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => _goToPage(context, ImcStatePage()), child: Text('SetState')),
            ElevatedButton(onPressed: () {}, child: Text('ChangeNotfier')),
            ElevatedButton(onPressed: () {}, child: Text('ValueNotifier')),
            ElevatedButton(onPressed: () {}, child: Text('Bloc Patter (Streams')),
          ],
        ),
      ),
    );
  }
}
