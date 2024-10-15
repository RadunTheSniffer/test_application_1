import 'package:flutter/material.dart';

class NewPage3 extends StatelessWidget {
  final List<dynamic> searchData;
  final bool isVisible;

  const NewPage3({super.key, required this.searchData, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page 3'),
      ),
      body: Center(
        child: Visibility(
          visible: isVisible,
          child: searchData.isEmpty
              ? const Text('No results found.')
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(40.0),
                        padding: const EdgeInsets.all(20.0),
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
                        child: ListView.builder(
                          itemCount: searchData.length,
                          itemBuilder: (context, index) {
                            var item = searchData[index];
                            return ListTile(
                              title: Text(item['name']),
                              subtitle: Text('Age: ${item['age']}, Occupation: ${item['occupation']}'),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
