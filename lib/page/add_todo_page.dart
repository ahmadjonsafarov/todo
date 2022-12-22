import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/page/homepage.dart';
import 'package:todo_app/page/style.dart';
import 'package:todo_app/store/store.dart';
import 'package:todo_app/widgets/keyboar.dart';
import 'dart:io' as B;

class A extends StatefulWidget {
  const A({Key? key}) : super(key: key);

  @override
  State<A> createState() => _AState();
}

class _AState extends State<A> {
  TextEditingController textEditingController=TextEditingController();
  bool isEmpty=false;
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
            title: Text("Add Todo",style:  Style.TextStyleBold(),),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                maxLength: 40,
                controller: textEditingController,
                onChanged: (value){
                  if(value.isEmpty){
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
                if(textEditingController.text.isNotEmpty){
                  LocalStore.setTodo(TodoModel(title: textEditingController.text));
                  // List<String> list=await LocalStore.getTodo();
                  // list.add(textEditingController.text);
                  // LocalStore.setList(list);
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (_)=>HomePage()),
                          (route) => false);
                }
              },
              child: Center(
                child: Text("Add",style:Style.TextStyleNormal,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
