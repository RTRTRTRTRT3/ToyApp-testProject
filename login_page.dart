import 'package:flutter/material.dart';
import 'code_page.dart'; // Импортируем экран CodePage

//completed
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png', // Путь к изображению логотипа
                  height: 150,
                ),
                SizedBox(height: 20),
                _buildTextField(
                  controller: firstNameController,
                  label: 'Имя',
                  hintText: 'Введите ваше имя',
                ),
                _buildTextField(
                  controller: lastNameController,
                  label: 'Фамилия',
                  hintText: 'Введите вашу фамилию',
                ),
                _buildTextField(
                  controller: emailController,
                  label: 'Email',
                  hintText: 'Введите ваш email',
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller: passwordController,
                  label: 'Пароль',
                  hintText: 'Введите ваш пароль',
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CodePage()),
                    );
                  },
                  child: Text('Регистрация'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
