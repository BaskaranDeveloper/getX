import 'package:flutter/material.dart';
import 'package:untitled/services/remote_services.dart';
import '../models/Post.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //create a model response in state
  List<Post>? posts;

  //now create all res load
  var isLoading = false; //it's init false


  //now ovveride the metho

  @override
  void initState(){
    super.initState();

    getData();
  }

  //create a getData meth

  getData() async {
    posts = await RemoteService().getPost();

    if(posts != null){
      setState((){
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API DEMO"),centerTitle: true,),
      body: Visibility(
        visible: isLoading,
        child: ListView.builder(itemCount: posts?.length,
            itemBuilder: (context, index){
          return Container(child: Text(posts![index].title,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.orange),));
        }),
        replacement: Center(child: CircularProgressIndicator(),),
      ),

    );
  }
}
