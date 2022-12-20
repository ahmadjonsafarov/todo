import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStore{
LocalStore._();
static setList(List<String> todos) async {
  SharedPreferences store=await SharedPreferences.getInstance();
  store.setStringList('todo', todos);
}
static Future<List<String>> getTodo() async {
  SharedPreferences store=await SharedPreferences.getInstance();
  return store.getStringList('todo') ?? [];
}
}