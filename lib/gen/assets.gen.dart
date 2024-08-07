/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Autocarlogo.png
  AssetGenImage get autocarlogo =>
      const AssetGenImage('assets/images/Autocarlogo.png');

  /// File path: assets/images/auto_1.jpeg
  AssetGenImage get auto1 => const AssetGenImage('assets/images/auto_1.jpeg');

  /// File path: assets/images/auto_2.jpeg
  AssetGenImage get auto2 => const AssetGenImage('assets/images/auto_2.jpeg');

  /// File path: assets/images/auto_3.jpeg
  AssetGenImage get auto3 => const AssetGenImage('assets/images/auto_3.jpeg');

  /// File path: assets/images/auto_4.jpeg
  AssetGenImage get auto4 => const AssetGenImage('assets/images/auto_4.jpeg');

  /// File path: assets/images/auto_5.jpeg
  AssetGenImage get auto5 => const AssetGenImage('assets/images/auto_5.jpeg');

  /// File path: assets/images/background.jpg
  AssetGenImage get background =>
      const AssetGenImage('assets/images/background.jpg');

  /// File path: assets/images/backgrounddone.png
  AssetGenImage get backgrounddone =>
      const AssetGenImage('assets/images/backgrounddone.png');

  /// File path: assets/images/carrescue1.png
  AssetGenImage get carrescue1 =>
      const AssetGenImage('assets/images/carrescue1.png');

  /// File path: assets/images/carrescue10.png
  AssetGenImage get carrescue10 =>
      const AssetGenImage('assets/images/carrescue10.png');

  /// File path: assets/images/carrescue2.png
  AssetGenImage get carrescue2 =>
      const AssetGenImage('assets/images/carrescue2.png');

  /// File path: assets/images/carrescue8.png
  AssetGenImage get carrescue8 =>
      const AssetGenImage('assets/images/carrescue8.png');

  /// File path: assets/images/carrescue9.png
  AssetGenImage get carrescue9 =>
      const AssetGenImage('assets/images/carrescue9.png');

  /// File path: assets/images/chungaotu.jpg
  AssetGenImage get chungaotu =>
      const AssetGenImage('assets/images/chungaotu.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        autocarlogo,
        auto1,
        auto2,
        auto3,
        auto4,
        auto5,
        background,
        backgrounddone,
        carrescue1,
        carrescue10,
        carrescue2,
        carrescue8,
        carrescue9,
        chungaotu
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
