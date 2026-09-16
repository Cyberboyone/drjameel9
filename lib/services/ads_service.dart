import 'package:flutter/foundation.dart';

class AdsService {
  AdsService._();
  static final AdsService instance = AdsService._();

  // Test ad unit IDs
  static const String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static const String appId = 'ca-app-pub-3940256099942544~3347511713';

  Future<void> init() async {
    debugPrint('AdsService: stub init (using test ads)');
  }
}
