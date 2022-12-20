class TodoModel{
 final String title;
   bool isDone;
   TodoModel({required this.title,this.isDone=false});
   factory TodoModel.fromJson(Map todo){
     return TodoModel(title: todo['title'],isDone: todo['isDone']);
   }
   Map ToJson(){
     return {'title':title,"isDone":isDone};
}
}