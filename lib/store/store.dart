import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/todo_model.dart';

abstract class LocalStore{
LocalStore._();
static setTodo(TodoModel todo) async {
  SharedPreferences store=await SharedPreferences.getInstance();
  List<String> list=store.getStringList('todo') ?? [];
  String todoJson=jsonEncode(todo.ToJson());
  list.add(todoJson);
  store.setStringList('todo', list);
}
static Future<List<TodoModel>> getTodo() async {
  SharedPreferences store=await SharedPreferences.getInstance();
  List<String> list =store.getStringList('todo')?? [];
  List<TodoModel> listOfTodo=[];
  list.forEach((element) {
    listOfTodo.add(TodoModel.fromJson(jsonDecode(element)));
  });
  return listOfTodo;
}
}