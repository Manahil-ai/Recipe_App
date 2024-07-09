import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:status_alert/status_alert.dart';
import '../services/auth_service.dart';


class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
   GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? username, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
        ),
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text(
      "Recipe Book",
      style: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.90,
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: "emilys",
              onSaved: (value){
              setState(() {
                username = value;
              });
              },
              validator: (value){
                if(value==null || value.isEmpty){
                return "Enter a username";
                }
              },
              decoration: const InputDecoration(
                hintText: "Username",
              ),
            ),
            TextFormField(
              initialValue: "emilyspass",
                onSaved: (value){
              setState(() {
                password = value;
              });
              },
              obscureText: true,
               validator: (value){
                if(value==null || value.length < 5){
                return "Enter a valid password";
                }
              },
              decoration: const InputDecoration(
                hintText: "Password",
              ),
            ),
            const SizedBox(height: 20),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    // mainAxisAlignment: MainAxisAlignment.spaceEvenly;
    // crossAxisAlignment: CrossAxisAlignment.center;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      // height: MediaQuery.sizeOf(context).height*0.20,
      child: ElevatedButton(
        onPressed: () async {
          if(_loginFormKey.currentState?.validate()?? false) {
            _loginFormKey.currentState?.save();
            bool result = await AuthService().login(
              username!,
              password!,
              );
              if (result){
                Navigator.pushReplacementNamed(context, "/home");
              }else{
                StatusAlert.show(context,
                duration: const Duration(seconds: 2),
                title: "Login failed!",
                subtitle: "Please try Again",
                configuration: const IconConfiguration(
                 icon: Icons.error,
                ),
                maxWidth: 260,
                );
              }
           }
        },
        child: const Text("Login"),
      ),
    );
  }
}
