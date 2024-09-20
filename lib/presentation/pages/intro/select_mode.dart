import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widget/app_button.dart';
import '../../../core/config/assets/app_images.dart';
import '../../../core/config/assets/app_vectors.dart';
import '../first_pages/first_page.dart';
import 'bloc/theme_cubit.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

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
                      AppImages.banner_2,
                    )
                )
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 40
              ),
              child: Column(
                children: [
                  SvgPicture.asset(
                      AppVectors.logo
                  ),
                  const Spacer(),
                  const Text(
                    'Choose mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<ThemesCubit>().changeTheme(ThemeMode.dark);
                        },
                        child: ClipOval(
                          child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration:  BoxDecoration(
                                color: const Color(0xff30393c).withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ),
                      ),
                      const SizedBox(width: 30,),
                      GestureDetector(
                        onTap: () {
                          context.read<ThemesCubit>().changeTheme(ThemeMode.light);
                        },
                        child: ClipOval(
                            child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                              child: Container(
                                width: 70,  // Đặt chiều rộng
                                height: 70, // Đặt chiều cao bằng chiều rộng để tạo hình tròn
                                decoration:  BoxDecoration(
                                  color: const Color(0xffd8e0e3).withOpacity(0.5),  // Màu nền
                                  shape: BoxShape.circle,  // Đặt hình dạng là hình tròn
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: SvgPicture.asset(
                                    AppVectors.sun,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ButtonTheme(
                      child: AppButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context ) => const StartPage()
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