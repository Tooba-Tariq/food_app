// ignore_for_file: deprecated_member_use


import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/core/util/custom_page_route.dart';
import '/src/screens/login/login_screen.dart';
import '/src/screens/welcome/welcome_screen.dart';
import '../../../core/constants/app_colors.dart';
import 'form_drop_down_button.dart';
import 'form_text_field.dart';

class OverlayRegisterScreen extends StatefulWidget {
  const OverlayRegisterScreen({Key? key}) : super(key: key);

  @override
  _OverlayRegisterScreenState createState() => _OverlayRegisterScreenState();
}

class _OverlayRegisterScreenState extends State<OverlayRegisterScreen> {
  int currStep = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String ageValue = 'Age';
  String statusValue = 'Status';

  int formController = 0;

  List<DropdownMenuItem> ageItems = [
    const DropdownMenuItem(
      value: 'Age',
      child: Text(
        'Age',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    )
  ];
  List<DropdownMenuItem> statusItems = [
    const DropdownMenuItem(
      value: 'Status',
      child: Text(
        'Status',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    const DropdownMenuItem(
      value: 'Single',
      child: Text(
        'Single',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    const DropdownMenuItem(
      value: 'Married',
      child: Text(
        'Married',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  ];

  List<List<Widget>> steps(BuildContext context) => [
        [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormTextField(label: 'User Name', controller: userNameController),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
          buildIndicator(),
          formControlButton(
              title: 'Next',
              onPressed: () {
                setState(() {
                  formController = (formController + 1) % 3;
                });
              }),
        ],
        [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormTextField(
                  label: 'First Name', controller: firstNameController),
              const SizedBox(
                height: 20,
              ),
              FormTextField(label: 'Last Name', controller: lastNameController),
              const SizedBox(
                height: 20,
              ),
              FormTextField(
                  label: 'Password',
                  obscureText: true,
                  controller: passwordController),
            ],
          ),
          buildIndicator(),
          formControlButton(
              title: 'Next',
              onPressed: () {
                setState(() {
                  formController = (formController + 1) % 3;
                });
              }),
        ],
        [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormTextField(label: 'Phone', controller: phoneController),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormDropDownButton(
                    label: 'Status',
                    valueController: statusValue,
                    items: statusItems,
                    width: 150,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FormDropDownButton(
                    label: 'Age',
                    valueController: ageValue,
                    items: ageItems,
                    width: 100,
                  ),
                ],
              ),
            ],
          ),
          buildIndicator(),
          formControlButton(
              title: 'Sign Up',
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CustomPageRoute(builder: const WelcomeScreen()),
                    (route) => false);
              }),
        ],
      ];

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: formController,
        effect: const WormEffect(
          dotHeight: 12,
          dotWidth: 12,
          dotColor: Colors.orange,
          paintStyle: PaintingStyle.stroke,
          activeDotColor: Colors.orange,
        ),
        count: 3,
      );
  @override
  void initState() {
    super.initState();
    ageItems.addAll(
      List.generate(100, (index) => index.toString())
          .map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(color: Colors.white),
          height: 320,
          width: 320,
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 20.0, right: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: steps(context)[formController],
              ),
            ),
          ),
        ),
        Text(
          'Terms & Conditions',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: AppColor.themePrimary,
            fontSize: 14,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CustomPageRoute(
                    builder: const LoginScreen(),
                  ),
                );
              },
              child: const Text(
                "Already Have An Account? Login",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Container formControlButton({
    required String title,
    required Function onPressed,
  }) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.themePrimary,
            AppColor.themeSecondary,
          ],
          stops: const [0.6, 2],
        ),
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
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
    );
  }
}
