import 'package:flutter/services.dart';

import 'flutter_kyx_plugin_platform_dto.dart';
import 'flutter_kyx_plugin_platform_interface.dart';

class FlutterKyxPlugin {
  setMethodCallHandler(Future<dynamic> Function(MethodCall call)? handler) {
    FlutterKyxPluginPlatform.instance.setMethodCallHandler(handler);
  }

  Future<bool> init(InitData data) async {
    return FlutterKyxPluginPlatform.instance.init(data);
  }

  Future<RunResponse> run(RunData data) async {
    return FlutterKyxPluginPlatform.instance.run(data);
  }

  Future<GetTransactionTypesResponse> getTransactionTypes() async {
    return FlutterKyxPluginPlatform.instance.getTransactionTypes();
  }

  void runIos(IosRunData data) {
    FlutterKyxPluginPlatform.instance.runIos(data);
  }

  Future<GetTransactionDetailResponse> getTransactionDetail(
      GetTransactionDetailData data) async {
    return FlutterKyxPluginPlatform.instance.getTransactionDetail(data);
  }

  Future<GetTransactionVerificationResultResponse>
  getTransactionVerificationResult(
      GetTransactionVerificationResultData data) async {
    return FlutterKyxPluginPlatform.instance
        .getTransactionVerificationResult(data);
  }

  Future<CreatePdfResponse> createPdf(CreatePdfData data) async {
    return FlutterKyxPluginPlatform.instance.createPdf(data);
  }

  Future<CheckTransactionStatusResponse> checkTransactionStatus(
      CheckTransactionStatusData data) async {
    return FlutterKyxPluginPlatform.instance.checkTransactionStatus(data);
  }
}
