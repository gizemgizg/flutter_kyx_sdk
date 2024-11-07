import 'package:json_annotation/json_annotation.dart';

part 'flutter_kyx_plugin_platform_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class RunData {
  final CreateTransactionData? createTransactionData;
  final FrontCardDetectionData? frontCardDetectionData;
  final BackCardDetectionData? backCardDetectionData;
  final MrzReaderData? mrzReaderData;
  final NfcReaderData? nfcReaderData;
  final LivenessData? livenessData;
  final SpeechRecognitionData? speechRecognitionData;
  final VideoCallData? videoCallData;
  final FinishTransactionData? finishTransactionData;
  final ResultPageData? resultPageData;
  final Language? language;

  RunData({
    this.createTransactionData,
    this.frontCardDetectionData,
    this.backCardDetectionData,
    this.mrzReaderData,
    this.nfcReaderData,
    this.livenessData,
    this.speechRecognitionData,
    this.videoCallData,
    this.finishTransactionData,
    this.resultPageData,
    this.language,
  });

  factory RunData.fromJson(Map<String, dynamic> json) =>
      _$RunDataFromJson(json);

  Map<String, dynamic> toJson() => _$RunDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FinishTransactionData {
  final Map<String, dynamic>? additionalHeaders;
  final bool isShowScreen;

  FinishTransactionData({
    this.additionalHeaders,
    required this.isShowScreen,
  });

  factory FinishTransactionData.fromJson(Map<String, dynamic> json) =>
      _$FinishTransactionDataFromJson(json);

  Map<String, dynamic> toJson() => _$FinishTransactionDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class InitData {
  final String baseUrl;
  final String organizationCode;
  final String email;
  final String password;
  final Map<String, dynamic>? additionalHeaders;

  InitData({
    required this.baseUrl,
    required this.organizationCode,
    required this.email,
    required this.password,
    this.additionalHeaders,
  });

  factory InitData.fromJson(Map<String, dynamic> json) =>
      _$InitDataFromJson(json);

  Map<String, dynamic> toJson() => _$InitDataToJson(this);
}

enum Language {
  @JsonValue('tr')
  Turkish,
  @JsonValue('en')
  English,
}

@JsonSerializable(explicitToJson: true)
class CreateTransactionData {
  final String? externalUserId;
  final Map<String, dynamic>? additionalHeaders;
  final Map<String, dynamic>? additionalParameters;
  final String transactionType;

  CreateTransactionData({
    this.externalUserId,
    this.additionalHeaders,
    this.additionalParameters,
    required this.transactionType,
  });

  factory CreateTransactionData.fromJson(Map<String, dynamic> json) =>
      _$CreateTransactionDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTransactionDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FrontCardDetectionData {
  final bool? isOldCardDetection;
  final num? detectionThreshold;
  final DesignConfig? designConfig;
  final DesignConfig? documentSelectionDesignConfig;
  final bool? isDocumentsSelection;

  FrontCardDetectionData({
    this.isOldCardDetection,
    this.detectionThreshold,
    this.designConfig,
    this.documentSelectionDesignConfig,
    this.isDocumentsSelection,
  });

  factory FrontCardDetectionData.fromJson(Map<String, dynamic> json) =>
      _$FrontCardDetectionDataFromJson(json);

  Map<String, dynamic> toJson() => _$FrontCardDetectionDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DesignConfig {
  final String? buttonText;
  final String? titleText;
  final String? explanationText;
  final bool? isTextToSpeech;

  DesignConfig(
      {this.buttonText,
      this.titleText,
      this.explanationText,
      this.isTextToSpeech});

  factory DesignConfig.fromJson(Map<String, dynamic> json) =>
      _$DesignConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DesignConfigToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NfcDesignConfig extends DesignConfig {
  final bool? isShowConfirmation;

  NfcDesignConfig({
    this.isShowConfirmation,
    super.buttonText,
    super.titleText,
    super.explanationText,
    super.isTextToSpeech,
  });

  factory NfcDesignConfig.fromJson(Map<String, dynamic> json) =>
      _$NfcDesignConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NfcDesignConfigToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BackCardDetectionData {
  final bool? isOldCardDetection;
  final num? detectionThreshold;
  final DesignConfig? designConfig;

  BackCardDetectionData({
    this.isOldCardDetection,
    this.detectionThreshold,
    this.designConfig,
  });

  factory BackCardDetectionData.fromJson(Map<String, dynamic> json) =>
      _$BackCardDetectionDataFromJson(json);

  Map<String, dynamic> toJson() => _$BackCardDetectionDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MrzReaderData {
  final num? detectionThreshold;
  final DesignConfig? designConfig;

  MrzReaderData({
    this.detectionThreshold,
    this.designConfig,
  });

  factory MrzReaderData.fromJson(Map<String, dynamic> json) =>
      _$MrzReaderDataFromJson(json);

  Map<String, dynamic> toJson() => _$MrzReaderDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NfcReaderData {
  final AndroidNfcCheckData? checkData;
  final String? mrz;
  final NfcDesignConfig? designConfig;

  NfcReaderData({
    this.checkData,
    this.mrz,
    this.designConfig,
  });

  factory NfcReaderData.fromJson(Map<String, dynamic> json) =>
      _$NfcReaderDataFromJson(json);

  Map<String, dynamic> toJson() => _$NfcReaderDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LivenessData {
  final DesignConfig? designConfig;

  LivenessData({
    this.designConfig,
  });

  factory LivenessData.fromJson(Map<String, dynamic> json) =>
      _$LivenessDataFromJson(json);

  Map<String, dynamic> toJson() => _$LivenessDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PdfConfig {
  final bool isShowPdf;
  final String? pdfUrl;
  final String? pdfAbsolutePath;

  PdfConfig({
    required this.isShowPdf,
    this.pdfUrl,
    this.pdfAbsolutePath,
  });

  factory PdfConfig.fromJson(Map<String, dynamic> json) =>
      _$PdfConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PdfConfigToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SpeechRecognitionData {
  final String speechText;
  final DesignConfig? designConfig;
  final PdfConfig? pdfConfig;

  SpeechRecognitionData({
    required this.speechText,
    this.designConfig,
    this.pdfConfig,
  });

  factory SpeechRecognitionData.fromJson(Map<String, dynamic> json) =>
      _$SpeechRecognitionDataFromJson(json);

  Map<String, dynamic> toJson() => _$SpeechRecognitionDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class VideoCallData {
  final DesignConfig? designConfig;

  VideoCallData({
    this.designConfig,
  });

  factory VideoCallData.fromJson(Map<String, dynamic> json) =>
      _$VideoCallDataFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCallDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ResultPageData {
  final DesignConfig? designConfig;

  ResultPageData({
    this.designConfig,
  });

  factory ResultPageData.fromJson(Map<String, dynamic> json) =>
      _$ResultPageDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResultPageDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AndroidNfcCheckData extends NfcCheckData {
  final String? expiryDate;
  final String? gender;

  AndroidNfcCheckData({
    this.expiryDate,
    this.gender,
    String? birthDate,
    String? documentNo,
    String? firstName,
    String? identityNo,
    String? lastName,
    String? nationality,
    String? placeOfBirth,
  }) : super(
          birthDate: birthDate,
          documentNo: documentNo,
          firstName: firstName,
          identityNo: identityNo,
          lastName: lastName,
          nationality: nationality,
          placeOfBirth: placeOfBirth,
        );

  factory AndroidNfcCheckData.fromJson(Map<String, dynamic> json) =>
      _$AndroidNfcCheckDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AndroidNfcCheckDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NfcCheckData {
  final String? birthDate;
  final String? documentNo;
  final String? firstName;
  final String? identityNo;
  final String? lastName;
  final String? nationality;
  final String? placeOfBirth;

  NfcCheckData({
    this.birthDate,
    this.documentNo,
    this.firstName,
    this.identityNo,
    this.lastName,
    this.nationality,
    this.placeOfBirth,
  });

  factory NfcCheckData.fromJson(Map<String, dynamic> json) =>
      _$NfcCheckDataFromJson(json);

  Map<String, dynamic> toJson() => _$NfcCheckDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IosRunData {
  final String transactionType;
  final MrzData? mrzData;
  final NfcCheckData? checkData;
  final Language? language;
  final String? speechText;
  final bool? isShowResultPage;
  final bool? isTextToSpeechEnabled;

  IosRunData({
    required this.transactionType,
    this.mrzData,
    this.checkData,
    this.language,
    this.speechText,
    this.isShowResultPage,
    this.isTextToSpeechEnabled,
  });

  factory IosRunData.fromJson(Map<String, dynamic> json) =>
      _$IosRunDataFromJson(json);

  Map<String, dynamic> toJson() => _$IosRunDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MrzData {
  final String documentNo;
  final String birthDate;
  final String expiryDate;

  MrzData({
    required this.documentNo,
    required this.birthDate,
    required this.expiryDate,
  });

  factory MrzData.fromJson(Map<String, dynamic> json) =>
      _$MrzDataFromJson(json);

  Map<String, dynamic> toJson() => _$MrzDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTransactionDetailData {
  final String transactionGuid;

  GetTransactionDetailData({required this.transactionGuid});

  factory GetTransactionDetailData.fromJson(Map<String, dynamic> json) =>
      _$GetTransactionDetailDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetTransactionDetailDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTransactionVerificationResultData {
  final String transactionGuid;

  GetTransactionVerificationResultData({
    required this.transactionGuid,
  });

  factory GetTransactionVerificationResultData.fromJson(
          Map<String, dynamic> json) =>
      _$GetTransactionVerificationResultDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetTransactionVerificationResultDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreatePdfData {
  final String transactionGuid;

  CreatePdfData({
    required this.transactionGuid,
  });

  factory CreatePdfData.fromJson(Map<String, dynamic> json) =>
      _$CreatePdfDataFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePdfDataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckTransactionStatusData {
  final String? identityNumber;
  final String? transactionGuid;

  CheckTransactionStatusData({
    this.identityNumber,
    this.transactionGuid,
  });

  factory CheckTransactionStatusData.fromJson(Map<String, dynamic> json) =>
      _$CheckTransactionStatusDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckTransactionStatusDataToJson(this);
}
