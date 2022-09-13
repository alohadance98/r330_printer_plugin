import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:r330_printer_plugin/r330_printer_platform_interface.dart';

class R330PrinterPlugin {
  Future<String?> getServiceVersion() {
    return R330PrinterPlatform.instance.getServiceVersion();
  }

  Future<Void?> printEpson(Uint8List bytes) {
    return R330PrinterPlatform.instance.printEpson(bytes);
  }

  Future<Void?> printText(String text) {
    return R330PrinterPlatform.instance.printText(text);
  }

  Future<Void?> printPicture(Uint8List picture) {
    return R330PrinterPlatform.instance.printPicture(picture);
  }

  Future<Void?> printBarCode(
      String data, int symbology, int height, int width) {
    return R330PrinterPlatform.instance
        .printBarCode(data, symbology, height, width);
  }

  Future<Void?> printQRCode(String data, int modulesize, int errorlevel) {
    return R330PrinterPlatform.instance
        .printQRCode(data, modulesize, errorlevel);
  }

  Future<Void?> setAlignment(int alignment) {
    return R330PrinterPlatform.instance.setAlignment(alignment);
  }

  Future<Void?> setTextSize(Float textSize) {
    return R330PrinterPlatform.instance.setTextSize(textSize);
  }

  Future<Void?> nextLine(int line) {
    return R330PrinterPlatform.instance.nextLine(line);
  }

  Future<Void?> setTextBold(Bool bold) {
    return R330PrinterPlatform.instance.setTextBold(bold);
  }

  Future<Void?> setDark(int value) {
    return R330PrinterPlatform.instance.setDark(value);
  }

  Future<Void?> setLineHeight(Float lineHeight) {
    return R330PrinterPlatform.instance.setLineHeight(lineHeight);
  }

  Future<Void?> setTextDoubleWidth(Bool enable) {
    return R330PrinterPlatform.instance.setTextDoubleWidth(enable);
  }

  Future<Void?> setTextDoubleHeight(Bool enable) {
    return R330PrinterPlatform.instance.setTextDoubleHeight(enable);
  }

  Future<Void?> setCode(String code) {
    return R330PrinterPlatform.instance.setCode(code);
  }
}
