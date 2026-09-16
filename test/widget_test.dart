import 'package:flutter_test/flutter_test.dart';

import 'package:drjameel9/main.dart';

void main() {
  testWidgets('App boots and shows the splash screen', (tester) async {
    await tester.pumpWidget(const IslamicAudioApp());
    await tester.pump(const Duration(seconds: 2));

    expect(
      find.text('Dr Jameel Sadis'),
      findsOneWidget,
    );
  });
}
