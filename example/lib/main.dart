import 'package:custom_form_validation/custom_form_validation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.70,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Mobile Number"
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) => Validator.validateMobile(value),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter Address"
                  ),
                  validator: (value) => Validator.validateAddress(value),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter Pan Number"
                  ),
                  validator: (value) => Validator.validatePan(value),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter Adhar Number"
                  ),
                  validator: (value) => Validator.validateAadhar(value),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Email"
                  ),
                  validator: (value) => Validator.validateEmail(value),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Enter Credit Card"
                  ),
                  validator: (value) => Validator.validateCreditCard(value),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter Url"
                  ),
                  validator: (value) => Validator.validateURL(value),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter Password"
                  ),
                  validator: (value) => Validator.validatePassword(value),
                ),
                const SizedBox(
                  height: 40,
                ),

                TextFormField(
                  decoration: const InputDecoration(labelText: 'Whats app Mobile Number'),
                  validator:
                      (value) {
                    return Validator.validateMultiple(value, [
                      Validator.validateMobile, // Checks 10-digit number starting with 6, 7, 8, or 9
                          (val) => val != null && (val.startsWith('6') || val.startsWith('7') || val.startsWith('8') || val.startsWith('9'))
                          ? null
                          : 'Mobile number must start with 6, 7, 8, or 9',

                      // Explicit length check
                          (val) => val?.length == 10 ? null : 'Mobile number must be exactly 10 digits',

                      // Only digits allowed
                          (val) => val != null && RegExp(r'^[0-9]+$').hasMatch(val)
                          ? null
                          : 'Mobile number must contain only digits',

                      // Not all same digits
                          (val) => val != null && val.split('').toSet().length > 1
                          ? null
                          : 'Mobile number cannot have all same digits',

                      // No excessive repetition
                          (val) => val != null && !RegExp(r'(\d)\1{4,}').hasMatch(val)
                          ? null
                          : 'Mobile number cannot have 5 or more repeating digits',
                         (val) => val?.length == 10 ? null : 'Mobile number must be exactly 10 digits', // Explicit 10-digit check
                    ]);
                  },
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                ),
                const SizedBox(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Validate")));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Error")));
                    }
                  },
                  child: const Text("Validation"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
