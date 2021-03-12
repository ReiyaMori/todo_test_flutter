import 'package:flutter/material.dart';

//**************************
//リスト追加画面
class TodoAddPage extends StatefulWidget{
  @override
  _TodoAddPageState createState()=> new _TodoAddPageState();
}


//リスト追加ステート
class _TodoAddPageState extends State<TodoAddPage>{
  //入力されたテキストをデータとして持つ
  Map _task = {'title': '','details': ''};

  //データを元にしたWidget
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('リスト追加'),
      ),
      body: Container(
        //全体に余白をつける
        padding: EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //入力されたテキストを表示
            // Text(_task['title'], style: TextStyle(color: Colors.blue)),
            //テキストフィールド
            TextField(
              decoration: InputDecoration(
                hintText: 'Task Title'
              ),
              onChanged: (String value){
                //ステートの変更を知らせて、画面を更新する
                setState(() {
                  //データを変更
                  _task['title'] = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Details'
              ),
              onChanged: (String value){
                //ステートの変更を知らせて、画面を更新する
                setState(() {
                  //データを変更
                  _task['details'] = value;
                });
              },
            ),
            //リスト追加ボタン
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.amberAccent,
                ),
                //ボタンに表示するテキスト
                child: Text('リストに追加'),
                //popで前の画面に戻る
                //popの引数にデータを渡す
                onPressed: (){
                  final snackbar = SnackBar(content: Text('入力が正しくありません'), action: SnackBarAction(label: 'agree', onPressed: ()=>SnackBarClosedReason.swipe),);
                  (_task['title'] != '' && _task['details'] != '')? Navigator.of(context).pop(_task):ScaffoldMessenger.of(context).showSnackBar(snackbar);
                },
              ),
            ),
            //キャンセルボタン
            Container(
              //横幅いっぱいに広げる
              width: double.infinity,
              //キャンセルボタン
              child: TextButton(
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