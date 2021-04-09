import 'package:get/get_connect.dart';

class Api extends GetConnect {
  Future<Response> getPublicationApi() =>
      get('https://run.mocky.io/v3/29ca1a88-ec02-44aa-9d26-214983b174a9');
  // Post request
  // Future<Response> postUser(Map data) => post('http://youapi/users', body: data);
  //
  Future getPublication() async {
    try {
      var response = await getPublicationApi();
      Map<String, dynamic> data = response.body;
      return data;
    } catch (e) {
      print(e);
    }
  }
}
