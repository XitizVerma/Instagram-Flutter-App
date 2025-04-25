import 'package:flutter/material.dart';
import 'package:instagram_flutter_app/Widgets/ui_helper.dart';

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
            UIHelper.customImage(imageUrl: "instagram-logo.png"),
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
                    child: UIHelper.customTextButton(text: "Forgot password?", callback: () {})
                  )
              ],
            ),
            SizedBox(height: 10),
            UIHelper.customButton(text: "Login", callback: () {})
          ],
        ),
      ),

      // appBar: AppBar(
      //   title: Text("Login Screen"),
      //   centerTitle: true,
      //   backgroundColor: Colors.red,
      // ),
    );
  }
}
