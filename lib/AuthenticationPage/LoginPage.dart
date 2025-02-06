import 'package:flutter/material.dart';
import 'package:meterciu/SharedFiles/Logo.dart';
import 'package:meterciu/screens/homePage/HomePage.dart';
import 'RegisterPage.dart'; // Import RegisterPage for navigation

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controllers to handle text input
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Simple form validation
  final _formKey = GlobalKey<FormState>();

  // Function to validate phone number format
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid 10-digit phone number';
    }
    return null;
  }

  // Simple login function
  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      // Implement login logic (e.g., API call, Firebase authentication, etc.)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logging in...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 146, 154),
        foregroundColor: Colors.white,

      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Logo(),
          SizedBox(height: 160,),
          Center( // Center the content vertically and horizontally
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Allow content to take minimum space
                  children: [

                    // Login Form
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Phone Number Input
                          TextFormField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                            ),
                            validator: _validatePhone,
                          ),
                          SizedBox(height: 16.0),

                          // Password Input
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 24.0),

                          // Login Button
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const Homepage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 24, 146, 154),
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 18,color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),

                    // Register Option
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? ', style: TextStyle(
                          fontSize: 18
                        ),),
                        TextButton(
                          onPressed: () {
                            // Navigate to the registration page
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterPage()),
                            );
                          },
                          child: const Text('Register here', style: TextStyle(
                            color: Colors.red, fontSize: 18,
                          ),),
                        ),
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
