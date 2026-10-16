import 'package:asu_quickcare/models/student.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool isObscurePassword = true;
bool isObscureConfirmPassword = true;

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isObscurePassword = true;

  void _launcherURL(Uri uri, bool inApp) async {
    try {
      if (await canLaunchUrl(uri)) {
        if (inApp) {
          await launchUrl(
            uri,
            mode: LaunchMode.inAppWebView,
          );
        } else {
          await launchUrl(
            uri,
            mode: LaunchMode.externalApplication,
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, right: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('assets/QuickCare-Logo.png'),
                    width: 300,
                    opacity: AlwaysStoppedAnimation(0.35),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome Back!",
                            style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff882020),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Login using your email and password.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25,
                              spreadRadius: 5,
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Required!';
                            }
                            if (!(value.contains('@'))) {
                              return 'Please Enter Correct Email';
                            }
                            if (!(value.contains('asu.edu.jo'))) {
                              return 'Please Enter Your University Email';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Color(0xff8A8B8B),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8F8FF),
                            hintText: "Email",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 25,
                              spreadRadius: 5,
                              color: Color.fromRGBO(0, 0, 0, 0.1),
                            ),
                          ],
                        ),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Required!';
                            }
                            return null;
                          },
                          obscureText: isObscurePassword,
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Color(0xff8A8B8B),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                isObscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color.fromRGBO(136, 33, 33, 1),
                              ),
                              onPressed: () {
                                setState(() {
                                  isObscurePassword = !isObscurePassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF8F8FF),
                            hintText: "Password",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              currentStudent = authenticateStudent(
                                  emailController.text,
                                  passwordController.text);
                              if (currentStudent != null) {
                                Navigator.pushReplacementNamed(
                                    context, "/homeScreen");
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Wrong Email or Password"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff882020),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            width: double.infinity,
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/registerScreen");
                      },
                      child: const Text(
                        "Register Now!",
                        style: TextStyle(
                          color: Color(0xff882020),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  onPressed: () => _launcherURL(
                      Uri.parse('https://accounts.google.com/signin'), false),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/google_icon.png', //مكان اضافة الصورة
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Login with Google",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
