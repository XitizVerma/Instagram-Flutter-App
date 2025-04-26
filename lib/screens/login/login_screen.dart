import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';
import 'package:instagram_flutter_app/screens/navbar/bottom_navigation_bar.dart';
import 'package:instagram_flutter_app/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: UIHelper.customTextButton(
                    text: "Forgot password?",
                    callback: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            UIHelper.customButton(
              text: "Login",
              callback: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIHelper.customImage(imageUrl: "facebook-icon.png"),
                UIHelper.customTextButton(
                  text: "Login with Facebook",
                  callback: () {},
                ),
              ],
            ),
            SizedBox(height: 20),
            Text("OR"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                UIHelper.customTextButton(
                  text: "Sign Up",
                  callback: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
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
