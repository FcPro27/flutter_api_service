
import 'package:ders/post_screen.dart';
import 'package:ders/service/todo_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    
    return  MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: apiService.getTodos(), 
            builder: (context, snapshot)
           {
            if (snapshot.hasData) {
              return Stack(
                children:[ ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data![index].title.toString());
                  },),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder:(context) =>const PostScreen(), ));
                    }, child:const Text("send data")),
                  )
              ]);
            }
            else if(snapshot.hasError){
              return Text("{$snapshot.error}");
            }
            return const CircularProgressIndicator();
          },),
        ),
      ),
    );
  }
}