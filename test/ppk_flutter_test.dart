import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ppk_flutter/ppk_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('ppk_flutter');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await PpkFlutter.platformVersion, '42');
  });
}
