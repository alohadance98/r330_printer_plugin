import 'package:flutter_test/flutter_test.dart';
import 'package:r330_printer_plugin/r330_printer_plugin.dart';
import 'package:r330_printer_plugin/r330_printer_plugin_platform_interface.dart';
import 'package:r330_printer_plugin/r330_printer_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockR330PrinterPluginPlatform 
    with MockPlatformInterfaceMixin
    implements R330PrinterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final R330PrinterPluginPlatform initialPlatform = R330PrinterPluginPlatform.instance;

  test('$MethodChannelR330PrinterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelR330PrinterPlugin>());
  });

  test('getPlatformVersion', () async {
    R330PrinterPlugin r330PrinterPlugin = R330PrinterPlugin();
    MockR330PrinterPluginPlatform fakePlatform = MockR330PrinterPluginPlatform();
    R330PrinterPluginPlatform.instance = fakePlatform;
  
    expect(await r330PrinterPlugin.getPlatformVersion(), '42');
  });
}
