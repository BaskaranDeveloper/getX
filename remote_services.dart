import 'package:untitled/models/Post.dart';
import 'package:http/http.dart' as http;

class RemoteService
{
  //now am using future meth

  Future<List<Post>?> getPost() async{
    //make http call

    //create a clint object
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    //now using the client object
    var response = await client.get(uri);

    //now check the status code 200

    if(response.statusCode == 200){
      var json = response.body;
       return postFromJson(json);
    }

  }
}
