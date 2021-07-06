import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUpState createState()=> new _SignUpState();
}

class _SignUpState extends State<SignUp>{
  String newUserEmail = '';
  String newPassword = '';
  String newConfPassword = '';
  String infoText = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.mail),
                  labelText: 'Email adress *',
                ),
                onChanged: (String value){
                  setState(() {
                    newUserEmail = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  labelText: 'Password *',
                ),
                obscureText: true,
                onChanged: (String value){
                  setState(() {
                    newPassword = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: ()async{
                  try{
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final result = await auth.createUserWithEmailAndPassword(
                        email: newPassword, password: newPassword);
                    final user = result.user;
                    setState(() {
                      infoText = '登録OK：${user.email}';
                    });
                  }catch(e){
                    setState(() {
                      infoText = "登録NG：${e.message}";
                    });
                  }
                },
                child: Text('登録'),
              ),
              Text(infoText)
            ],
          ),
        ),
      ),
    );
  }
}