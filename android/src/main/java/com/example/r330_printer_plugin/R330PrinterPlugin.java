package com.example.r330_printer_plugin;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** R330PrinterPlugin */
public class R330PrinterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private R330PrinterMethod r330PrinterMethod;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "r330_printer_plugin");
    r330PrinterMethod = new R330PrinterMethod(flutterPluginBinding.getApplicationContext());
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("printImage")) {
      String image = call.argument("arg");
      int resultValue = r330PrinterMethod.printImage(image);
      result.success(resultValue);
    } else if (call.method.equals("printBlankLine")) {
      int line = call.argument("arg");
      int resultValue = r330PrinterMethod.printBlankLine(line);
      result.success(resultValue);
    } else if (call.method.equals("bindPrinterService")) {
      r330PrinterMethod.bindPrinterService();
      result.success(true);
    } else if (call.method.equals("unbindPrinterService")) {
      r330PrinterMethod.unbindPrinterService();
      result.success(true);
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
