import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/screens/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UIHelper.customImage(imageUrl: "instagram-logo-text.png"),
            SizedBox(height: 20),
            UIHelper.customTextField(
              controller: emailController,
              text: "Email",
              toHide: false,
            ),
            SizedBox(height: 20),
            UIHelper.customTextField(
              controller: passwordController,
              text: "Password",
              toHide: true,
            ),
            SizedBox(height: 20),
            UIHelper.customTextField(
              controller: usernameController,
              text: "Username",
              toHide: false,
            ),
            SizedBox(height: 20),
            UIHelper.customButton(text: "Sign Up", callback: () {}),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                UIHelper.customTextButton(
                  text: "Login",
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
