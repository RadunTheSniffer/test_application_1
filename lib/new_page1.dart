import 'package:flutter/material.dart';
import 'new_page2.dart';

class NewPage1 extends StatelessWidget {
  const NewPage1({super.key});

  void _navigateToNewPage2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewPage2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 150.0, bottom: 150.0, left: 200.0, right: 200.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Enter the username: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 80),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => _navigateToNewPage2(context),
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
