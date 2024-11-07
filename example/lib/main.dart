import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:flutter_kyx_plugin/flutter_kyx_plugin.dart';
import 'package:flutter_kyx_plugin/flutter_kyx_plugin_platform_dto.dart';
import 'package:flutter_kyx_plugin/flutter_kyx_plugin_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

void showAlertDialog(String? message) {
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => AlertDialog(
      title: const Text("Hata"),
      content: Text(message ?? "Bilinmeyen bir hata oluştu."),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text("Tamam"),
        )
      ],
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterKyxPlugin = FlutterKyxPlugin();

  var _isInit = false;

  var selectedLanguage = Language.Turkish;

  @override
  void initState() {
    super.initState();

    if (Platform.isIOS) {
      _flutterKyxPlugin.setMethodCallHandler((call) {
        var arguments = call.arguments;

        switch (call.method) {
          case 'onInit':
            final initResponse =
                InitResponse.fromJson(arguments as Map<Object?, Object?>);

            _isInit = true;
            break;
          case 'onError':
            final errorResponse =
                Error.fromJson(arguments as Map<Object?, Object?>);

            showAlertDialog(errorResponse.message);
            break;
          case 'onFinish':
            final finishResponse =
                IosRunResponse.fromJson(arguments as Map<Object?, Object?>);

            if (finishResponse.isExited == true) {
              showAlertDialog("Kullanıcı işlemi iptal etti.");
            }

            print(finishResponse);
            break;

          case "onTransactionDetail":
            final transactionDetailResponse =
                GetTransactionDetailResponse.fromJson(
                    arguments as Map<Object?, Object?>);
            print(transactionDetailResponse);
            break;

          case "onTransactionVerificationResult":
            final transactionVerificationResultResponse =
                GetTransactionVerificationResultResponse.fromJson(
                    arguments as Map<Object?, Object?>);
            print(transactionVerificationResultResponse);
            break;

          case "onCheckTransactionStatus":
            final checkTransactionStatusResponse =
                CheckTransactionStatusResponse.fromJson(
                    arguments as Map<Object?, Object?>);
            print(checkTransactionStatusResponse);
            break;

          default:
            throw MissingPluginException();
        }

        return Future.value(true);
      });
    }

    initKyx();
  }

  void startKyx() async {
    if (!_isInit) {
      initKyx();
      return;
    }

    try {
      if (Platform.isAndroid) {
        var result = await _flutterKyxPlugin.run(
          RunData(
            language: selectedLanguage,
            createTransactionData: CreateTransactionData(
              transactionType: "default",
            ),
            speechRecognitionData: SpeechRecognitionData(
              speechText: "Bu bir test metnidir. Onaylıyorum.",
            ),
            finishTransactionData: FinishTransactionData(
              isShowScreen: true,
            ),
          ),
        );

        if (result.isExited == true) {
          showAlertDialog("Kullanıcı işlemi iptal etti.");
        }

        print(result);
      } else if (Platform.isIOS) {
        _flutterKyxPlugin.runIos(
          IosRunData(
            language: selectedLanguage,
            transactionType: "default",
            speechText: "Bu bir test metnidir. Onaylıyorum.",
            isShowResultPage: true,
          ),
        );
      }
    } on PlatformException catch (e) {
      showAlertDialog(e.message);
    }
  }

  void initKyx() async {
    try {
      final initResponse = await _flutterKyxPlugin.init(
        InitData(
          baseUrl: "https://kycapi.paraqr.com/",
          organizationCode: "PARAQR",
          email: "user@paraqr.com",
          password: "3WAjxLU>",
        ),
      );

      _isInit = true;

      print(initResponse);
    } on PlatformException catch (e) {
      showAlertDialog(e.message);
    }
  }

  void getTransactionDetail() async {
    try {
      final result = await _flutterKyxPlugin.getTransactionDetail(
        GetTransactionDetailData(
          transactionGuid: 'da452927-8e27-4543-ba17-00eb95696a75',
        ),
      );

      print(result);
    } on PlatformException catch (e) {
      showAlertDialog(e.message);
    }
  }

  void checkTransactionStatus() async {
    try {
      final result = await _flutterKyxPlugin.checkTransactionStatus(
        CheckTransactionStatusData(
          transactionGuid: 'da452927-8e27-4543-ba17-00eb95696a75',
        ),
      );

      print(result);
    } on PlatformException catch (e) {
      showAlertDialog(e.message);
    }
  }

  void getTransactionVerificationResult() async {
    try {
      final result = await _flutterKyxPlugin.getTransactionVerificationResult(
        GetTransactionVerificationResultData(
          transactionGuid: 'da452927-8e27-4543-ba17-00eb95696a75',
        ),
      );

      print(result);
    } on PlatformException catch (e) {
      showAlertDialog(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF051E42),
          shadowColor: Colors.transparent,
        ),
        backgroundColor: const Color(0xFF051E42),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/kyx_logo.png",
                  height: 80,
                ),
                const SizedBox(height: 60),
                const Text(
                  'KnowYourX',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    selectedLanguage == Language.Turkish
                                        ? const Color(0xFF296DE5)
                                        : Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFF296DE5),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedLanguage = Language.Turkish;
                                });
                              },
                              child: Text(
                                'Türkçe',
                                style: TextStyle(
                                  color: selectedLanguage == Language.Turkish
                                      ? Colors.white
                                      : const Color(0xFF296DE5),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor:
                                    selectedLanguage == Language.English
                                        ? const Color(0xFF296DE5)
                                        : Colors.white,
                                side: const BorderSide(
                                  color: Color(0xFF296DE5),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedLanguage = Language.English;
                                });
                              },
                              child: Text(
                                'İngilizce',
                                style: TextStyle(
                                  color: selectedLanguage == Language.English
                                      ? Colors.white
                                      : const Color(0xFF296DE5),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: startKyx,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF296DE5),
                        ),
                        child: const Text(
                          'Start Default Process',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: checkTransactionStatus,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF296DE5),
                        ),
                        child: const Text(
                          'Check Transaction Status',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: getTransactionDetail,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF296DE5),
                        ),
                        child: const Text(
                          'Get Transaction Detail',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: getTransactionVerificationResult,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF296DE5),
                        ),
                        child: const Text(
                          'Get Transaction Verification Result',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
