import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios), // Use o ícone desejado aqui
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: const Text(
          "Forgot",
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
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  'assets/img/forgot.png',
                  height: 300,
                  width: 400,
                ),
              ),
              const SizedBox(height: 25),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Forgot Password?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Hamon Bold',
                      fontSize: 27,
                      color: Color(0xFF151515)),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 340,
                alignment: Alignment.center,
                child: const Text(
                  "Don’t worry! it happens. Please enter phone number associated with your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Hamon",
                    color: Color(0xFF696969),
                  ),
                ),
              ),
              const SizedBox(height: 50),
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
                        color: Color(0xFF151515),
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
                              items: countryCodes.map<DropdownMenuItem<String>>(
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
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    "Get OTP",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Hamon Bold",
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
