import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Welcome',
              style: Theme.of(context).textTheme.headline5,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              child: Text('Enter'),
              onPressed: () {
                Navigator.pushNamed(context, '/catalog');
              },
            ),
          ]),
        ),
      ),
    );
  }
}
