import 'package:flutter/cupertino.dart';
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

//リスト一覧画面
class TodoListPage extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト一覧'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('勉強する'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('掃除をする'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('皿洗いをする'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('洗濯をする'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('買い物に行く'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('復習をする'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('赤本を解く'),
            ),
          ),
        ],
      ),
      //FloatingActionButtonでリスト追加
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                //リスト追加画面へ遷移
                return TodoAddPage();
              })
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//リスト追加画面
class TodoAddPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //テキストフィールド
            TextField(),
            //リスト追加ボタン
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Text('リストに追加'),
                onPressed: (){},
              ),
            ),
            //キャンセルボタン
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              //キャンセルボタン
              child: FlatButton(
                onPressed: (){
                  //前の画面に戻る処理
                  Navigator.of(context).pop();
                },
                child: Text('キャンセル'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}