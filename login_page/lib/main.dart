import 'package:flutter/material.dart';

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
  String selectedCountryCode =
      '+1'; // Inicializa com o código dos EUA como padrão
  final List<String> countryCodes = [
    '+1', // USA/Canada
    '+44', // UK
    '+55', // Brazil
    '+91', // India
    '+61', // Australia
    '+81', // Japan
    '+49', // Germany
    '+33', // France
    '+86', // China
    '+39', // Italy
    // Adicione mais códigos de DDD conforme necessário
  ];

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {}); // Atualiza o estado para refletir as mudanças no ícone
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontFamily: "Hamon Bold",
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove a sombra do AppBar
        centerTitle: true, // Centraliza o título
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                  const SizedBox(
                    height: 10,
                  ), // Espaço entre o texto e o campo de entrada
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
                          fontFamily: "Hamon"),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0), // Adiciona espaçamento à esquerda
                        child: DropdownButtonHideUnderline(
                          // Remove a linha de sublinhado padrão do DropdownButton
                          child: DropdownButton<String>(
                            value: selectedCountryCode,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCountryCode = newValue!;
                              });
                            },
                            items: countryCodes
                                .map<DropdownMenuItem<String>>((String value) {
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
                            : Colors.grey, // Define a cor corretamente
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            // Password ----------------------------------------------------------------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                  const SizedBox(
                    height: 10,
                  ), // Espaço entre o texto e o campo de entrada
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
                            _obscureText =
                                !_obscureText; // Alterna o estado de visibilidade
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
              padding: const EdgeInsets.only(left: 200),
              child: TextButton(
                onPressed: () {},
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
                        vertical: 18, horizontal: 150.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.6)) // Padding
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
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontFamily: "Hamon Bold",
                          fontSize: 16,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
