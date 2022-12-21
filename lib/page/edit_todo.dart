import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/page/style.dart';

import '../store/store.dart';
import '../widgets/keyboar.dart';
import 'homepage.dart';

class EditTodoPage extends StatefulWidget {
  final int index;
  final TodoModel todomodel;
  const EditTodoPage({Key? key, required this.todomodel, required this.index}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String oldTitle="";
   TextEditingController textEditingController=TextEditingController();
  bool isEmpty=false;
  @override
  void initState() {
    textEditingController.text=widget.todomodel.title;
    oldTitle=widget.todomodel.title;
    super.initState();
  }
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text("chiqishni xoxlaysizmi"),
            actions: [
              ElevatedButton(onPressed: (){Navigator.pop(context);Navigator.pop(context);}, child: Text("Ha")),
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Yoq")),
            ],
          );
        });
        return Future.value(false);
      },
      child: OnUnFocusTap(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Edit Todo",style:  Style.TextStyleBold(),),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                autofocus: true,
                maxLength: 35,
                controller: textEditingController,
                onChanged: (value){
                  if(value.isEmpty || oldTitle==value){
                    isEmpty=false;
                  }else{
                    isEmpty=true;
                  }
                  setState(() {});
                },
                decoration: InputDecoration(
                    labelText: "Text",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              gradient: isEmpty? Style.HomeGgradient:Style.Ggradient,
              borderRadius: BorderRadius.circular(100),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () async {
                if(isEmpty){
                  LocalStore.setbool(TodoModel(title: textEditingController.text,isDone: widget.todomodel.isDone ), widget.index);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
                }
              },
              child: Center(
                child: Text("Edit",style:Style.TextStyleNormal,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

