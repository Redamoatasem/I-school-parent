import 'package:flutter/material.dart';
import 'package:mobile_tracker_two/screens/register.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../shared/app_provider.dart';
import '../shared/components.dart';
import '../shared/constant.dart';
import '../shared/utils.dart';
import 'forgot_password.dart';
import 'home.dart';

class Login extends StatefulWidget {
  static const String routeName = 'login';

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      // final name = user.displayName;
      // final email = user.email;
      // final photoUrl = user.photoURL;

      // Check if user's email is verified
      // final emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;
    }
// Check if the user is signed in
    //String uid = user.uid; // <-- User ID
    //String? email = user.email; // <-- Their email
    var provider = Provider.of<AppProvider>(context);
    var passwordController = TextEditingController();
    var emailController = TextEditingController();
    var formValidate = GlobalKey<FormState>();
    return Container(
      color: thirdColor,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Form(
                key: formValidate,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/logo.png'),
                      //SizedBox(height: 3,),
                      //Text('i School Bus',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(padding: EdgeInsets.only(right: 140,),child: Text('Welcome To iSchool Bus',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20.0),),),
                      // SizedBox(height: 1.0,),
                      // Padding(padding: EdgeInsets.only(right: 285,),child: Text('ISB',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20.0),),),
                      // SizedBox(height: 1.0,),
                      // Padding(padding: EdgeInsets.only(right: 285,),child: Text('ISB',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 20.0),),),
                      SizedBox(height: 15.0,),

                      // Padding(
                      //   padding: EdgeInsets.only(right: 300),
                      //   child: Text(
                      //     'ID',
                      //     style: TextStyle(fontSize: 15,color: Colors.white),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:
                        // TextFormField(
                        //   initialValue: user!.uid,
                        //   controller: idController,
                        //   keyboardType: TextInputType.text,
                        //   onChanged: (value) {
                        //     print(value);
                        //   },
                        //   obscureText: isPassword,
                        //   onFieldSubmitted: (value) {
                        //     print(value);
                        //   },
                        //   decoration: InputDecoration(
                        //     labelText: 'enter your id',
                        //     labelStyle: TextStyle(color: Colors.white),
                        //     // suffixIcon: IconButton(
                        //     //   color: Colors.white,
                        //     //   onPressed:suffixPressed,
                        //     //   icon: suffix != null ? Icon(suffix,) : Icon(suffix = null),
                        //     // ),
                        //     border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25,),),),
                        //   ),
                        //   validator: (value) {
                        //     return value;
                        //   },
                        // ),
                         defaultFormField(
                             onChange: (value) => print(value),
                             onSubmit: (value) => print(value),
                             validate: (String? value) {
                               if (value!.isEmpty) {
                                 return 'Email must not be empty';
                               }
                               return null;
                             },
                             controller: emailController,
                             type: TextInputType.emailAddress,
                             label: 'Enter Your Email'
                         ),
                      ),
                      // SizedBox(
                      //   height: 10.0,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(right: 300),
                      //   child: Text(
                      //     'Password',
                      //     style: TextStyle(fontSize: 15,color: Colors.white),
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 8.0,
                      // ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: isPassword,
                          suffix: isPassword == true
                              ? Icons.visibility_off
                              : Icons.visibility,
                          onChange: (String value) => print(value),
                          onSubmit: (String value) => print(value),
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'password must not be empty';
                            }
                            return null;
                          },
                          label: 'Enter your password',
                          suffixPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 276.0),
                          child: Text(
                            'Forget Password',
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, ForgotPassword.routeName),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      defaultButton(
                          textStyle: Colors.black,
                          background: primaryColor,
                          function: () async {
                            if (formValidate.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              var message = await provider.signIn(
                                  emailController.text,
                                  passwordController.text);
                              if (message == 'Done') {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Home.routeName, (route) => false);
                              } else {
                                DialogUtils.showDialogMessage(context, message);
                              }
                            }
                          },
                          text: 'Continue'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Create Account?',style: TextStyle(color: Colors.grey,),),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Register.routeName);
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xfff2ba52),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
