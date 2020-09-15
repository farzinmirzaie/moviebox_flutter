import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  MovieCard({Key key, this.data}) : super(key: key);

  final Map data;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      ),
      onPressed: () => print(data['imdbID']),
      color: Colors.white,
      child: Column(children: [
        SizedBox(height: 12),
        ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.network(
              data['Poster'],
              // fit: BoxFit.fill,
            )),
        SizedBox(height: 12),
        Text(
          data['Title'],
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text("${data['Year']} / ${data['Type']}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
            )),
        // Text(data['Poster']),
      ]),
    );
  }
}
