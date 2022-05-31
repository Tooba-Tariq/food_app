// // import 'package:flutter/material.dart';
// // import 'package:food_app/src/screens/register/register_screen_2.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import '../../../core/constants/app_colors.dart';

// // class OverLayWidget extends StatefulWidget {
// //   const OverLayWidget({Key? key}) : super(key: key);

// //   @override
// //   State<OverLayWidget> createState() => _OverLayWidgetState();
// // }

// // class _OverLayWidgetState extends State<OverLayWidget> {
// //    int _activeStepIndex = 0;
// //   List<Step> stepList() => [
// //          Step(
// //            state: _activeStepIndex<=0? StepState.editing: StepState.complete,
// //            isActive: _activeStepIndex >= 0,
// //           title: Text('Account'),
// //           content: Center(
// //             child: Text("data"),
// //           ),
// //         ),
// //          Step(
// //            state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
// //           isActive: _activeStepIndex >= 1,
// //           title: Text('Account'),
// //           content: Center(
// //             child: Text("data"),
// //           ),
// //         ),
// //          Step(
// //            state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
// //           isActive: _activeStepIndex >= 2,
// //           title: Text('Account'),
// //           content: Center(
// //             child: Text("data"),
// //           ),
// //         ),
// //       ];
// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Row(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: SizedBox(
// //                 height: 40.0,
// //                 width: 40.0,
// //                 child: ElevatedButton(
// //                     style: ElevatedButton.styleFrom(
// //                       padding: EdgeInsets.zero,
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10.0),
// //                       ),
// //                       primary: const Color.fromARGB(255, 253, 198, 69),
// //                     ),
// //                     onPressed: () {
// //                       Navigator.pop(context);
// //                     },
// //                     child: const Icon(
// //                       Icons.arrow_back,
// //                       color: Colors.white,
// //                       size: 30.0,
// //                     )),
// //               ),
// //             ),
// //           ],
// //         ),
// //         Row(
// //           children: [
// //             Container(
// //               height: 50.0,
// //               width: 25.0,
// //               color: Colors.white,
// //             ),
// //             Text(
// //               " REGISTER",
// //               style: GoogleFonts.poppins(
// //                 fontWeight: FontWeight.normal,
// //                 fontSize: 38.0,
// //                 color: Colors.white,
// //               ),
// //             ),
// //           ],
// //         ),
// //         const SizedBox(
// //           height: 50,
// //         ),
// //         Container(
// //           child: Stepper(
// //           type: StepperType.horizontal,
// //           steps: stepList(),
// //           onStepContinue: () {
// //             if (_activeStepIndex < (stepList().length - 1)) {
// //               _activeStepIndex += 1;
// //             }
// //             setState(() {});
// //           },
// //           onStepCancel: () {
// //             if (_activeStepIndex == 0) {
// //               return;
// //             }
// //             _activeStepIndex -= 1;
// //             setState(() {
              
// //             });
// //           },
// //         ),

// //                 ),
          
        
// //         Padding(
// //           padding: const EdgeInsets.only(top: 40.0),
// //           child: Text(
// //             "Terms & Conditions",
// //             style: GoogleFonts.poppins(
// //               fontSize: 14.0,
// //               color: const Color(0XFFF2A902),
// //             ),
// //           ),
// //         ),
// //         const SizedBox(
// //           height: 50.0,
// //         ),
// //         TextButton(
// //             onPressed: () {},
// //             child: Text(
// //               "Already Have An Account? Log In",
// //               style: GoogleFonts.poppins(
// //                 fontWeight: FontWeight.normal,
// //                 fontSize: 14.0,
// //                 color: Colors.white,
// //               ),
// //             )),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:food_app/src/screens/register/register_screen_2.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../core/constants/app_colors.dart';

// class OverLayWidget extends StatelessWidget {
//   const OverLayWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SizedBox(
//                 height: 40.0,
//                 width: 40.0,
//                 child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.zero,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       primary: const Color.fromARGB(255, 253, 198, 69),
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                       size: 30.0,
//                     )),
//               ),
//             ),
//           ],
//         ),
//         Row(
//           children: [
//             Container(
//               height: 50.0,
//               width: 25.0,
//               color: Colors.white,
//             ),
//             Text(
//               " REGISTER",
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 38.0,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 50,
//         ),
//         Container(
//           height: 320.0,
//           width: 320.0,
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.only(top: 15, left: 20.0, right: 20.0),
//             child: Column(
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: "User Name",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     labelText: "Email",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 55,
//                 ),
//                 Container(
//                   height: 40,
//                   child: TextButton(
//                     style: ElevatedButton.styleFrom(
//                       primary: AppColor.buttonBackgroundColor,
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: ((context) => const RegisterScreen2())));
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Center(
//                             child: Text(
//                               "Next",
//                               style: GoogleFonts.poppins(
//                                 fontWeight: FontWeight.normal,
//                                 fontSize: 17.0,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Icon(
//                           Icons.arrow_forward,
//                           color: Colors.white,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(top: 40.0),
//           child: Text(
//             "Terms & Conditions",
//             style: GoogleFonts.poppins(
//               fontSize: 14.0,
//               color: const Color(0XFFF2A902),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 50.0,
//         ),
//         TextButton(
//             onPressed: () {},
//             child: Text(
//               "Already Have An Account? Log In",
//               style: GoogleFonts.poppins(
//                 fontWeight: FontWeight.normal,
//                 fontSize: 14.0,
//                 color: Colors.white,
//               ),
//             )),
//       ],
//     );
//   }
// }

