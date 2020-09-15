import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchBoxController = TextEditingController();
  String _errorMessage;

  void search(String keyword) async {
    if (keyword != null && keyword.length > 0) {
    } else {
      setState(() => _errorMessage = "Write something!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieBox"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchBoxController,
              onSubmitted: (keyword) => search(keyword.trim()),
              onChanged: (keyword) => setState(() => _errorMessage = null),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  errorText: _errorMessage,
                  suffixIcon: Icon(Icons.search)),
            ),
          ],
        ),
      ),
    );
  }
}
