import 'package:flutter/material.dart';

class TaskEdit extends StatefulWidget{
  String title;
  String details;
  TaskEdit(this.title, this.details): super();

  @override
  _TaskEditState createState()=> new _TaskEditState();
}

class _TaskEditState extends State<TaskEdit>{

  Map _task = {'title': '','details': ''};
  TextEditingController _defaultTitle;
  TextEditingController _defaultDetails;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _defaultTitle = new TextEditingController(text: widget.title);
    _defaultDetails = new TextEditingController(text: widget.details);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('タスク編集'),
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
              controller: _defaultTitle,
              onChanged: (String value){
                //ステートの変更を知らせて、画面を更新する
                setState(() {
                    //データを変更
                    _task['title'] = value;
                });
              },
            ),
            TextField(
              controller: _defaultDetails,
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
                child: Text('変更'),
                //popで前の画面に戻る
                //popの引数にデータを渡す
                onPressed: (){
                  Navigator.of(context).pop(_task);
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