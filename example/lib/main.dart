import 'package:custom_form_validation/validation.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Enter Mobile Number"
                ),
                validator: (value) => Validator.validateMobile(value),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Enter Address"
                ),
                validator: (value) => Validator.validateAddress(value),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Enter Pan Number"
                ),
                validator: (value) => Validator.validatePan(value),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Enter Adhar Number"
                ),
                validator: (value) => Validator.validateAadhar(value),
              ),
              SizedBox(
                height: 40,
              ),
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
    );
  }
}
