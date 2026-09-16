import 'package:flutter/material.dart';
import '../models/lesson.dart';

class AppConfig {
  final String appName;
  final String scholarName;
  final String scholarPhotoPath;
  final Color primaryColor;
  final Color accentColor;
  final List<Lesson> lessons;
  final String androidNotificationChannelId;
  final String adBannerUnitId;
  final String adAppId;

  const AppConfig({
    required this.appName,
    required this.scholarName,
    this.scholarPhotoPath = 'assets/images/scholar_drjameel.png',
    this.primaryColor = const Color(0xFFC5A55A),
    this.accentColor = const Color(0xFFD4AF37),
    required this.lessons,
    this.androidNotificationChannelId = 'com.nakudin.drjameel9.channel.audio',
    this.adBannerUnitId = 'ca-app-pub-3940256099942544/6300978111',
    this.adAppId = 'ca-app-pub-3940256099942544~3347511713',
  });

  static AppConfig? _instance;
  static AppConfig get instance {
    assert(_instance != null, 'AppConfig must be initialized first');
    return _instance!;
  }

  static void init(AppConfig config) {
    _instance = config;
  }
}

