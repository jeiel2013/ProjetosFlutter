import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/forgot.dart';
import 'package:login_page/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isChecked = false;
  String selectedCountryCode = '+1';
  final List<String> countryCodes = [
    '+1',
    '+44',
    '+55',
    '+91',
    '+61',
    '+81',
    '+49',
    '+33',
    '+86',
    '+39',
  ];

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Login",
          style: TextStyle(
            fontFamily: "Hamon Bold",
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // Envolva o Column com SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.only(top: 110),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter your mobile number",
                        style: TextStyle(
                          fontFamily: "Hamon",
                          fontSize: 17,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        inputFormatters: [LengthLimitingTextInputFormatter(11)],
                        controller: _controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                          ),
                          hintText: '1712345678',
                          hintStyle: TextStyle(
                            color: const Color(0xFF696969).withOpacity(0.5),
                            fontFamily: "Hamon",
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCountryCode,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCountryCode = newValue!;
                                  });
                                },
                                items: countryCodes
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          suffixIcon: Icon(
                            _controller.text.length == 11
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: _controller.text.length == 11
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter your password",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: Color(0xFFD1D1D1),
                            ),
                          ),
                          hintText: '*********',
                          hintStyle: TextStyle(
                            color: const Color(0xFF696969).withOpacity(0.5),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 190),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                          fontSize: 16.43,
                          fontFamily: "Hamon",
                          color: Color(0xFF2A2A2A)),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 140.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.6)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Hamon Bold",
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Hamon",
                          color: Color(0xFF696969),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                              fontFamily: "Hamon Bold",
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      const Text(
                        "or",
                        style: TextStyle(
                            fontFamily: "Hamon Bold",
                            fontSize: 16,
                            color: Color(0xFF696969)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 24.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: const BorderSide(color: Color(0xFFD1D1D1)),
                          ),
                        ),
                        onPressed: () {
                          // Ação do botão Google
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/img/google_logo.png',
                                height: 26.0),
                            const SizedBox(width: 12.0),
                            const Text(
                              'Continue with Google',
                              style: TextStyle(
                                  color: Color(0xFF2A2A2A),
                                  fontSize: 17,
                                  fontFamily: "Hamon"),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 24.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: const BorderSide(color: Color(0xFFD1D1D1)),
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/img/apple_logo.png',
                                height: 26.0),
                            const SizedBox(width: 12.0),
                            const Text(
                              'Continue with Apple',
                              style: TextStyle(
                                  color: Color(0xFF2A2A2A),
                                  fontSize: 17,
                                  fontFamily: "Hamon"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
