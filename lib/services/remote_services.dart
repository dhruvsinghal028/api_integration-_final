// import '../model/post.dart';
// import 'package:http/http.dart' as http;

//   Future<List<Post>?> getPost() async {
//     var client = http.Client();

//     var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
//     var response = await client.get(uri);
//     if (response.statusCode == 200) {
//       var json = response.body;
//       return postFromJson(json);
//     }
//   }
// }

//............
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/post.dart';

const baseUrl = 'https://inshorts.deta.dev/news?category=technology';

// class MyApiClient {
// MyApiClient(this.httpClient);
class RemoteService {
  Future<List<Datum?>?> getData() async {
    final httpClient = http.Client();
    // try {
    var response = await httpClient.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      Post posts = Post?.fromJson(jsonResponse);
      Iterable dataResponse = posts.data;
      List<Datum?> dataList = posts.data.toList();
      return dataList;
    } else
      print("Error");
  }
}
