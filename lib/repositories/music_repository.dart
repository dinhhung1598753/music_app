import 'package:http/http.dart' as http;

Future<http.Response> fetchCategory() async {
  final response = await http.get(Uri.parse(
      'https://zingmp3.vn/api/v2/page/get/hub-home?ctime=1661073074&version=1.7.20&sig=0c64a153fac4bbb1166e0c60f77b933c626eb7221716b5d6fad9657100be1662e6d3b60f6f621784befc5fdd9374a7c666fb0202a32b1f68ef4efa0c621769ea&apiKey=X5BM3w8N7MKozC0B85o4KMlzLZKhV00y'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    // return Album.fromJson(jsonDecode(response.body));
    print(response.body);
    return response;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
