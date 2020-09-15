import 'package:flutter/material.dart';
import 'package:moviebox/server/api.dart' as api;
import 'package:moviebox/widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchBoxController = TextEditingController();
  String _errorMessage;
  bool _isFetching = false;
  List _results = [];

  _search(String keyword) async {
    if (keyword != null && keyword.length > 0) {
      setState(() => {_isFetching = true, _errorMessage = null, _results = []});
      var result = await api.searchMovies(keyword);
      if (result['Response'] == "True") {
        setState(() => {_isFetching = false, _results = result['Search']});
      } else {
        setState(() => {
              _isFetching = false,
              _errorMessage = result['Error'],
              _results = []
            });
      }
    } else {
      setState(() => {
            _isFetching = false,
            _errorMessage = "Write something!",
            _results = []
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MovieBox"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchBoxController,
              onSubmitted: (keyword) => _search(keyword.trim()),
              onChanged: (keyword) => setState(() => _errorMessage = null),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  errorText: _errorMessage,
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          Divider(),
          _isFetching && _results.length == 0
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 100 / 170,
                      ),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(8.0),
                      itemCount: _results.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: MovieCard(data: _results[index]),
                        );
                      }),
                )
        ],
      ),
    );
  }
}
