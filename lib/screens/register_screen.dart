import 'package:asu_quickcare/models/student.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

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
      appBar: AppBar(
        leadingWidth: 64,
        toolbarHeight: 64,
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2)),
                ],
              ),
              child: const BackButton(
                color: Color(0xff882020),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Row(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Get Started!",
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xff882020),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Register using your ASU email.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
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
                              controller: emailController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Color(0xff8A8B8B),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8F8FF),
                                hintText: "Email",
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                              obscureText: isObscurePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Required!";
                                }
                                return null;
                              },
                              controller: passwordController,
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
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8F8FF),
                                hintText: "Password",
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
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
                              obscureText: isObscureConfirmPassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Field Required!";
                                }
                                if (value != passwordController.text) {
                                  return 'Password Does Not Match';
                                }
                                return null;
                              },
                              controller: confirmPasswordController,
                              decoration: InputDecoration(
                                labelStyle: const TextStyle(
                                  color: Color(0xff8A8B8B),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    isObscureConfirmPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: const Color.fromRGBO(136, 33, 33, 1),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isObscureConfirmPassword =
                                          !isObscureConfirmPassword;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF8F8FF),
                                hintText: "Confirm Password",
                              )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (isStudentRegistered(emailController.text)) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("User already exists!"),
                                  ),
                                );
                              } else {
                                addStudent(emailController.text,
                                    passwordController.text);
                                currentStudent = students.last;
                                Navigator.pushReplacementNamed(
                                    context, "/homeScreen");
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
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          onPressed: () => _launcherURL(
                              Uri.parse('https://accounts.google.com/signin'),
                              false),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
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
                                "Register with Google",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
