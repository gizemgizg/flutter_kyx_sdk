// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_kyx_plugin_platform_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RunData _$RunDataFromJson(Map<String, dynamic> json) => RunData(
      createTransactionData: json['createTransactionData'] == null
          ? null
          : CreateTransactionData.fromJson(
              json['createTransactionData'] as Map<String, dynamic>),
      frontCardDetectionData: json['frontCardDetectionData'] == null
          ? null
          : FrontCardDetectionData.fromJson(
              json['frontCardDetectionData'] as Map<String, dynamic>),
      backCardDetectionData: json['backCardDetectionData'] == null
          ? null
          : BackCardDetectionData.fromJson(
              json['backCardDetectionData'] as Map<String, dynamic>),
      mrzReaderData: json['mrzReaderData'] == null
          ? null
          : MrzReaderData.fromJson(
              json['mrzReaderData'] as Map<String, dynamic>),
      nfcReaderData: json['nfcReaderData'] == null
          ? null
          : NfcReaderData.fromJson(
              json['nfcReaderData'] as Map<String, dynamic>),
      livenessData: json['livenessData'] == null
          ? null
          : LivenessData.fromJson(json['livenessData'] as Map<String, dynamic>),
      speechRecognitionData: json['speechRecognitionData'] == null
          ? null
          : SpeechRecognitionData.fromJson(
              json['speechRecognitionData'] as Map<String, dynamic>),
      videoCallData: json['videoCallData'] == null
          ? null
          : VideoCallData.fromJson(
              json['videoCallData'] as Map<String, dynamic>),
      finishTransactionData: json['finishTransactionData'] == null
          ? null
          : FinishTransactionData.fromJson(
              json['finishTransactionData'] as Map<String, dynamic>),
      resultPageData: json['resultPageData'] == null
          ? null
          : ResultPageData.fromJson(
              json['resultPageData'] as Map<String, dynamic>),
      language: $enumDecodeNullable(_$LanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$RunDataToJson(RunData instance) => <String, dynamic>{
      'createTransactionData': instance.createTransactionData?.toJson(),
      'frontCardDetectionData': instance.frontCardDetectionData?.toJson(),
      'backCardDetectionData': instance.backCardDetectionData?.toJson(),
      'mrzReaderData': instance.mrzReaderData?.toJson(),
      'nfcReaderData': instance.nfcReaderData?.toJson(),
      'livenessData': instance.livenessData?.toJson(),
      'speechRecognitionData': instance.speechRecognitionData?.toJson(),
      'videoCallData': instance.videoCallData?.toJson(),
      'finishTransactionData': instance.finishTransactionData?.toJson(),
      'resultPageData': instance.resultPageData?.toJson(),
      'language': _$LanguageEnumMap[instance.language],
    };

const _$LanguageEnumMap = {
  Language.Turkish: 'tr',
  Language.English: 'en',
};

FinishTransactionData _$FinishTransactionDataFromJson(
        Map<String, dynamic> json) =>
    FinishTransactionData(
      additionalHeaders: json['additionalHeaders'] as Map<String, dynamic>?,
      isShowScreen: json['isShowScreen'] as bool,
    );

Map<String, dynamic> _$FinishTransactionDataToJson(
        FinishTransactionData instance) =>
    <String, dynamic>{
      'additionalHeaders': instance.additionalHeaders,
      'isShowScreen': instance.isShowScreen,
    };

InitData _$InitDataFromJson(Map<String, dynamic> json) => InitData(
      baseUrl: json['baseUrl'] as String,
      organizationCode: json['organizationCode'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      additionalHeaders: json['additionalHeaders'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$InitDataToJson(InitData instance) => <String, dynamic>{
      'baseUrl': instance.baseUrl,
      'organizationCode': instance.organizationCode,
      'email': instance.email,
      'password': instance.password,
      'additionalHeaders': instance.additionalHeaders,
    };

CreateTransactionData _$CreateTransactionDataFromJson(
        Map<String, dynamic> json) =>
    CreateTransactionData(
      externalUserId: json['externalUserId'] as String?,
      additionalHeaders: json['additionalHeaders'] as Map<String, dynamic>?,
      additionalParameters:
          json['additionalParameters'] as Map<String, dynamic>?,
      transactionType: json['transactionType'] as String,
    );

Map<String, dynamic> _$CreateTransactionDataToJson(
        CreateTransactionData instance) =>
    <String, dynamic>{
      'externalUserId': instance.externalUserId,
      'additionalHeaders': instance.additionalHeaders,
      'additionalParameters': instance.additionalParameters,
      'transactionType': instance.transactionType,
    };

FrontCardDetectionData _$FrontCardDetectionDataFromJson(
        Map<String, dynamic> json) =>
    FrontCardDetectionData(
      isOldCardDetection: json['isOldCardDetection'] as bool?,
      detectionThreshold: json['detectionThreshold'] as num?,
      designConfig: json['designConfig'] == null
          ? null
          : DesignConfig.fromJson(json['designConfig'] as Map<String, dynamic>),
      documentSelectionDesignConfig: json['documentSelectionDesignConfig'] ==
              null
          ? null
          : DesignConfig.fromJson(
              json['documentSelectionDesignConfig'] as Map<String, dynamic>),
      isDocumentsSelection: json['isDocumentsSelection'] as bool?,
    );

Map<String, dynamic> _$FrontCardDetectionDataToJson(
        FrontCardDetectionData instance) =>
    <String, dynamic>{
      'isOldCardDetection': instance.isOldCardDetection,
      'detectionThreshold': instance.detectionThreshold,
      'designConfig': instance.designConfig?.toJson(),
      'documentSelectionDesignConfig':
          instance.documentSelectionDesignConfig?.toJson(),
      'isDocumentsSelection': instance.isDocumentsSelection,
    };

DesignConfig _$DesignConfigFromJson(Map<String, dynamic> json) => DesignConfig(
      buttonText: json['buttonText'] as String?,
      titleText: json['titleText'] as String?,
      explanationText: json['explanationText'] as String?,
      isTextToSpeech: json['isTextToSpeech'] as bool?,
    );

Map<String, dynamic> _$DesignConfigToJson(DesignConfig instance) =>
    <String, dynamic>{
      'buttonText': instance.buttonText,
      'titleText': instance.titleText,
      'explanationText': instance.explanationText,
      'isTextToSpeech': instance.isTextToSpeech,
    };

NfcDesignConfig _$NfcDesignConfigFromJson(Map<String, dynamic> json) =>
    NfcDesignConfig(
      isShowConfirmation: json['isShowConfirmation'] as bool?,
      buttonText: json['buttonText'] as String?,
      titleText: json['titleText'] as String?,
      explanationText: json['explanationText'] as String?,
      isTextToSpeech: json['isTextToSpeech'] as bool?,
    );

Map<String, dynamic> _$NfcDesignConfigToJson(NfcDesignConfig instance) =>
    <String, dynamic>{
      'buttonText': instance.buttonText,
      'titleText': instance.titleText,
      'explanationText': instance.explanationText,
      'isTextToSpeech': instance.isTextToSpeech,
      'isShowConfirmation': instance.isShowConfirmation,
    };

BackCardDetectionData _$BackCardDetectionDataFromJson(
        Map<String, dynamic> json) =>
    BackCardDetectionData(
      isOldCardDetection: json['isOldCardDetection'] as bool?,
      detectionThreshold: json['detectionThreshold'] as num?,
      designConfig: json['designConfig'] == null
          ? null
          : DesignConfig.fromJson(json['designConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BackCardDetectionDataToJson(
        BackCardDetectionData instance) =>
    <String, dynamic>{
      'isOldCardDetection': instance.isOldCardDetection,
      'detectionThreshold': instance.detectionThreshold,
      'designConfig': instance.designConfig?.toJson(),
    };

MrzReaderData _$MrzReaderDataFromJson(Map<String, dynamic> json) =>
    MrzReaderData(
      detectionThreshold: json['detectionThreshold'] as num?,
      designConfig: json['designConfig'] == null
          ? null
          : DesignConfig.fromJson(json['designConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MrzReaderDataToJson(MrzReaderData instance) =>
    <String, dynamic>{
      'detectionThreshold': instance.detectionThreshold,
      'designConfig': instance.designConfig?.toJson(),
    };

NfcReaderData _$NfcReaderDataFromJson(Map<String, dynamic> json) =>
    NfcReaderData(
      checkData: json['checkData'] == null
          ? null
          : AndroidNfcCheckData.fromJson(
              json['checkData'] as Map<String, dynamic>),
      mrz: json['mrz'] as String?,
      designConfig: json['designConfig'] == null
          ? null
          : NfcDesignConfig.fromJson(
              json['designConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NfcReaderDataToJson(NfcReaderData instance) =>
    <String, dynamic>{
      'checkData': instance.checkData?.toJson(),
      'mrz': instance.mrz,
      'designConfig': instance.designConfig?.toJson(),
    };

LivenessData _$LivenessDataFromJson(Map<String, dynamic> json) => LivenessData(
      designConfig: json['designConfig'] == null
          ? null
          : DesignConfig.fromJson(json['designConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LivenessDataToJson(LivenessData instance) =>
    <String, dynamic>{
      'designConfig': instance.designConfig?.toJson(),
    };

PdfConfig _$PdfConfigFromJson(Map<String, dynamic> json) => PdfConfig(
      isShowPdf: json['isShowPdf'] as bool,
      pdfUrl: json['pdfUrl'] as String?,
      pdfAbsolutePath: json['pdfAbsolutePath'] as String?,
    );

Map<String, dynamic> _$PdfConfigToJson(PdfConfig instance) => <String, dynamic>{
      'isShowPdf': instance.isShowPdf,
      'pdfUrl': instance.pdfUrl,
      'pdfAbsolutePath': instance.pdfAbsolutePath,
    };

SpeechRecognitionData _$SpeechRecognitionDataFromJson(
        Map<String, dynamic> json) =>
    SpeechRecognitionData(
      speechText: json['speechText'] as String,
      designConfig: json['designConfig'] == null
          ? null
          : DesignConfig.fromJson(json['designConfig'] as Map<String, dynamic>),
      pdfConfig: json['pdfConfig'] == null
          ? null
          : PdfConfig.fromJson(json['pdfConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeechRecognitionDataToJson(
        SpeechRecognitionData instance) =>
    <String, dynamic>{
      'speechText': instance.speechText,
      'designConfig': instance.designConfig?.toJson(),
      'pdfConfig': instance.pdfConfig?.toJson(),
    };

VideoCallData _$VideoCallDataFromJson(Map<String, dynamic> json) =>
    VideoCallData(
      designConfig: json['designConfig'] == null
          ? null
          : DesignConfig.fromJson(json['designConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoCallDataToJson(VideoCallData instance) =>
    <String, dynamic>{
      'designConfig': instance.designConfig?.toJson(),
    };

ResultPageData _$ResultPageDataFromJson(Map<String, dynamic> json) =>
    ResultPageData(
      designConfig: json['designConfig'] == null
          ? null
          : DesignConfig.fromJson(json['designConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultPageDataToJson(ResultPageData instance) =>
    <String, dynamic>{
      'designConfig': instance.designConfig?.toJson(),
    };

AndroidNfcCheckData _$AndroidNfcCheckDataFromJson(Map<String, dynamic> json) =>
    AndroidNfcCheckData(
      expiryDate: json['expiryDate'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birthDate'] as String?,
      documentNo: json['documentNo'] as String?,
      firstName: json['firstName'] as String?,
      identityNo: json['identityNo'] as String?,
      lastName: json['lastName'] as String?,
      nationality: json['nationality'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
    );

Map<String, dynamic> _$AndroidNfcCheckDataToJson(
        AndroidNfcCheckData instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate,
      'documentNo': instance.documentNo,
      'firstName': instance.firstName,
      'identityNo': instance.identityNo,
      'lastName': instance.lastName,
      'nationality': instance.nationality,
      'placeOfBirth': instance.placeOfBirth,
      'expiryDate': instance.expiryDate,
      'gender': instance.gender,
    };

NfcCheckData _$NfcCheckDataFromJson(Map<String, dynamic> json) => NfcCheckData(
      birthDate: json['birthDate'] as String?,
      documentNo: json['documentNo'] as String?,
      firstName: json['firstName'] as String?,
      identityNo: json['identityNo'] as String?,
      lastName: json['lastName'] as String?,
      nationality: json['nationality'] as String?,
      placeOfBirth: json['placeOfBirth'] as String?,
    );

Map<String, dynamic> _$NfcCheckDataToJson(NfcCheckData instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate,
      'documentNo': instance.documentNo,
      'firstName': instance.firstName,
      'identityNo': instance.identityNo,
      'lastName': instance.lastName,
      'nationality': instance.nationality,
      'placeOfBirth': instance.placeOfBirth,
    };

IosRunData _$IosRunDataFromJson(Map<String, dynamic> json) => IosRunData(
      transactionType: json['transactionType'] as String,
      mrzData: json['mrzData'] == null
          ? null
          : MrzData.fromJson(json['mrzData'] as Map<String, dynamic>),
      checkData: json['checkData'] == null
          ? null
          : NfcCheckData.fromJson(json['checkData'] as Map<String, dynamic>),
      language: $enumDecodeNullable(_$LanguageEnumMap, json['language']),
      speechText: json['speechText'] as String?,
      isShowResultPage: json['isShowResultPage'] as bool?,
      isTextToSpeechEnabled: json['isTextToSpeechEnabled'] as bool?,
    );

Map<String, dynamic> _$IosRunDataToJson(IosRunData instance) =>
    <String, dynamic>{
      'transactionType': instance.transactionType,
      'mrzData': instance.mrzData?.toJson(),
      'checkData': instance.checkData?.toJson(),
      'language': _$LanguageEnumMap[instance.language],
      'speechText': instance.speechText,
      'isShowResultPage': instance.isShowResultPage,
      'isTextToSpeechEnabled': instance.isTextToSpeechEnabled,
    };

MrzData _$MrzDataFromJson(Map<String, dynamic> json) => MrzData(
      documentNo: json['documentNo'] as String,
      birthDate: json['birthDate'] as String,
      expiryDate: json['expiryDate'] as String,
    );

Map<String, dynamic> _$MrzDataToJson(MrzData instance) => <String, dynamic>{
      'documentNo': instance.documentNo,
      'birthDate': instance.birthDate,
      'expiryDate': instance.expiryDate,
    };

GetTransactionDetailData _$GetTransactionDetailDataFromJson(
        Map<String, dynamic> json) =>
    GetTransactionDetailData(
      transactionGuid: json['transactionGuid'] as String,
    );

Map<String, dynamic> _$GetTransactionDetailDataToJson(
        GetTransactionDetailData instance) =>
    <String, dynamic>{
      'transactionGuid': instance.transactionGuid,
    };

GetTransactionVerificationResultData
    _$GetTransactionVerificationResultDataFromJson(Map<String, dynamic> json) =>
        GetTransactionVerificationResultData(
          transactionGuid: json['transactionGuid'] as String,
        );

Map<String, dynamic> _$GetTransactionVerificationResultDataToJson(
        GetTransactionVerificationResultData instance) =>
    <String, dynamic>{
      'transactionGuid': instance.transactionGuid,
    };

CreatePdfData _$CreatePdfDataFromJson(Map<String, dynamic> json) =>
    CreatePdfData(
      transactionGuid: json['transactionGuid'] as String,
    );

Map<String, dynamic> _$CreatePdfDataToJson(CreatePdfData instance) =>
    <String, dynamic>{
      'transactionGuid': instance.transactionGuid,
    };

CheckTransactionStatusData _$CheckTransactionStatusDataFromJson(
        Map<String, dynamic> json) =>
    CheckTransactionStatusData(
      identityNumber: json['identityNumber'] as String?,
      transactionGuid: json['transactionGuid'] as String?,
    );

Map<String, dynamic> _$CheckTransactionStatusDataToJson(
        CheckTransactionStatusData instance) =>
    <String, dynamic>{
      'identityNumber': instance.identityNumber,
      'transactionGuid': instance.transactionGuid,
    };
