// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:e_commerce/core/constant/nameOfRoutes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import '../../core/services/services.dart';

// class GoogleSignInController extends GetxController {
//   User? currentUser = FirebaseAuth.instance.currentUser;

//   // late User user;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   bool isSignIn = false;
//   bool google = false;

//   signInWithGoogle() async {
//     final GoogleSignInAccount? googleSignInAccount =
//         await _googleSignIn.signIn();
//     GoogleSignInAuthentication? googleSignInAuthentication =
//         await googleSignInAccount!.authentication;
//     AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken,
//     );
//     isSignIn = true;
//     UserCredential authResult = await _auth.signInWithCredential(credential);

//     return FirebaseAuth.instance.signInWithCredential(credential);
//   }

//   getUserProfilePic() {
//     if (currentUser!.photoURL != null) {
//       return ClipRRect(
//         borderRadius: BorderRadius.circular(90),
//         child: CachedNetworkImage(
//           width: 100,
//           height: 100,
//           fit: BoxFit.cover,
//           imageUrl: currentUser!.photoURL!,
//           progressIndicatorBuilder: (context, url, downloadProgress) =>
//               const CircularProgressIndicator(),
//           errorWidget: (context, url, error) => const Icon(
//             Icons.error,
//             size: 100,
//             color: Colors.red,
//           ),
//         ),
//       );
//     }
//     update();
//   }

//   void signOutGoogle() async {
//     await _googleSignIn.signOut();
//     await _auth.signOut();
//     isSignIn = false;
//     update();
//     print("User Sign Out");
//   }

//   saveinfo() async {
//     sharedPref.setString("id", currentUser!.uid);
//     sharedPref.setString("email", currentUser!.email!);
//     sharedPref.setString("username", currentUser!.displayName!);
//     sharedPref.setString("phone", currentUser!.phoneNumber!);
//     sharedPref.setString("step", "2");
//     sharedPref.setBool("user", true);
//   }
// }
