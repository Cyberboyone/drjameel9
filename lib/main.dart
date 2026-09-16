import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'config/app_config.dart';
import 'data/sample_lessons.dart';
import 'screens/splash_screen.dart';
import 'services/ads_service.dart';
import 'services/duration_service.dart';
import 'services/player_service.dart';
import 'services/progress_service.dart';
import 'theme/ramadan_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: RamadanColors.background,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  // Initialize app config
  AppConfig.init(AppConfig(
    appName: 'Dr Jameel - Tafsir Suratul Nur 1443 (Part 1)',
    scholarName: 'Dr. Jameel Muhammad Sadis',
    lessons: sampleLessons,
  ));

  try {
    await JustAudioBackground.init(
      androidNotificationChannelId: AppConfig.instance.androidNotificationChannelId,
      androidNotificationChannelName: 'Audio playback',
      androidNotificationOngoing: true,
    );
  } catch (_) {}

  try {
    DurationService.instance.init();
  } catch (_) {}

  try {
    await ProgressService.instance.init();
  } catch (_) {}

  // Restore the last played lesson so the player picks up where it left off.
  final lastPlayedId = ProgressService.instance.lastPlayedLessonId;
  if (lastPlayedId != null) {
    for (final lesson in AppConfig.instance.lessons) {
      if (lesson.id == lastPlayedId) {
        PlayerService.instance.currentLesson = lesson;
        break;
      }
    }
  }

  try {
    await AdsService.instance.init();
  } catch (_) {}

  runApp(const IslamicAudioApp());
}

class IslamicAudioApp extends StatelessWidget {
  const IslamicAudioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConfig.instance.appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'GB'),
      supportedLocales: const [Locale('en', 'GB')],
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      theme: RamadanTheme.darkTheme,
      home: const SplashScreen(),
    );
  }
}

