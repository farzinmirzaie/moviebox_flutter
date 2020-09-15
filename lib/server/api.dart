import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

var _apiKey = DotEnv().env['API_KEY'];
var _baseURL = 'http://www.omdbapi.com/?apikey=' + _apiKey;

_getRequest(url) async {
  var response = await http.get(url);
  return convert.jsonDecode(response.body);
}

searchMovies(String query, {int page = 1}) async {
  var url = _baseURL + "&s=" + query + "&page=" + page.toString();
  return _getRequest(url);
}

getMovie(String id) async {
  var url = _baseURL + "&i=" + id;
  return _getRequest(url);
}
