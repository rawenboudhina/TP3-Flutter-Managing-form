import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Controllers for the text fields
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Global keys for the form and scaffold
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Function to validate the form fields
  void _validateFields() {
    final validSnackBar = SnackBar(
      content: Text(
        'Your fields are correct',
        style: TextStyle(fontSize: 16.0),
      ),
      action: SnackBarAction(
        label: "OK",
        onPressed: () {},
      ),
      backgroundColor: Colors.green,
    );

    final invalidSnackBar = SnackBar(
      content: Text(
        'Your fields are not correct',
        style: TextStyle(fontSize: 16.0),
      ),
      action: SnackBarAction(
        label: "Not Valid!",
        textColor: Colors.white,
        onPressed: () {},
      ),
      backgroundColor: Colors.red,
    );

    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(validSnackBar);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(invalidSnackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Forms"),
        ),
        body: Center(
          child: Card(
            elevation: 8.0,
            child: Container(
              height: 350.0,
              width: 300.0,
              padding: EdgeInsets.all(12.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Name field
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: "Your name...",
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your name...";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.0),
                    // Email field
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Your email...",
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty || !value.contains('@')) {
                          return "Please enter a valid email address!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.0),
                    // Password field
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Your password...",
                        border: OutlineInputBorder(),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty || value.length < 6) {
                          return "Please enter a strong password.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12.0),
                    // Validate button
                    InkWell(
                      onTap: _validateFields,
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        ),
                        child: Center(
                          child: Text(
                            "Validate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
