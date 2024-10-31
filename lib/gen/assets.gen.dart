/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Satoshi-Black.otf
  String get satoshiBlack => 'assets/fonts/Satoshi-Black.otf';

  /// File path: assets/fonts/Satoshi-BlackItalic.otf
  String get satoshiBlackItalic => 'assets/fonts/Satoshi-BlackItalic.otf';

  /// File path: assets/fonts/Satoshi-Bold.otf
  String get satoshiBold => 'assets/fonts/Satoshi-Bold.otf';

  /// File path: assets/fonts/Satoshi-BoldItalic.otf
  String get satoshiBoldItalic => 'assets/fonts/Satoshi-BoldItalic.otf';

  /// File path: assets/fonts/Satoshi-Italic.otf
  String get satoshiItalic => 'assets/fonts/Satoshi-Italic.otf';

  /// File path: assets/fonts/Satoshi-Light.otf
  String get satoshiLight => 'assets/fonts/Satoshi-Light.otf';

  /// File path: assets/fonts/Satoshi-LightItalic.otf
  String get satoshiLightItalic => 'assets/fonts/Satoshi-LightItalic.otf';

  /// File path: assets/fonts/Satoshi-Medium.otf
  String get satoshiMedium => 'assets/fonts/Satoshi-Medium.otf';

  /// File path: assets/fonts/Satoshi-MediumItalic.otf
  String get satoshiMediumItalic => 'assets/fonts/Satoshi-MediumItalic.otf';

  /// File path: assets/fonts/Satoshi-Regular.otf
  String get satoshiRegular => 'assets/fonts/Satoshi-Regular.otf';

  /// List of all assets
  List<String> get values => [
        satoshiBlack,
        satoshiBlackItalic,
        satoshiBold,
        satoshiBoldItalic,
        satoshiItalic,
        satoshiLight,
        satoshiLightItalic,
        satoshiMedium,
        satoshiMediumItalic,
        satoshiRegular
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/images/banner.png');

  /// File path: assets/images/banner_2.png
  AssetGenImage get banner2 =>
      const AssetGenImage('assets/images/banner_2.png');

  /// List of all assets
  List<AssetGenImage> get values => [banner, banner2];
}

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/apple.svg
  String get apple => 'assets/vectors/apple.svg';

  /// File path: assets/vectors/banner.svg
  String get banner => 'assets/vectors/banner.svg';

  /// File path: assets/vectors/discovery.svg
  String get discovery => 'assets/vectors/discovery.svg';

  /// File path: assets/vectors/google.svg
  String get google => 'assets/vectors/google.svg';

  /// File path: assets/vectors/heart.svg
  String get heart => 'assets/vectors/heart.svg';

  /// File path: assets/vectors/home.svg
  String get home => 'assets/vectors/home.svg';

  /// File path: assets/vectors/logo.svg
  String get logo => 'assets/vectors/logo.svg';

  /// File path: assets/vectors/moon.svg
  String get moon => 'assets/vectors/moon.svg';

  /// File path: assets/vectors/profile.svg
  String get profile => 'assets/vectors/profile.svg';

  /// File path: assets/vectors/search.svg
  String get search => 'assets/vectors/search.svg';

  /// File path: assets/vectors/sun.svg
  String get sun => 'assets/vectors/sun.svg';

  /// List of all assets
  List<String> get values => [
        apple,
        banner,
        discovery,
        google,
        heart,
        home,
        logo,
        moon,
        profile,
        search,
        sun
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
