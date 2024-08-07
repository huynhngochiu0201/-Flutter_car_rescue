// import 'package:flutter/material.dart';
// import 'package:flutter_car_rescue/components/button/cr_elevated_button.dart';
// import 'package:flutter_car_rescue/components/text_field/cr_text_field.dart';
// import 'package:flutter_car_rescue/components/text_field/cr_text_field_password.dart';
// import 'package:flutter_car_rescue/gen/assets.gen.dart';

// import 'package:flutter_car_rescue/resources/app_color.dart';
// import 'package:flutter_car_rescue/utils/validator.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   final formKey = GlobalKey<FormState>();
//   bool isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//           body: Form(
//         key: formKey,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
//               top: MediaQuery.of(context).padding.top + 20.0, bottom: 16.0),
//           child: ListView(
//             children: [
//               const Text(
//                 'Log in',
//                 style: TextStyle(color: AppColor.black, fontSize: 26.0),
//                 textAlign: TextAlign.center,
//               ),
//               Center(
//                 child: Image.asset(Assets.images.autocarlogo.path,
//                     width: 250.0, fit: BoxFit.cover),
//               ),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               CrTextField(
//                 controller: emailController,
//                 hintText: 'Email or Phone',
//                 prefixIcon: const Icon(Icons.email, color: Colors.orange),
//                 validator: Validator.email,
//                 textInputAction: TextInputAction
//                     .next, // thuộc tính này để khi nhấn vào nút dấu tích trong bàn phím sẽ chuyển xuống phần dưới
//               ),
//               const SizedBox(height: 25.0),
//               CrTextFieldPassword(
//                 controller: passwordController,
//                 hintText: 'Password',
//                 validator: Validator.password,
//                 textInputAction: TextInputAction
//                     .done, // thuộc tính này khi nhân vào nút dấu tích trong bàn phím sẽ tương đương khi nhấn vào nút Logn in
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               CrElevatedButton(
//                 text: 'Log in',
//                 color: AppColor.bglogin,
//                 borderColor: AppColor.bglogin,
//               ),
//               const SizedBox(height: 25.0),
//               GestureDetector(
//                   onTap: () {},
//                   child: const Text(
//                     style: TextStyle(
//                         color: AppColor.black,
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.w600),
//                     'Forgot your Password?',
//                     textAlign: TextAlign.center,
//                   )),
//               const SizedBox(height: 40.0),
//               const Text(
//                 'or Login With',
//                 style: TextStyle(
//                     color: AppColor.brown1,
//                     fontSize: 14.8,
//                     fontWeight: FontWeight.w500),
//                 textAlign: TextAlign.center,
//               ),
//               CrElevatedButton(
//                 onPressed: () {},
//                 text: 'Login with Facebook',
//                 color: AppColor.bgfb,
//                 borderColor: AppColor.white,
//               ),
//               const SizedBox(
//                 height: 25.0,
//               ),
//               CrElevatedButton(
//                 onPressed: () {},
//                 text: 'Login with Google',
//                 color: AppColor.bggg,
//                 borderColor: AppColor.white,
//               ),
//               const SizedBox(height: 140.0),
//               Center(
//                 child: RichText(
//                   text: const TextSpan(
//                     text: 'Don\'t have an account, ',
//                     style: TextStyle(
//                       fontSize: 16.0, // Set a default text size
//                       color: Colors.black, // Set a default text color
//                     ),
//                     children: <TextSpan>[
//                       TextSpan(
//                           text: 'Register',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_rescue/components/button/cr_elevated_button.dart';
import 'package:flutter_car_rescue/components/text_field/cr_text_field.dart';
import 'package:flutter_car_rescue/components/text_field/cr_text_field_password.dart';
import 'package:flutter_car_rescue/gen/assets.gen.dart';
import 'package:flutter_car_rescue/pages/home/home_page.dart';
import 'package:flutter_car_rescue/resources/app_color.dart';
import 'package:flutter_car_rescue/utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> _submitLogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() => isLoading = true);

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      final uid = userCredential.user?.uid;
      print('User UID: $uid');

      if (!context.mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      print('FirebaseAuthException: $e');
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Error')),
      );
      setState(() => isLoading = false);
    } catch (e) {
      print('Exception: $e');
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Server error')),
      );
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).copyWith(
              top: MediaQuery.of(context).padding.top + 20.0, bottom: 16.0),
          child: ListView(
            children: [
              const Text(
                'Log in',
                style: TextStyle(color: AppColor.black, fontSize: 26.0),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Image.asset(Assets.images.autocarlogo.path,
                    width: 250.0, fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 30.0,
              ),
              CrTextField(
                controller: emailController,
                hintText: 'Email or Phone',
                prefixIcon: const Icon(Icons.email, color: Colors.orange),
                validator: Validator.email,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 25.0),
              CrTextFieldPassword(
                controller: passwordController,
                hintText: 'Password',
                validator: Validator.password,
                textInputAction: TextInputAction.done,
              ),
              const SizedBox(
                height: 25.0,
              ),
              CrElevatedButton(
                text: 'Log in',
                color: AppColor.bglogin,
                borderColor: AppColor.bglogin,
                onPressed: () => _submitLogin(context),
              ),
              const SizedBox(height: 25.0),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600),
                    'Forgot your Password?',
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 40.0),
              const Text(
                'or Login With',
                style: TextStyle(
                    color: AppColor.brown1,
                    fontSize: 14.8,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              CrElevatedButton(
                onPressed: () {},
                text: 'Login with Facebook',
                color: AppColor.bgfb,
                borderColor: AppColor.white,
              ),
              const SizedBox(
                height: 25.0,
              ),
              CrElevatedButton(
                onPressed: () {},
                text: 'Login with Google',
                color: AppColor.bggg,
                borderColor: AppColor.white,
              ),
              const SizedBox(height: 140.0),
              Center(
                child: RichText(
                  text: const TextSpan(
                    text: 'Don\'t have an account, ',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Register',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
