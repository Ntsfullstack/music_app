import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/pages/intro/intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState () {
    super.initState();
    redirect(context);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo
        )
      ),
    );
  }
  Future<void> redirect(BuildContext context) async{
    await Future.delayed(
        const Duration(seconds: 2)
    );
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context ) =>  IntroPage()
        )
    );
  }

}