import 'package:ders/model/model.dart';
import 'package:ders/service/todo_service.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  TextEditingController useridController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  ApiService apiService =ApiService();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("userId")),
              Expanded(child: TextField(
                controller: useridController,
              )),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("Id")),
              Expanded(child: TextField(
                controller: idController,
              )),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("title")),
              Expanded(child: TextField(
                controller: titleController,
              )),
            ],
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(child: Text("body")),
              Expanded(child: TextField(
                controller: bodyController,
              )),
            ],
          ),
          ElevatedButton(onPressed:() async {
            sendData();
          }, 
          child:const Text("send"))
        ],
        
      )
    );
  }
  void sendData() async{
    GetModel model = GetModel(
     userId : int.parse(useridController.text),
     id : int.parse(idController.text),
     title : titleController.text,
     body : bodyController.text,
    );
     final resp = await apiService.postTodos(model);
     print(resp.statusCode);
}
}
