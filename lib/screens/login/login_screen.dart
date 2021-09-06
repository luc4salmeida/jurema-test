import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jurema/screens/login/controller/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTop(context),
          _buildLoginInformation(context),
          _buildLoginForm(context),
          _buildButtons(context),
          _buildBottom(context),
        ],
      ),
    );
  }

  Widget _buildTop(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.centerLeft,
      height: screenSize.height * 0.35,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(110.0),
        ),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/login-bg.jpeg'),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(
          left: 21.0,
          bottom: 30.0,
        ),
        child: const Text(
          'Welcome Back!',
          style: TextStyle(
            fontSize: 21.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginInformation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 21.0,
        top: 20.0,
        bottom: 40.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Please login to continue.',
            style: TextStyle(
              color: Colors.grey.shade600,
            )),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email address',
            style: TextStyle(color: Colors.grey),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: 'user@email.com',
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Password',
                style: TextStyle(color: Colors.grey),
              ),
              Text('Forgot password?'),
            ],
          ),
          TextField(
            decoration: InputDecoration(
              hintText: '**********',
            ),
            obscureText: true,
          )
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 50.0,
            child: Obx(() => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0.5,
                      primary: Color(0xFFFF31BF74),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: controller.loading.isFalse
                      ? controller.onLoginPressed
                      : null,
                  child: controller.loading.isTrue
                      ? Center(
                          child: Container(
                          width: 25.0,
                          height: 25.0,
                          child: CircularProgressIndicator(
                            color: Colors.grey,
                          ),
                        ))
                      : Text('Login'),
                )),
          ),
          const SizedBox(
            height: 13.0,
          ),
          Container(
            height: 50.0,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0.5,
                primary: Color(0xFFFF2B66B5),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Image.asset(
                    'assets/fb-logo.png',
                    height: 35.0,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      'Continue with Facebook',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottom(BuildContext context) {
    return Column(children: [
      Text('New to Scratch?',
          style: TextStyle(
            color: Colors.grey,
          )),
      Text('Create Account Here',
          style: TextStyle(
            color: Color(0xFFFF31BF74),
          )),
    ]);
  }
}
