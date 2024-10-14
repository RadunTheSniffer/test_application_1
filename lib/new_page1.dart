import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'new_page2.dart';

class NewPage1 extends StatelessWidget {
  const NewPage1({super.key});

  Future<void> _searchUser(BuildContext context, String username) async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8080/search_user.php?username=$username'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        // Navigate to NewPage2 with the search data
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewPage2(searchData: data)),
        );
      } else {
        print('Failed to load data: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Enter the username: ',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 80),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Username',
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _searchUser(context, _controller.text);
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
