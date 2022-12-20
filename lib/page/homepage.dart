import 'package:flutter/material.dart';
import 'package:todo_app/page/style.dart';
import 'package:todo_app/store/store.dart';

import 'add_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listOfTodo=[];
 @override
  void initState() {
    getInfo();
    super.initState();
  }
  Future getInfo() async {
    listOfTodo=await  LocalStore.getTodo();
    setState(() {});
  }
  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO LIST",style:Style.TextStyleBold(),
        ),
      ),
      body:ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
        itemCount: listOfTodo.length,
          itemBuilder: (context,index){
          return Row(

            children: [
            Checkbox(value: isCheck, onChanged: (value){

            }),
              Text(listOfTodo [index],style: Style.TextStyleBold(fontsize: 19,color: Colors.black,isDone: isCheck),),
            ],
          );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_){
            return A();
          }));
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Style.buleColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(Icons.add,color: Style.whiteColor,),
          ),
        ),
      ),

    );
  }
}