import Flutter
import UIKit
import KYX

public class FlutterKyxPlugin: NSObject, FlutterPlugin {

    var kyx: KnowYourX!
    var transactionsList: [KYXTransactionModel]?
    var selectedTransaction: KYXTransactionModel?
    var channel: FlutterMethodChannel

    let rootView = UIApplication.shared.delegate?.window??.rootViewController

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_kyx_plugin", binaryMessenger: registrar.messenger())
        let instance = FlutterKyxPlugin(channel: channel)
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    init(channel: FlutterMethodChannel) {
        self.channel = channel
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        DispatchQueue.main.async {
            if let args = call.arguments as? [String: Any] {
                switch (call.method) {
                case "init":
                    self.initialize(args)
                    break;
                case "run":
                    self.run(args)
                    break;
                case "checkTransactionStatus":
                    self.checkTransactionStatus(args)
                    break;
                case "getTransactionDetail":
                    self.getTransactionDetail(args)
                    break;
                case "createPdf":
                    self.createPdf(args)
                    break;
                case "getTransactionVerificationResult":
                    self.getTransactionVerificationResult(args)
                    break;
                default:
                    result(FlutterMethodNotImplemented)
                }
            }
        }
    }

    func createKyxAccount(_ args: [String: Any]) -> KYXAccount {
        let organizationCode = args["organizationCode"] as? String
        let email = args["email"] as? String
        let password = args["password"] as? String
        let baseUrl = args["baseUrl"] as? String
        let headers = args["additionalHeaders"] as? [String: String]

        return KYXAccount(baseUrl: baseUrl!, email: email!, password: password!, organizationCode: organizationCode!, customHeaders: headers ?? [:])
    }

    @objc func initialize(_ options: [String: Any]) {
        DispatchQueue.main.async {
            let kyxAccount = self.createKyxAccount(options)

            let kyxSettings = KYXSettings(viewConfiguration: .init(viewSetting: .withView), account: kyxAccount)

            self.kyx = KnowYourX(delegate: self,
                    settings: kyxSettings
            )
        }
    }

    @objc func run(_ options: [String: Any]) {
        DispatchQueue.main.async {
            if (self.kyx != nil) {
                let transactionType = options["transactionType"] as? String? ?? "default"
                let mrzData = options["mrzData"] as? [String: String]

                var nfcData: KYXNFCData? = nil
                let verifyData = options["checkData"] as? [String: String]

                if (mrzData != nil) {
                    let documentNumber = mrzData?["documentNo"] as? String?
                    let birthDate = mrzData?["birthDate"] as? String?
                    let expiryDate = mrzData?["expiryDate"] as? String?

                    if (documentNumber != nil && birthDate != nil && expiryDate != nil) {
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

                        if let birth = dateFormatter.date(from: birthDate!!),
                           let expiry = dateFormatter.date(from: expiryDate!!) {
                            nfcData = KYXNFCData(documentNumber: documentNumber!!, birthDate: birth, expiryDate: expiry)
                        }
                    }
                }

                let birthDate = verifyData?["birthDate"] ?? nil

                var dateString: String? = nil

                if (birthDate != nil) {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd"

                    if let birth = dateFormatter.date(from: birthDate!) {
                        dateFormatter.dateFormat = "yyMMdd"
                        dateString = dateFormatter.string(from: birth)
                    }
                }
                
                let language = options["language"] as? String

                let kyxLanguage = (language != nil) && language == "en" ? KYXLanguage.english : KYXLanguage.turkish
                
                let speechMessageText = options["speechText"] as? String ?? "Bu bir test metnidir. Sondaki kelimeyi okuduğunuzda işlem tamamlanacaktır. Onaylıyorum."
                let isShowResultPage = options["isShowResultPage"] as? Bool ?? false
                let isTextToSpeechEnabled = options["isTextToSpeechEnabled"] as? Bool ?? false

                self.kyx.run(
                        transactionType: transactionType!,
                        nfcData: nfcData,
                        verifyData: KYXVerifyData(
                                identityNumber: verifyData?["identityNo"] ?? nil,
                                birthDate: dateString,
                                serialNumber: verifyData?["documentNo"] ?? nil,
                                firstName: verifyData?["firstName"] ?? nil,
                                lastName: verifyData?["lastName"] ?? nil,
                                nationality: verifyData?["nationality"] ?? nil,
                                placeOfBirth: verifyData?["placeOfBirth"] ?? nil
                        ),
                        language: kyxLanguage,
                        speechMessageText: speechMessageText, isShowResultPage: isShowResultPage,
                        isTextToSpeechEnabled: isTextToSpeechEnabled
                )
            }
        }
    }

    @objc func checkTransactionStatus(_ options: [String: Any]) {
        DispatchQueue.main.async {
            if (self.kyx != nil) {
                let identityNo = options["identityNumber"] as? String
                let transactionGuid = options["transactionGuid"] as? String

                self.kyx.checkTransactionStatus(identityNo: identityNo, transactionGuid: transactionGuid)
            }
        }
    }

    @objc func getTransactionDetail(_ options: [String: Any]) {
        DispatchQueue.main.async {
            if (self.kyx != nil) {
                let transactionGuid = options["transactionGuid"] as? String

                self.kyx.detailMobile(transactionGuid: transactionGuid!)
            }
        }
    }

    @objc func createPdf(_ options: [String: Any]) {
        DispatchQueue.main.async {
            if (self.kyx != nil) {
                let transactionGuid = options["transactionGuid"] as? String

                self.kyx.exportPdf(transactionGuid: transactionGuid!)
            }
        }
    }

    @objc func getTransactionVerificationResult(_ options: [String: Any]) {
        DispatchQueue.main.async {
            if (self.kyx != nil) {
                let transactionGuid = options["transactionGuid"] as? String

                self.kyx.getVerificationResult(transactionGuid: transactionGuid!)
            }
        }
    }

    func sendEvent(withName name: String, withResult result: [String: Any]) {
        DispatchQueue.main.async {
            self.channel.invokeMethod(name, arguments: result)
        }
    }
}

extension FlutterKyxPlugin: KnowYourXDelegate {
    public func authenticated() {
        print("authenticated")
    }

    public func onSuccess() {
        print("onSuccess")
    }

    public func onFinished() {
        print("onFinished")
    }

    public func onSetupFinished() {
        print("onSetupFinished")
    }

    public func onRequestForNewTransaction() {
        print("onRequestForNewTransaction")
    }

    public func onStepChanged() {
        print("onStepChanged")
    }

    public func onStepFailure() {
        print("onStepFailure")
    }

    public func onStepSuccess() {
        print("onStepSuccess")
    }

    public func onBypassRequest() {
        print("onBypassRequest")
    }

    public func onParametersExecuted() {
        print("onParametersExecuted")
    }

    public func onTransactionsTypes(transactionTypes: [KYXTransactionModel]) {
        let transactionTypeNames: [String] = transactionTypes.map {
            $0.name
        }
        let output = [
            "transactionTypes": transactionTypeNames
        ] as [String: Any]
        sendEvent(withName: "onInit", withResult: output)
    }

    public func output(_ kyxOutput: KnowYourXOutputs) {
        switch kyxOutput {
        case .success:
            print("successss")
        case .failure(let error):
            print("faiilureee")
            let output = [
                "message": error,
            ] as [String: Any]
            sendEvent(withName: "onError", withResult: output)
        case .error:
            print("errrorrr")
        case .finishProcess(let result):
            var res = result.toDictionary()
            
            res.removeValue(forKey: "speechToTextResult")
            
            if(res["nfcResult"] != nil){
                var nfcResult = res["nfcResult"] as! [String: Any]
                
                nfcResult.removeValue(forKey: "documentType")
                
                res["nfcResult"] = nfcResult
            }
            
            res["isExited"] = res["isExit"]
            
            sendEvent(withName: "onFinish", withResult: res)
        case .tryAgain(let result):
            print("tryAgain", result)
            sendEvent(withName: "onTryAgain", withResult: result.toDictionary())
        case .detailMobileResult(let result):
            sendEvent(withName: "onTransactionDetail", withResult: (result.data?.toDictionary())!)
        case .checkTransactionStatusResult(let result):
            sendEvent(withName: "onCheckTransactionStatus", withResult: (result.data?.toDictionary())!)
        case .exportPdfResult(let result):
            let output = [
                "isSuccess": result.succeeded,
            ] as [String: Any]
            sendEvent(withName: "onCreatePdf", withResult: output)
        case .onVerificationResult(let result):
            sendEvent(withName: "onTransactionVerificationResult", withResult: result.toDictionary())
        @unknown default:
            print("")
        }
    }
}
