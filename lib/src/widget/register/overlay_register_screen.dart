// ignore_for_file: avoid_print, unused_element, prefer_is_empty, prefer_final_fields, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:food_app/src/screens/restaurant_search/restaurant_search_screen.dart';
import 'package:food_app/src/screens/welcome/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:validate/validate.dart';  //for validation

class MyData {
  String name = '';
  String phone = '';
  String email = '';
  String age = '';
}

class OverlayRegisterScreen extends StatefulWidget {
  @override
  _OverlayRegisterScreenState createState() => _OverlayRegisterScreenState();
}

class _OverlayRegisterScreenState extends State<OverlayRegisterScreen> {
  int currStep = 0;
  static var _focusNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static MyData data = MyData();

  static var dropdownValue = '1';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(
      () {
        setState(() {});
        print('Has focus: $_focusNode.hasFocus');
      },
    );
  }

  @override
  void dispose() {
    // _focusNode.dispose();
    super.dispose();
  }

  List<Step> steps() => [
        Step(
          title: const Text('Account'),
          //subtitle: const Text('Enter your name'),
          isActive: true,
          //state: StepState.error,
          state: StepState.indexed,
          content: Column(
            children: [
              TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String? value) {
                  data.name = value!;
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value!.isEmpty || value.length < 4) {
                    return 'Please Enter Username';
                  }
                  ;
                },
                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  //filled: true,

                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
              TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String? value) {
                  data.name = value!;
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value!.isEmpty || value.length < 1) {
                    return 'Please Enter First Name';
                  }
                  ;
                },
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  hintText: 'First Name',
                  //filled: true,

                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
              TextFormField(
                focusNode: _focusNode,
                keyboardType: TextInputType.text,
                autocorrect: false,
                onSaved: (String? value) {
                  data.name = value!;
                },
                maxLines: 1,
                //initialValue: 'Aseem Wangoo',
                validator: (value) {
                  if (value!.isEmpty || value.length < 1) {
                    return 'Please Enter Last Name';
                  }
                  ;
                },
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  hintText: 'Last Name',
                  //filled: true,
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Email'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          // state: StepState.disabled,
          content: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Please Enter Valid Email';
                  }
                  ;
                },
                onSaved: (String? value) {
                  data.email = value!;
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter a Email Address',
                  icon: Icon(Icons.email),
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (value) {
                  if (value!.isEmpty ||
                      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                          .hasMatch(value)) {
                    return 'Please Enter Valid email';
                  }
                },
                onSaved: (String? value) {
                  data.email = value!;
                },
                maxLines: 1,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  icon: Icon(Icons.key),
                  labelStyle:
                      TextStyle(decorationStyle: TextDecorationStyle.solid),
                ),
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Phone Number'),
          //subtitle: const Text('Subtitle'),
          isActive: true,
          //state: StepState.editing,
          state: StepState.indexed,
          content: TextFormField(
            keyboardType: TextInputType.phone,
            autocorrect: false,
            validator: (value) {
              if (value!.isEmpty || value.length < 10) {
                return 'Please Enter Valid Number';
              }
              ;
            },
            onSaved: (String? value) {
              data.phone = value!;
            },
            maxLines: 1,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              hintText: 'Enter a Number',
              icon: Icon(Icons.phone),
              labelStyle: TextStyle(decorationStyle: TextDecorationStyle.solid),
            ),
          ),
        ),
        Step(
          title: const Text('Age'),
          // subtitle: const Text('Subtitle'),
          isActive: true,
          state: StepState.indexed,
          content: DropdownButton<String>(
            value: dropdownValue.toString(),
            icon: const Icon(Icons.keyboard_arrow_down_rounded),
            elevation: 16,
            style: const TextStyle(color: Color(0XFFF2A902)),
            underline: Container(
              height: 2,
            ),menuMaxHeight: 200.0,
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            },
            items: List.generate(100, (index) => index.toString())
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    void showSnackBarMessage(String message,
        [MaterialColor color = Colors.red]) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
    }

    void _submitDetails() {
      final FormState? formState = _formKey.currentState;

      if (!formState!.validate()) {
        showSnackBarMessage('Please enter correct data');
      } else {
        formState.save();
        print("Name: ${data.name}");
        print("Phone: ${data.phone}");
        print("Email: ${data.email}");
        print("Age: ${data.age}");

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Details"),
            //content: new Text("Hello World"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("Name : " + data.name),
                  Text("Phone : " + data.phone),
                  Text("Email : " + data.email),
                  Text("Age : " + data.age),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    }

    return SizedBox(
      height: 550,
      child: Form(
        key: _formKey,
        child: SizedBox(
          child: ListView(
            children: <Widget>[
              Stepper(
                steps: steps(),
                type: StepperType.vertical,
                currentStep: currStep,
                onStepContinue: () {
                  setState(
                    () {
                      if (currStep < steps().length - 1) {
                        currStep = currStep + 1;
                      } else {
                        currStep = 0;
                      }
                      // else {
                      // Scaffold
                      //     .of(context)
                      //     .showSnackBar(new SnackBar(content: new Text('$currStep')));

                      // if (currStep == 1) {
                      //   print('First Step');
                      //   print('object' + FocusScope.of(context).toStringDeep());
                      // }

                      // }
                    },
                  );
                },
                onStepCancel: () {
                  setState(
                    () {
                      if (currStep > 0) {
                        currStep = currStep - 1;
                      } else {
                        currStep = 0;
                      }
                    },
                  );
                },
                onStepTapped: (step) {
                  setState(
                    () {
                      currStep = step;
                    },
                  );
                },
              ),
              SizedBox(
                height: 40,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0XFFF2A902),
                  ),
                  onPressed: () {
                    _submitDetails();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const WelcomeScreen()),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              fontSize: 17.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
