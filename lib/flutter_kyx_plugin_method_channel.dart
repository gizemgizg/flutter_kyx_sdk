import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_kyx_plugin_platform_dto.dart';
import 'flutter_kyx_plugin_platform_interface.dart';

/// An implementation of [FlutterKyxPluginPlatform] that uses method channels.
class MethodChannelFlutterKyxPlugin extends FlutterKyxPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_kyx_plugin');

  @override
  setMethodCallHandler(Future<dynamic> Function(MethodCall call)? handler) {
    methodChannel.setMethodCallHandler(handler);
  }

  @override
  init(data) async {
    return await methodChannel.invokeMethod('init', data.toJson());
  }

  @override
  run(data) async {
    final result = await methodChannel.invokeMethod('run', data.toJson());

    return RunResponse.fromJson(result);
  }

  @override
  void runIos(IosRunData data) {
    methodChannel.invokeMethod('run', data.toJson());
  }

  @override
  getTransactionTypes() async {
    final result =
        await methodChannel.invokeMethod('getTransactionTypes');

    return GetTransactionTypesResponse.fromJson(result);
  }

  @override
  getTransactionDetail(data) async {
    final result =
        await methodChannel.invokeMethod('getTransactionDetail', data.toJson());

    return GetTransactionDetailResponse.fromJson(result);
  }

  @override
  getTransactionVerificationResult(data) async {
    final result =
        await methodChannel.invokeMethod('getTransactionVerificationResult', data.toJson());

    return GetTransactionVerificationResultResponse.fromJson(result);
  }

  @override
  createPdf(data) async {
    final result =
        await methodChannel.invokeMethod('createPdf', data.toJson());

    return CreatePdfResponse.fromJson(result);
  }

  @override
  checkTransactionStatus(data) async {
    final result =
        await methodChannel.invokeMethod('checkTransactionStatus', data.toJson());

    return CheckTransactionStatusResponse.fromJson(result);
  }
}
