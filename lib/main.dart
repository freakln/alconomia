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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(labelText: "E-mail"),
              validator: (val) => !val.contains('@') ? 'E-mail invalido' : null,
              onSaved: (val) => email = val,
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
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
