import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});

  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String mobileNumber = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String address = '';

// Validator

  String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'First Name is required';
    }
    if (value.length < 3) {
      return 'First Name must be at least 3 characters';
    }
    return null; // Return null if validation succeeds
  }

  String? mobileNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Mobile Number is required';
    }
    if (value.length < 10) {
      return 'Mobile Number must be at least 10 characters';
    }
    return null; // Return null if validation succeeds
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null; // Return null if validation succeeds
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null; // Return null if validation succeeds
  }

  // String? confirmPasswordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Confirm Password is required';
  //   }
  //   if (value != this.password) {
  //     return 'Confirmation Password does not match $value $password';
  //   }
  //   return null; // Return null if validation succeeds
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset('../Assets/logo.png',
                      width: 300, height: 300, fit: BoxFit.cover),
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "First Name",
                          hintText: "Enter your first name",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: firstNameValidator,
                        onSaved: (value) {
                          firstName = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Last Name",
                          hintText: "Enter your last name",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.person),
                        ),
                        onSaved: (value) {
                          lastName = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Mobile Number",
                          hintText: "Enter your mobile number",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.phone),
                        ),
                        validator: mobileNumberValidator,
                        onSaved: (value) {
                          mobileNumber = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: emailValidator,
                        onSaved: (value) {
                          email = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.password),
                        ),
                        validator: passwordValidator,
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Confirm Password",
                          hintText: "Enter your password again",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.password),
                        ),
                        // validator: confirmPasswordValidator,
                        onSaved: (value) {
                          confirmPassword = value!;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Address",
                          hintText: "Enter your address",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          prefixIcon: Icon(Icons.house),
                        ),
                        onSaved: (value) {
                          address = value!;
                        },
                      ),
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomPopup(
                                  firstName: firstName,
                                  lastName: lastName,
                                  mobileNumber: mobileNumber,
                                  email: email,
                                  password: password,
                                  confirmPassword: confirmPassword,
                                  address: address,
                                );
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(350, 50)),
                        ),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
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
    );
  }
}

class CustomPopup extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String mobileNumber;
  final String email;
  final String password;
  final String confirmPassword;
  final String address;

  const CustomPopup(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.address});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Popup Title'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('First Name: $firstName'),
            Text('Last Name: $lastName'),
            Text('Mobile Number: $mobileNumber'),
            Text('Email: $email'),
            Text('Password: $password'),
            Text('Confirm Password: $confirmPassword'),
            Text('Address: $address'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the popup
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
