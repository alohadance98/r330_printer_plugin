import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:r330_printer_plugin/r330_printer_plugin_method_channel.dart';

void main() {
  MethodChannelR330PrinterPlugin platform = MethodChannelR330PrinterPlugin();
  const MethodChannel channel = MethodChannel('r330_printer_plugin');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
