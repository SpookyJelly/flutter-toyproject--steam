import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spooky Steam Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Get your Steam milestones'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _userProfileId;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
          padding: EdgeInsets.all(20.5),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Form(
                    key: _formKey,
                    child: Column(children: [
                      TextFormField(
                        onSaved:(val){_userProfileId=val!;},
                        autofocus: true,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return '프로필 아이디를 입력해주세요';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: '스팀 프로필 아이디 입력',
                            helperText: '프로필 아이디는 6자리 숫자입니다'),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[ElevatedButton(
                          child: Text('Find it'),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              ScaffoldMessenger.of(context).showSnackBar(
                                 SnackBar(
                                    content: Text('$_userProfileId')),
                              );
                            }
                          })])
                    ]))
              ],
            ),
          )),
    );
  }
}
