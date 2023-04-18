import 'package:flutter/material.dart';
import 'package:medicalappsproject/modules/Third_Page.dart';
import 'package:medicalappsproject/home/home_screen.dart';
import 'package:medicalappsproject/shared/components/components.dart';

import '../home/home.dart';

class LoginPage extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ThirdPage()));
          },
        ),
        title: const Text(
          "Login",
          style: TextStyle(fontSize: 29, letterSpacing: 3),
        ),
      ),
      body: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 2, 44, 78),
                      ),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Your Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Enter Your Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.blue,
                        ),
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // defaultElvaButyon(
                    //     radius: 30,
                    //     text: 'SingUp',
                    //     function: () {
                    //       print(emailController.text);
                    //       print(passwordController.text);
                    //       // Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //         builder: (context) => HomeScreen()));
                    //     }),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(
                            fontSize: 8,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () {
                          print(emailController.text);
                          print(passwordController.text);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 28, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text('Don\'t have an account?'),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Register Now"))
                        ],
                      ),
                    )
                  ]),
            ),
          )),
    );
  }
}
