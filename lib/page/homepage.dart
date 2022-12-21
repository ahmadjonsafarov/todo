import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/page/edit_todo.dart';
import 'package:todo_app/page/style.dart';
import 'package:todo_app/store/store.dart';
import 'package:todo_app/widgets/keyboar.dart';
import 'add_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  List<TodoModel> listOfTodo=[];
  List<TodoModel> listOfDone=[];
  TabController? _tabController;

 @override
  void initState() {
    getInfo();
    _tabController=TabController(length: 2, vsync: this);
    super.initState();
  }
  Future getInfo() async {
   List<TodoModel> list=await LocalStore.getTodo();
   list.forEach((element) {
     if(element.isDone){
       listOfDone.add(element);
     }else{
       listOfTodo.add(element);
     }
   });
    setState(() {});
  }
  bool isCheck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO LIST",style:Style.TextStyleBold(),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor:Colors.black,
          unselectedLabelColor: Style.whiteColor,
          labelColor: Colors.black,
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('To Do'),
                  SizedBox(width: 10,),
                  Icon(Icons.done)
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Done'),
                  SizedBox(width: 10,),
                  Icon(Icons.done_all)
                ],
              ),
            ),
          ],
        ),
      ),
      body:TabBarView(
        controller: _tabController,
        children:[
          ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
          itemCount: listOfTodo.length,
            itemBuilder: (context,index){
            return GestureDetector(
              onLongPress: (){
                showCupertinoDialog(context: context, builder: (context){
                  return CupertinoAlertDialog(
                    title: Text("Tanlang"),
                    actions: [
                      TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return EditTodoPage(todomodel: listOfTodo[index], index: index,);
                        }));
                      }, child: Text("Edit(o'zgartirish)")),
                      TextButton(onPressed: (){
                        listOfTodo.removeAt(index);
                        Navigator.pop(context);
                        setState(() {});
                      }, child: Text("Delete(o'chirish)")),
                      TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
                    ],
                  );
                });
              },
              child: Column(
                children: [
                  Row(
                    children: [
                    Checkbox(value: listOfTodo[index].isDone, onChanged: (value){
                      listOfTodo[index].isDone=!listOfTodo[index].isDone;
                      listOfDone.add(listOfTodo[index]);
                      LocalStore.setbool(listOfTodo[index], index);
                      listOfTodo.removeAt(index);
                      setState(() { });
                    }),
                      Text(listOfTodo[index].title,style: Style.TextStyleBold(fontsize: 19,color: Colors.black,isDone: listOfTodo[index].isDone),),
                    ],
                  ),
                  Divider(),
                ],
              ),
            );
        }),
          ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              itemCount: listOfDone.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onLongPress: (){
                    showCupertinoDialog(context: context, builder: (context){
                      return CupertinoAlertDialog(
                        title: Text("Tanlang"),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return EditTodoPage(todomodel: listOfDone[index], index: index,);
                            }));
                          }, child: Text("Edit(o'zgartirish)")),
                          TextButton(onPressed: (){
                            LocalStore.removeTodo(index);
                            listOfDone.removeAt(index);
                            Navigator.pop(context);
                            setState(() {});
                          }, child: Text("Delete(o'chirish)")),
                          TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
                        ],
                      );
                    });
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(value: listOfDone[index].isDone, onChanged: (value){
                            listOfDone[index].isDone=!listOfDone[index].isDone;
                            listOfTodo.add(listOfDone[index]);
                            LocalStore.setbool(listOfDone[index], index);
                            listOfDone.removeAt(index);
                            setState(() { });
                          }),
                          Text(listOfDone[index].title,style: Style.TextStyleBold(fontsize: 19,color: Colors.black,isDone: listOfDone[index].isDone),),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              }),
        ]
      ),
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
