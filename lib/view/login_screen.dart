import 'package:flutter/material.dart';
import 'package:mvvm_provider/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  final ValueNotifier<bool> _obscurePassword = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: _emailNode,
              decoration: InputDecoration(
                  hintText: 'Please Enter Email',
                  filled: true,
                  fillColor: Colors.white,
                  focusColor: Colors.blue,
                  hintStyle: const TextStyle(color: Colors.red),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  )),
              onFieldSubmitted: (value) =>
                  Utils.filedFocusChange(context, _emailNode, _passwordNode),
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: _obscurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _passwordNode,
                    obscureText: value,
                    decoration: InputDecoration(
                        hintText: 'Please Enter Your Password',
                        filled: true,
                        fillColor: Colors.white,
                        focusColor: Colors.blue,
                        hintStyle: const TextStyle(color: Colors.red),
                        suffixIcon: IconButton(
                            onPressed: () {
                              _obscurePassword.value = !_obscurePassword.value;
                            },
                            icon: value
                                ? const Icon(Icons.visibility,
                                    color: Colors.green)
                                : const Icon(Icons.visibility_off,
                                    color: Colors.red)),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        )),
                  );
                }),
                Container(height: height*.2)
          ],
        ),
      ),
    );
  }
}
