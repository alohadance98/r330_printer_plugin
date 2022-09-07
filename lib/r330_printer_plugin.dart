import 'package:flutter/services.dart';

class R330PrinterPlugin {
  static const methodChannel = MethodChannel('r330_printer_plugin');

  static Future<int> goPrint(String image) async {
    final int result =
        await methodChannel.invokeMethod('printImage', {"arg": image});
    return result;
  }

  static Future<int> goPaperFeed(int number) async {
    final int result =
        await methodChannel.invokeMethod('printBlankLine', {"arg": number});
    return result;
  }

  static Future<bool?> bindingPrinter() async {
    final bool? result = await methodChannel.invokeMethod('bindPrinterService');
    return result;
  }

  static Future<bool?> unbindingPrinter() async {
    final bool? result =
        await methodChannel.invokeMethod('unbindPrinterService');
    return result;
  }
}
