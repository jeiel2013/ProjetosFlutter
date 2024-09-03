import 'package:flutter/material.dart';
import 'package:login_page/main.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _twoPasswordController = TextEditingController();
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
          "Register",
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
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter your email",
                        style: TextStyle(
                          fontFamily: "Hamon",
                          fontSize: 17,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _emailController,
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
                          hintText: 'abc123@gmail.com',
                          hintStyle: TextStyle(
                            color: const Color(0xFF696969).withOpacity(0.5),
                            fontFamily: "Hamon",
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Re-Enter your password",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color(0xFF2A2A2A),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _twoPasswordController,
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
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 130.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.6)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Sign Up",
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
                        "Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Hamon",
                          color: Color(0xFF696969),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        },
                        child: const Text(
                          "Sign In",
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
                      const SizedBox(
                        height: 35,
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
