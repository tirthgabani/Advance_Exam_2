import 'package:exam_2/Utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.poppins(
          color: MyColors.black,
        ),
        textTheme:
            TextTheme(bodyText2: GoogleFonts.poppins(color: MyColors.black)),
      )),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}
