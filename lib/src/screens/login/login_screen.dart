import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/src/blocs/user_bloc.dart';
import 'package:food_app/src/services/user/user_crud.dart';
import 'package:provider/provider.dart';
import '../../model/user.dart';
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
            var data = FirebaseAuth.instance.currentUser;

            context.read<UserBloc>().isUserExist(data!.email.toString());

            print(FirebaseAuth.instance.currentUser);
            int exist = 0;
            Future.delayed(Duration(seconds: 2)).then((value) async {
              exist = await context
                  .read<UserBloc>()
                  .isUserExist(data.email.toString());
            });
            if (exist == 0) {
              Person user = Person(
                age: '',
                bio: 'Student',
                firstName: data.displayName == null
                    ? ''
                    : data.displayName!.split(' ')[0],
                id: data.email == null ? '' : data.email!,
                image: data.photoURL == null
                    ? 'https://www.kindpng.com/picc/m/105-1055656_account-user-profile-avatar-avatar-user-profile-icon.png'
                    : data.photoURL!,
                lastName: data.displayName == null
                    ? ''
                    : data.displayName!.split(' ')[1],
                phoneNo: data.phoneNumber == null ? '' : data.phoneNumber!,
                username: data.email == null ? '' : data.email!.split('@')[0],
                status: 'Single',
              );

              print(user);
              context.read<UserBloc>().adduser(user);
            }
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
        },
      ),
    );
  }
}
