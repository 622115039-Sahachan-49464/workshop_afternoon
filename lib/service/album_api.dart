import 'dart:async';
import 'package:http/http.dart' as http;

class AlbumApi {

  // get all albums data
  Future<http.Response> fetchAlbum() {
    return http.get(Uri.https("jsonplaceholder.typicode.com","/photos"));
  }
}