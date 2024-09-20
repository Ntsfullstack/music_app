import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widget/app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/presentation/pages/intro/select_mode.dart';

class IntroPage extends StatelessWidget {
  const IntroPage ({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage(
                  AppImages.banner,
                )
              )
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
    vertical: 40,
    horizontal: 40
    ),
              child: Column(
                children: [
                  SvgPicture.asset(
                      AppVectors.logo
                  ),
                  Spacer(),
                  const Text(
                      'Enjoy Listening To Music',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    textAlign: TextAlign.center,
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 20,),
                  ButtonTheme(
                      child: AppButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context ) =>  ChooseMode()
                                )
                            );
                          },
                          tittle: 'Continue',
                          height: 60))
                ],
              ),
            ),
          )




        ],
      ),
    );
  }
}