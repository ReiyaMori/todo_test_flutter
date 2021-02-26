import 'package:todo_test_app/list_add_page.dart';
import 'package:todo_test_app/task_edit.dart';
import 'package:flutter/material.dart';

void main()=>runApp(new MyTodoApp());

class MyTodoApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My TODO App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TodoListPage(),
    );
  }
}

//ステートフルでウィジットを起動
class TodoListPage extends StatefulWidget{

  @override
  _TodoListPageState createState()=> new _TodoListPageState();
}

//リスト一覧画面(State)
class _TodoListPageState extends State<TodoListPage>{
  //TODOリスト用の配列を用意
  List<Map> todoList = [];

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),

      //FloatingActionButtonでリスト追加
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          //pushでリスト画面に遷移
          //リスト追加画面からデータを受け取る
          final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                //リスト追加画面へ遷移
                return TodoAddPage();
              })
          );
          if(newListText != null){
            //  キャンセルした場合、newListTextはnullとなる
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        child: Icon(Icons.add),
      ),

      //ListViewでTODOを一覧表示
      body: ListView.builder(
          //リストの個数を指定
          itemCount: todoList.length,
          //リスト内容の指定
          itemBuilder: (context, index){
            return Card(
              //カードにリンク追加
              child:InkWell(
                onTap: (){
                  //ボトムシートの表示
                  showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.5),
                      builder: (BuildContext context){
                        return Container(
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(Icons.lightbulb, color: Colors.amber, size: 50,),
                                  title: Text(todoList[index]['title'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                                  subtitle: Text(todoList[index]['details'], style: TextStyle(fontSize: 20),),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        onPressed: (){
                                          setState(() {
                                            todoList.removeAt(index);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('delete', style: TextStyle(color: Colors.red),),
                                      ),
                                      TextButton(
                                        onPressed: ()async{
                                          final editTask = await Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                            return TaskEdit(todoList[index]['title'],todoList[index]['details']);
                                          }));
                                          if(editTask != null){
                                            setState(() {
                                              todoList[index] = editTask;
                                            });
                                          }
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('edit', style: TextStyle(color: Colors.blue),),
                                      )
                                    ],
                                  ),
                                )
                              ]
                          ),
                        );

                      }
                  );
                },
                child: ListTile(
                  title: Text(todoList[index]['title']),
                ),
              )
            );
          }
      ),
    );
  }
}




