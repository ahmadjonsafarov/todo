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
static setbool(TodoModel todo,int index) async {
  SharedPreferences store=await SharedPreferences.getInstance();
  List<String> list=store.getStringList('todo') ?? [];
  List<TodoModel> listOfTodo=[];
  list.forEach((element) {
    listOfTodo.add(TodoModel.fromJson(jsonDecode(element)));
  });
  listOfTodo.removeAt(index);
  listOfTodo.insert(index, todo);
  list.clear();
  listOfTodo.forEach((element) {
    list.add(jsonEncode(element.ToJson()));
  });
  store.setStringList('todo', list);
}
static removeTodo(int index) async {
  SharedPreferences store= await SharedPreferences.getInstance();
  List<String> list=store.getStringList("todo") ?? [];
  list.removeAt(index);
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
static setDOne(TodoModel done) async {
  SharedPreferences store=await SharedPreferences.getInstance();
  List<String> list=store.getStringList('done') ?? [];
  String todoJson=jsonEncode(done.ToJson());
  list.add(todoJson);
  store.setStringList('done', list);
}
static setdonebool(TodoModel todo,int index) async {
  SharedPreferences store=await SharedPreferences.getInstance();
  List<String> list=store.getStringList('done') ?? [];
  List<TodoModel> listOfTodo=[];
  list.forEach((element) {
    listOfTodo.add(TodoModel.fromJson(jsonDecode(element)));
  });
  listOfTodo.removeAt(index);
  listOfTodo.insert(index, todo);
  list.clear();
  listOfTodo.forEach((element) {
    list.add(jsonEncode(element.ToJson()));
  });
  store.setStringList('done', list);
}
static removeDone(int index) async {
  SharedPreferences store= await SharedPreferences.getInstance();
  List<String> list=store.getStringList("done") ?? [];
  list.removeAt(index);
  store.setStringList('done', list);
}
static Future<List<TodoModel>> getDone() async {
  SharedPreferences store=await SharedPreferences.getInstance();
  List<String> list =store.getStringList('done')?? [];
  List<TodoModel> listOfDone=[];
  list.forEach((element) {
    listOfDone.add(TodoModel.fromJson(jsonDecode(element)));
  });
  return listOfDone;
}
}