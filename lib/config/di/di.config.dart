// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:spotify/data/local/shared_preferences_manager.dart' as _i196;
import 'package:spotify/data/repository/auth/auth_repository.dart' as _i993;
import 'package:spotify/navigation/app_router.dart' as _i415;
import 'package:spotify/presentation/pages/bottom_navigation_bar/bloc/bottom_navigation_bar_cubit.dart'
    as _i198;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i198.BottomNavCubit>(() => _i198.BottomNavCubit());
    gh.singleton<_i415.AppRouter>(() => _i415.AppRouter());
    gh.singleton<_i993.AuthRepositoryImpl>(() => _i993.AuthRepositoryImpl());
    gh.singleton<_i196.SharedPreferencesManager>(
        () => _i196.SharedPreferencesManager());
    return this;
  }
}
