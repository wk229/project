import 'package:finalproject/services/response_body.dart';
import 'package:flutter/material.dart';
import '../pages/exchange_rate_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final Map<String, String> mockUserData = {
    '111': '111',
  };
  void _pressLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if (mockUserData.containsKey(username) &&
        mockUserData[username] == password) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExchangeRatePage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Invalid username or password")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your Password',
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: _pressLogin,
            child: Text('login'),
          )
        ]),
      ),
    );
  }
}
