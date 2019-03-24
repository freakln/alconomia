import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alconomia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginHomePage(title: 'AlcoNomia'),
    );
  }
}

class LoginHomePage extends StatefulWidget {
  LoginHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginHomePageState createState() => _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formkey = new GlobalKey<FormState>();

  String email;
  String password;

  void _submit() {
    final form = formkey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("Email : $email, password : $password"),
    );
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: new Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                width: 350,
                child: new TextFormField(
                  style: new TextStyle(
                      fontSize: 24.0, height: 2.0, color: Colors.black),
                  decoration: new InputDecoration(
                      labelText: "E-mail",
                      contentPadding: const EdgeInsets.only(bottom: -5.0)),
                  validator: (val) =>
                  !val.contains('@') ? 'E-mail invalido' : null,
                  onSaved: (val) => email = val,
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                validator: (val) =>
                val.isEmpty ? 'A senha não pode ser vazia' : null,
                onSaved: (val) => password = val,
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 20.0),
              ),
              new RaisedButton(
                child: new Text(
                  "login",
                  style: new TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
