import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify/presentation/pages/bottom_navigation_bar/bloc/bottom_navigation_bar_cubit.dart';
import 'package:spotify/presentation/pages/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:spotify/presentation/pages/intro/bloc/theme_cubit.dart';
import 'package:spotify/presentation/pages/splash/splash_screen.dart';


import 'core/config/themes/app_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemesCubit()),
        BlocProvider(create: (_) => BottomNavCubit()),
      ],
      child: BlocBuilder<ThemesCubit, ThemeMode>(
        builder: (context, state) => MaterialApp(
          title: 'Spotify',
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: state,
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}