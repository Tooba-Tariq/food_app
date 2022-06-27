import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../tabs/tab_screen.dart';

import '../../../core/util/gredient_circle.dart';
import '../../widget/login/overlay_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return const TabScreen();
              // Navigator.of(context).pushReplacement(
              //   CustomPageRoute(
              //     builder: TabScreen(),
              //   ),
              // );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something Went Wrong"),
              );
            } else {
              return Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  const Positioned(
                    bottom: -500,
                    right: -150,
                    left: -150,
                    child: GradientCircle(
                      radius: 500,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  OverlayLoginScreen(),
                ],
              );
            }
          }),
    );
  }
}
