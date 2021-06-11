

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('登录'),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 10, 40, 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('images/logo.png', width: 100)),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    // labelText: '用户名',
                    hintText: '请输入用户名或邮箱',
                  ),
                  validator: (v) {
                    // return v?.trim().length > 0 ? null : "用户名不能为空";
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: TextFormField(
                  decoration: InputDecoration(
                    // labelText: '密码',
                    hintText: '请输入密码',
                  ),
                  //校验密码
                  validator: (v) {
                    // return v?.trim().length > 5 ? null : "密码不能少于6位";
                  }
                ), 
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 38.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    child: Text('登录', textScaleFactor: 1.2),
                    // style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 20)),
                    onPressed: () {

                    },
                  ),
                )
              )
              
            ],
          ),
        ),
      ),
    );
  }
}