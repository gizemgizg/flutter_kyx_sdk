import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_kyx_plugin_method_channel.dart';
import 'flutter_kyx_plugin_platform_dto.dart';

abstract class FlutterKyxPluginPlatform extends PlatformInterface {
  /// Constructs a FlutterKyxPluginPlatform.
  FlutterKyxPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterKyxPluginPlatform _instance = MethodChannelFlutterKyxPlugin();

  /// The default instance of [FlutterKyxPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterKyxPlugin].
  static FlutterKyxPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterKyxPluginPlatform] when
  /// they register themselves.
  static set instance(FlutterKyxPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> init(InitData data) {
    throw UnimplementedError('init() has not been implemented.');
  }

  Future<RunResponse> run(RunData data) {
    throw UnimplementedError('run() has not been implemented.');
  }

  void runIos(IosRunData data) {
    throw UnimplementedError('runIos() has not been implemented.');
  }

  Future<GetTransactionTypesResponse> getTransactionTypes() {
    throw UnimplementedError('getTransactionTypes() has not been implemented.');
  }

  Future<GetTransactionDetailResponse> getTransactionDetail(
      GetTransactionDetailData data) {
    throw UnimplementedError(
        'getTransactionDetail() has not been implemented.');
  }

  Future<GetTransactionVerificationResultResponse>
      getTransactionVerificationResult(
          GetTransactionVerificationResultData data) {
    throw UnimplementedError(
        'getTransactionVerificationResult() has not been implemented.');
  }

  Future<CreatePdfResponse> createPdf(CreatePdfData data) {
    throw UnimplementedError('createPdf() has not been implemented.');
  }

  Future<CheckTransactionStatusResponse> checkTransactionStatus(
      CheckTransactionStatusData data) {
    throw UnimplementedError(
        'checkTransactionStatus() has not been implemented.');
  }

  setMethodCallHandler(Future<dynamic> Function(MethodCall call)? handler) {
    throw UnimplementedError(
        'setMethodCallHandler() has not been implemented.');
  }
}

class InitResponse {
  List<String> transactionTypes;

  InitResponse({required this.transactionTypes});

  factory InitResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return InitResponse(
      transactionTypes: (safeJson?['transactionTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }
}

class Error {
  final String message;
  final String? code;

  Error({
    required this.message,
    this.code,
  });

  factory Error.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return Error(
      message: safeJson?['message'] as String,
      code: safeJson?['code'] as String?,
    );
  }
}

class Step {
  final int id;
  final int step;
  final int? successStepId;
  final int? failureStepId;
  final int? skipStepId;

  Step({
    required this.id,
    required this.step,
    this.successStepId,
    this.failureStepId,
    this.skipStepId,
  });

  factory Step.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return Step(
      id: safeJson?['id'] as int,
      step: safeJson?['step'] as int,
      successStepId: safeJson?['successStepId'] as int?,
      failureStepId: safeJson?['failureStepId'] as int?,
      skipStepId: safeJson?['skipStepId'] as int?,
    );
  }
}

class WorkingHours {
  final bool isWorkingHours;
  final String? message;
  final bool? canFillForm;

  WorkingHours({
    required this.isWorkingHours,
    this.message,
    this.canFillForm,
  });

  factory WorkingHours.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return WorkingHours(
      isWorkingHours: safeJson?['isWorkingHours'] as bool,
      message: safeJson?['message'] as String?,
      canFillForm: safeJson?['canFillForm'] as bool?,
    );
  }
}

class CreateTransactionResponse {
  final String guid;
  final WorkingHours? workingHours;
  final List<Step> steps;

  CreateTransactionResponse({
    required this.guid,
    this.workingHours,
    required this.steps,
  });

  factory CreateTransactionResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return CreateTransactionResponse(
      guid: safeJson?['guid'] as String,
      workingHours: safeJson?['workingHours'] == null
          ? null
          : WorkingHours.fromJson(
              safeJson?['workingHours'] as Map<Object?, Object?>),
      steps: (safeJson?['steps'] as List<dynamic>)
          .map((e) => Step.fromJson(e as Map<Object?, Object?>))
          .toList(),
    );
  }
}

class FrontCardDetectionResponse {
  final String idCardFront;
  final String idCardFrontPersonFace;
  final bool isSkipped;
  final bool isExited;

  FrontCardDetectionResponse({
    required this.idCardFront,
    required this.idCardFrontPersonFace,
    required this.isSkipped,
    required this.isExited,
  });

  factory FrontCardDetectionResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return FrontCardDetectionResponse(
      idCardFront: safeJson?['idCardFront'] as String,
      idCardFrontPersonFace: safeJson?['idCardFrontPersonFace'] as String,
      isSkipped: safeJson?['isSkipped'] as bool,
      isExited: safeJson?['isExited'] as bool,
    );
  }
}

class BackCardDetectionResponse {
  final String idCardBack;
  final String mrz;
  final bool isSkipped;
  final bool isExited;

  BackCardDetectionResponse({
    required this.idCardBack,
    required this.mrz,
    required this.isSkipped,
    required this.isExited,
  });

  factory BackCardDetectionResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return BackCardDetectionResponse(
      idCardBack: safeJson?['idCardBack'] as String,
      mrz: safeJson?['mrz'] as String,
      isSkipped: safeJson?['isSkipped'] as bool,
      isExited: safeJson?['isExited'] as bool,
    );
  }
}

class MrzReaderResponse {
  final String mrz;
  final bool isSkipped;
  final bool isExited;

  MrzReaderResponse({
    required this.mrz,
    required this.isSkipped,
    required this.isExited,
  });

  factory MrzReaderResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return MrzReaderResponse(
      mrz: safeJson?['mrz'] as String,
      isSkipped: safeJson?['isSkipped'] as bool,
      isExited: safeJson?['isExited'] as bool,
    );
  }
}

class NfcReaderResponse {
  final String? birthDate;
  final String? documentNo;
  final String? expiryDate;
  final String? firstName;
  final String? gender;
  final String? identityNo;
  final String? lastName;
  final String? mrz;
  final String? nationality;
  final bool isSkipped;
  final bool isExited;

  NfcReaderResponse({
    this.birthDate,
    this.documentNo,
    this.expiryDate,
    this.firstName,
    this.gender,
    this.identityNo,
    this.lastName,
    this.mrz,
    this.nationality,
    required this.isSkipped,
    required this.isExited,
  });

  factory NfcReaderResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return NfcReaderResponse(
      isSkipped: safeJson?['isSkipped'] as bool,
      isExited: safeJson?['isExited'] as bool,
      birthDate: safeJson?['birthDate'] as String?,
      documentNo: safeJson?['documentNo'] as String?,
      expiryDate: safeJson?['expiryDate'] as String?,
      firstName: safeJson?["firstName"] as String?,
      gender: safeJson?["gender"] as String?,
      identityNo: safeJson?["identityNo"] as String?,
      lastName: safeJson?["lastName"] as String?,
      mrz: safeJson?["mrz"] as String?,
      nationality: safeJson?["nationality"] as String?,
    );
  }
}

class LivenessResponse {
  final bool isSkipped;
  final bool isExited;

  LivenessResponse({
    required this.isSkipped,
    required this.isExited,
  });

  factory LivenessResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return LivenessResponse(
      isSkipped: safeJson?['isSkipped'] as bool,
      isExited: safeJson?['isExited'] as bool,
    );
  }
}

class SpeechRecognitionResponse {
  final String videoFilePath;
  final bool isSkipped;
  final bool isExited;

  SpeechRecognitionResponse({
    required this.videoFilePath,
    required this.isSkipped,
    required this.isExited,
  });

  factory SpeechRecognitionResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return SpeechRecognitionResponse(
      videoFilePath: safeJson?['videoFilePath'] as String,
      isSkipped: safeJson?['isSkipped'] as bool,
      isExited: safeJson?['isExited'] as bool,
    );
  }
}

class VideoCallResponse {
  final bool isSuccess;
  final bool isSkipped;
  final bool isExited;

  VideoCallResponse({
    required this.isSuccess,
    required this.isSkipped,
    required this.isExited,
  });

  factory VideoCallResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return VideoCallResponse(
      isSuccess: safeJson?['isSuccess'] as bool,
      isSkipped: safeJson?['isSkipped'] as bool,
      isExited: safeJson?['isExited'] as bool,
    );
  }
}

class ResultPageResponse {
  final bool isSuccess;
  final bool isSkipped;
  final bool isRetried;

  ResultPageResponse({
    required this.isSuccess,
    required this.isSkipped,
    this.isRetried = false,
  });

  factory ResultPageResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return ResultPageResponse(
      isSuccess: safeJson?['isSuccess'] as bool,
      isSkipped: safeJson?['isSkipped'] as bool,
      isRetried: safeJson?['isRetried'] as bool,
    );
  }
}

class IosRunResponse {
  final DetectTypeResult? detectTypeResult;
  final NfcResult? nfcResult;
  final LivenessResult? livenessResult;
  final String transactionId;
  final bool? isExited;

  IosRunResponse({
    this.detectTypeResult,
    this.nfcResult,
    this.livenessResult,
    this.isExited,
    required this.transactionId,
  });

  factory IosRunResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return IosRunResponse(
      detectTypeResult: safeJson?['detectTypeResult'] == null
          ? null
          : DetectTypeResult.fromJson(
              safeJson?['detectTypeResult'] as Map<Object?, Object?>),
      nfcResult: safeJson?['nfcResult'] == null
          ? null
          : NfcResult.fromJson(safeJson?['nfcResult'] as Map<Object?, Object?>),
      livenessResult: safeJson?['livenessResult'] == null
          ? null
          : LivenessResult.fromJson(
              safeJson?['livenessResult'] as Map<Object?, Object?>),
      isExited: safeJson?['isExited'] as bool?,
      transactionId: safeJson?['transactionId'] as String,
    );
  }
}

class DetectTypeResult {
  final FrontResult frontDetect;
  final BackResult backDetect;

  DetectTypeResult({
    required this.frontDetect,
    required this.backDetect,
  });

  factory DetectTypeResult.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return DetectTypeResult(
      frontDetect: FrontResult.fromJson(
          safeJson?['frontDetect'] as Map<Object?, Object?>),
      backDetect:
          BackResult.fromJson(safeJson?['backDetect'] as Map<Object?, Object?>),
    );
  }
}

class FrontResult {
  final String image;

  FrontResult({required this.image});

  factory FrontResult.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return FrontResult(
      image: safeJson?['image'] as String,
    );
  }
}

class BackResult extends FrontResult {
  final String documentNumber;
  final String expiryDate;
  final String birthDate;

  BackResult({
    required String image,
    required this.documentNumber,
    required this.expiryDate,
    required this.birthDate,
  }) : super(image: image);

  factory BackResult.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return BackResult(
      image: safeJson?['image'] as String,
      documentNumber: safeJson?['documentNumber'] as String,
      expiryDate: safeJson?['expiryDate'] as String,
      birthDate: safeJson?['birthDate'] as String,
    );
  }
}

class NfcResult {
  final String name;
  final String surname;
  final String personalNumber;
  final String sex;
  final String birthDate;
  final String expireDate;
  final String serialNumber;
  final String nationality;
  final String issuerAuthory;
  final String nfcImage;
  final String mrz;
  final String placeOfBirth;

  NfcResult({
    required this.name,
    required this.surname,
    required this.personalNumber,
    required this.sex,
    required this.birthDate,
    required this.expireDate,
    required this.serialNumber,
    required this.nationality,
    required this.issuerAuthory,
    required this.nfcImage,
    required this.mrz,
    required this.placeOfBirth,
  });

  factory NfcResult.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return NfcResult(
        name: safeJson?["name"] as String,
        surname: safeJson?["surname"] as String,
        personalNumber: safeJson?["personalNumber"] as String,
        sex: safeJson?["sex"] as String,
        birthDate: safeJson?["birthDate"] as String,
        expireDate: safeJson?["expireDate"] as String,
        serialNumber: safeJson?["serialNumber"] as String,
        nationality: safeJson?["nationality"] as String,
        issuerAuthory: safeJson?["issuerAuthory"] as String,
        nfcImage: safeJson?["nfcImage"] as String,
        mrz: safeJson?["mrz"] as String,
        placeOfBirth: safeJson?["placeOfBirth"] as String);
  }
}

class LivenessResult {
  final bool isLiveness;
  final String smilePicture;

  LivenessResult({
    required this.isLiveness,
    required this.smilePicture,
  });

  factory LivenessResult.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return LivenessResult(
      isLiveness: safeJson?['isLiveness'] as bool,
      smilePicture: safeJson?['smilePicture'] as String,
    );
  }
}

class GetTransactionTypesResponse {
  final List<String> transactionTypes;

  GetTransactionTypesResponse({required this.transactionTypes});

  factory GetTransactionTypesResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return GetTransactionTypesResponse(
      transactionTypes: (safeJson?['transactionTypes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }
}

class GetTransactionDetailResponse {
  final String? transactionGuid;

  final TransactionDetailStatus status;
  final TransactionDocumentType documentType;
  final TransactionDetail? detail;
  final List<TransactionItem>? items;
  final List<TransactionLog>? logs;
  final List<TransactionScore>? scores;

  GetTransactionDetailResponse({
    this.transactionGuid,
    required this.status,
    required this.documentType,
    this.detail,
    this.items,
    this.logs,
    this.scores,
  });

  factory GetTransactionDetailResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    final status = safeJson?['status'] as int;
    final transactionDetailStatus = TransactionDetailStatus.values.firstWhere(
      (e) => e.value == status,
      orElse: () => TransactionDetailStatus.unknown,
    );

    final documentType = safeJson?['documentType'] as int;
    final transactionDocumentType = TransactionDocumentType.values.firstWhere(
      (e) => e.value == documentType,
      orElse: () => TransactionDocumentType.notSet,
    );

    return GetTransactionDetailResponse(
      transactionGuid: safeJson?['transactionGuid'] as String?,
      status: transactionDetailStatus,
      documentType: transactionDocumentType,
      detail: safeJson?['detail'] == null
          ? null
          : TransactionDetail.fromJson(
              safeJson?['detail'] as Map<Object?, Object?>),
      items: (safeJson?['items'] as List<dynamic>?)
          ?.map((e) => TransactionItem.fromJson(e as Map<Object?, Object?>))
          .toList(),
      logs: (safeJson?['logs'] as List<dynamic>?)
          ?.map((e) => TransactionLog.fromJson(e as Map<Object?, Object?>))
          .toList(),
      scores: (safeJson?['scores'] as List<dynamic>?)
          ?.map((e) => TransactionScore.fromJson(e as Map<Object?, Object?>))
          .toList(),
    );
  }
}

enum TransactionDetailStatus {
  unknown,
  inProgress,
  success,
  failure,
  timeout,
  suspicious,
}

extension on TransactionDetailStatus {
  int get value {
    switch (this) {
      case TransactionDetailStatus.unknown:
        return 0;
      case TransactionDetailStatus.inProgress:
        return 1;
      case TransactionDetailStatus.success:
        return 10;
      default:
        return 0;
    }
  }
}

enum TransactionDocumentType {
  notSet,
  oldIdCard,
  newIdCard,
  passport,
  oldDriverCard,
  newDriverCard,
  newIdCardNoNfc,
  passportNoNfc,
  oldWorkPermissionCard,
  newWorkPermissionCard,
  certificateOfResidence,
}

extension on TransactionDocumentType {
  int get value {
    switch (this) {
      case TransactionDocumentType.notSet:
        return 0;
      case TransactionDocumentType.oldIdCard:
        return 1;
      case TransactionDocumentType.newIdCard:
        return 2;
      case TransactionDocumentType.passport:
        return 3;
      case TransactionDocumentType.oldDriverCard:
        return 4;
      case TransactionDocumentType.newDriverCard:
        return 5;
      case TransactionDocumentType.newIdCardNoNfc:
        return 6;
      case TransactionDocumentType.passportNoNfc:
        return 7;
      case TransactionDocumentType.oldWorkPermissionCard:
        return 8;
      case TransactionDocumentType.newWorkPermissionCard:
        return 9;
      case TransactionDocumentType.certificateOfResidence:
        return 10;
    }
  }
}

class TransactionDetail {
  final bool? isVerifiedFromKps;
  final bool? isLivenessVerifiedFromClient;
  final bool? isMLIControl;
  final bool? isGokkusagiControl;
  final bool? isOVIControl;
  final bool? isGuillocheControl;
  final bool? isBarcodeControl;
  final bool? isMRZControl;

  TransactionDetail({
    this.isVerifiedFromKps,
    this.isLivenessVerifiedFromClient,
    this.isMLIControl,
    this.isGokkusagiControl,
    this.isOVIControl,
    this.isGuillocheControl,
    this.isBarcodeControl,
    this.isMRZControl,
  });

  factory TransactionDetail.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return TransactionDetail(
      isVerifiedFromKps: safeJson?['isVerifiedFromKps'] as bool?,
      isLivenessVerifiedFromClient:
          safeJson?['isLivenessVerifiedFromClient'] as bool?,
      isMLIControl: safeJson?['isMLIControl'] as bool?,
      isGokkusagiControl: safeJson?['isGokkusagiControl'] as bool?,
      isOVIControl: safeJson?['isOVIControl'] as bool?,
      isGuillocheControl: safeJson?['isGuillocheControl'] as bool?,
      isBarcodeControl: safeJson?['isBarcodeControl'] as bool?,
      isMRZControl: safeJson?['isMRZControl'] as bool?,
    );
  }
}

class TransactionItem {
  final TransactionDocumentGroup documentGroup;
  final String? identityNo;
  final String? firstName;
  final String? lastName;
  final String? birthDate;
  final String? nationality;
  final String? gender;
  final String? mothersName;
  final String? fathersName;
  final String? documentNo;
  final String? issuedBy;
  final String? expiryDate;
  final String? mrz;

  TransactionItem({
    required this.documentGroup,
    this.identityNo,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.nationality,
    this.gender,
    this.mothersName,
    this.fathersName,
    this.documentNo,
    this.issuedBy,
    this.expiryDate,
    this.mrz,
  });

  factory TransactionItem.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    final documentGroup = safeJson?['documentGroup'] as int;

    final transactionDocumentGroup = TransactionDocumentGroup.values.firstWhere(
      (e) => e.value == documentGroup,
      orElse: () => TransactionDocumentGroup.notSet,
    );

    return TransactionItem(
      documentGroup: transactionDocumentGroup,
      identityNo: safeJson?['identityNo'] as String?,
      firstName: safeJson?['firstName'] as String?,
      lastName: safeJson?['lastName'] as String?,
      birthDate: safeJson?['lastName'] as String?,
      mothersName: safeJson?['mothersName'] as String?,
      nationality: safeJson?['nationality'] as String?,
      gender: safeJson?['gender'] as String?,
      fathersName: safeJson?['fathersName'] as String?,
      documentNo: safeJson?['documentNo'] as String?,
      issuedBy: safeJson?['issuedBy'] as String?,
      expiryDate: safeJson?['expiryDate'] as String?,
      mrz: safeJson?['mrz'] as String?,
    );
  }
}

enum TransactionDocumentGroup { notSet, ocr, nfc }

extension on TransactionDocumentGroup {
  int get value {
    switch (this) {
      case TransactionDocumentGroup.notSet:
        return 0;
      case TransactionDocumentGroup.ocr:
        return 1;
      case TransactionDocumentGroup.nfc:
        return 2;
      default:
        return 0;
    }
  }
}

class TransactionLog {
  final TransactionStep step;
  final TransactionStepStatus status;
  final String? createdAt;

  TransactionLog({
    required this.step,
    required this.status,
    this.createdAt,
  });

  factory TransactionLog.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    final step = safeJson?['step'] as int;
    final transactionStep = TransactionStep.values.firstWhere(
      (e) => e.value == step,
      orElse: () => TransactionStep.started,
    );

    final status = safeJson?['status'] as int;
    final transactionStepStatus = TransactionStepStatus.values.firstWhere(
      (e) => e.value == status,
      orElse: () => TransactionStepStatus.notSet,
    );

    return TransactionLog(
      step: transactionStep,
      status: transactionStepStatus,
      createdAt: safeJson?['createdAt'] as String?,
    );
  }
}

enum TransactionStep {
  started,
  frontCardDetection,
  backSideProcess,
  nfcProcess,
  livenessProcess,
  speechToTextValidationProcess,
  videoCallProcess,
  finish,
}

extension on TransactionStep {
  int get value {
    switch (this) {
      case TransactionStep.started:
        return 0;
      case TransactionStep.frontCardDetection:
        return 1;
      case TransactionStep.backSideProcess:
        return 2;
      case TransactionStep.nfcProcess:
        return 3;
      case TransactionStep.livenessProcess:
        return 5;
      case TransactionStep.speechToTextValidationProcess:
        return 6;
      case TransactionStep.videoCallProcess:
        return 7;
      case TransactionStep.finish:
        return 200;
    }
  }
}

enum TransactionStepStatus {
  notSet,
  inProgress,
  success,
  failure,
  timeOut,
  skipped,
}

extension on TransactionStepStatus {
  int get value {
    switch (this) {
      case TransactionStepStatus.notSet:
        return 0;
      case TransactionStepStatus.inProgress:
        return 1;
      case TransactionStepStatus.success:
        return 10;
      case TransactionStepStatus.failure:
        return 20;
      case TransactionStepStatus.timeOut:
        return 30;
      case TransactionStepStatus.skipped:
        return 40;
    }
  }
}

class TransactionScore {
  final TransactionImageValidation imageValidationType;
  final bool? approved;
  final num? score;

  TransactionScore({
    required this.imageValidationType,
    this.approved,
    this.score,
  });

  factory TransactionScore.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    final imageValidationType = safeJson?['imageValidationType'] as int;
    final transactionImageValidation =
        TransactionImageValidation.values.firstWhere(
      (e) => e.value == imageValidationType,
      orElse: () => TransactionImageValidation.notSet,
    );

    return TransactionScore(
      imageValidationType: transactionImageValidation,
      approved: safeJson?['approved'] as bool?,
      score: safeJson?['score'] as num?,
    );
  }
}

enum TransactionImageValidation {
  notSet,
  liveness,
  recognition,
  croppedRecognition,
}

extension on TransactionImageValidation {
  int get value {
    switch (this) {
      case TransactionImageValidation.notSet:
        return 0;
      case TransactionImageValidation.liveness:
        return 1;
      case TransactionImageValidation.recognition:
        return 2;
      case TransactionImageValidation.croppedRecognition:
        return 3;
    }
  }
}

class GetTransactionVerificationResultResponse {
  final bool activeLiveness;
  final bool bioRecognition;
  final bool isVerifiedFromKps;
  final bool passiveLiveness;

  GetTransactionVerificationResultResponse({
    required this.activeLiveness,
    required this.bioRecognition,
    required this.isVerifiedFromKps,
    required this.passiveLiveness,
  });

  factory GetTransactionVerificationResultResponse.fromJson(
      Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return GetTransactionVerificationResultResponse(
      activeLiveness: safeJson?['activeLiveness'] as bool,
      bioRecognition: safeJson?['bioRecognition'] as bool,
      isVerifiedFromKps: safeJson?['isVerifiedFromKps'] as bool,
      passiveLiveness: safeJson?['passiveLiveness'] as bool,
    );
  }
}

class CreatePdfResponse {
  final bool isSuccess;

  CreatePdfResponse({required this.isSuccess});

  factory CreatePdfResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return CreatePdfResponse(
      isSuccess: safeJson?['isSuccess'] as bool,
    );
  }
}

class CheckTransactionStatusResponse {
  final bool isTransaction;
  final String message;

  final CheckTransactionStatus status;

  CheckTransactionStatusResponse({
    required this.isTransaction,
    required this.message,
    required this.status,
  });

  factory CheckTransactionStatusResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    final status = safeJson?['status'] as int;
    final checkTransactionStatus = CheckTransactionStatus.values.firstWhere(
      (e) => e.value == status,
      orElse: () => CheckTransactionStatus.unSuccess,
    );

    return CheckTransactionStatusResponse(
      isTransaction: safeJson?['isTransaction'] as bool,
      message: safeJson?['message'] as String,
      status: checkTransactionStatus,
    );
  }
}

enum CheckTransactionStatus {
  unSuccess,
  inProgress,
  success,
}

extension on CheckTransactionStatus {
  int get value {
    switch (this) {
      case CheckTransactionStatus.unSuccess:
        return 3;
      case CheckTransactionStatus.inProgress:
        return 1;
      case CheckTransactionStatus.success:
        return 2;
    }
  }
}

class RunResponse {
  final CreateTransactionResponse? createTransactionResponse;
  final FrontCardDetectionResponse? frontCardDetectionResponse;
  final BackCardDetectionResponse? backCardDetectionResponse;
  final MrzReaderResponse? mrzReaderResponse;
  final NfcReaderResponse? nfcReaderResponse;
  final LivenessResponse? livenessResponse;
  final SpeechRecognitionResponse? speechRecognitionResponse;
  final VideoCallResponse? videoCallResponse;
  final bool? isTransactionFinished;
  final bool? isExited;
  final ResultPageResponse? resultPageResponse;

  RunResponse({
    this.createTransactionResponse,
    this.frontCardDetectionResponse,
    this.backCardDetectionResponse,
    this.mrzReaderResponse,
    this.nfcReaderResponse,
    this.livenessResponse,
    this.speechRecognitionResponse,
    this.videoCallResponse,
    this.isTransactionFinished,
    this.isExited,
    this.resultPageResponse,
  });

  factory RunResponse.fromJson(Map<Object?, Object?> json) {
    final safeJson = _safeMapFromJson(json);

    return RunResponse(
      createTransactionResponse: safeJson?['createTransactionResponse'] == null
          ? null
          : CreateTransactionResponse.fromJson(
              safeJson?['createTransactionResponse'] as Map<Object?, Object?>),
      frontCardDetectionResponse: safeJson?['frontCardDetectionResponse'] ==
              null
          ? null
          : FrontCardDetectionResponse.fromJson(
              safeJson?['frontCardDetectionResponse'] as Map<Object?, Object?>),
      backCardDetectionResponse: safeJson?['backCardDetectionResponse'] == null
          ? null
          : BackCardDetectionResponse.fromJson(
              safeJson?['backCardDetectionResponse'] as Map<Object?, Object?>),
      mrzReaderResponse: safeJson?['mrzReaderResponse'] == null
          ? null
          : MrzReaderResponse.fromJson(
              safeJson?['mrzReaderResponse'] as Map<Object?, Object?>),
      nfcReaderResponse: safeJson?['nfcReaderResponse'] == null
          ? null
          : NfcReaderResponse.fromJson(
              safeJson?['nfcReaderResponse'] as Map<Object?, Object?>),
      livenessResponse: safeJson?['livenessResponse'] == null
          ? null
          : LivenessResponse.fromJson(
              safeJson?['livenessResponse'] as Map<Object?, Object?>),
      speechRecognitionResponse: safeJson?['speechRecognitionResponse'] == null
          ? null
          : SpeechRecognitionResponse.fromJson(
              safeJson?['speechRecognitionResponse'] as Map<Object?, Object?>),
      videoCallResponse: safeJson?['videoCallResponse'] == null
          ? null
          : VideoCallResponse.fromJson(
              safeJson?['videoCallResponse'] as Map<Object?, Object?>),
      isTransactionFinished: safeJson?['isTransactionFinished'] as bool?,
      isExited: safeJson?['isExited'] as bool?,
      resultPageResponse: safeJson?['resultPageResponse'] == null
          ? null
          : ResultPageResponse.fromJson(
              safeJson?['resultPageResponse'] as Map<Object?, Object?>),
    );
  }
}

// JSON'dan Dart'a güvenli dönüşüm
Map<String, dynamic>? _safeMapFromJson(Map<Object?, Object?>? json) =>
    json?.map((key, value) => MapEntry(key.toString(), value));

// Dart'tan JSON'a güvenli dönüşüm
Map<Object?, Object?>? _safeMapToJson(Map<String, dynamic>? map) => map;
