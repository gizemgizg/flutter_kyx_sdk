package io.knowyourx.flutter

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import com.kyx.kyx_sdk.domain.model.transaction.GetTransactionDetailResponse
import com.kyx.kyx_sdk.domain.model.transaction.TransactionStep
import com.kyx.kyx_sdk.domain.model.transaction.WorkingHours
import com.kyx.kyxsdkapp.KYX
import com.kyx.kyxsdkapp.common.model.CheckTransactionStatusData
import com.kyx.kyxsdkapp.common.model.CheckTransactionStatusListener
import com.kyx.kyxsdkapp.common.model.CheckTransactionStatusResponse
import com.kyx.kyxsdkapp.common.model.CreatePdfData
import com.kyx.kyxsdkapp.common.model.CreatePdfListener
import com.kyx.kyxsdkapp.common.model.CreatePdfResponse
import com.kyx.kyxsdkapp.common.model.GetTransactionDetailData
import com.kyx.kyxsdkapp.common.model.GetTransactionDetailListener
import com.kyx.kyxsdkapp.common.model.GetTransactionTypesListener
import com.kyx.kyxsdkapp.common.model.GetTransactionTypesResponse
import com.kyx.kyxsdkapp.common.model.GetTransactionVerificationResultData
import com.kyx.kyxsdkapp.common.model.GetTransactionVerificationResultListener
import com.kyx.kyxsdkapp.common.model.GetTransactionVerificationResultResponse
import com.kyx.kyxsdkapp.common.model.InitData
import com.kyx.kyxsdkapp.common.model.InitListener
import com.kyx.kyxsdkapp.common.model.RunData
import com.kyx.kyxsdkapp.common.model.RunListener
import com.kyx.kyxsdkapp.common.model.RunResponse
import com.kyx.kyxsdkapp.common.model.Step
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.knowyourx.flutter.util.JsonToMap
import io.knowyourx.flutter.util.convertJsonToObject
import io.knowyourx.flutter.util.serializeToMap
import org.json.JSONObject

/** FlutterKyxPlugin */
class FlutterKyxPlugin() : FlutterPlugin, MethodCallHandler, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity

    private lateinit var kyx: KYX

    private var jsonToMap: JsonToMap = JsonToMap()

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_kyx_plugin")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
//        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivity() {
//        TODO("Not yet implemented")
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val arguments = call.arguments as? Map<String, Any> ?: return result.error(
            "400", "Bad Request", ""
        )

        /*val token: String? = arguments["token"] as String?
        val transactionId: String? = arguments["transactionId"] as String?

        val headers: HashMap<String, String>? =
            arguments["headers"] as HashMap<String, String>?

        val designConfig: HashMap<String, String> =
            arguments["designConfig"] as HashMap<String, String>? ?: HashMap()

        var kyxViewModelConfig = KyxViewModelConfig();

        headers?.let {
            kyxViewModelConfig = KyxViewModelConfig(
                interceptor = KyxInterceptor(
                    headers = it
                )
            )
        }*/

        try {
            when (call.method) {
                "init" -> {
                    val baseUrl = arguments["baseUrl"] as String

                    val dataJsonObject = jsonToMap.convertMapToJson(arguments)
                    val data =
                        convertJsonToObject<InitData>(dataJsonObject)

                    kyx = KYX(
                        activity = activity,
                        baseUrl = baseUrl
                    )

                    kyx.init(data, object : InitListener {
                        override fun onFail(exception: Exception) {
                            result.error(
                                "",
                                exception.message ?: "",
                                ""
                            )
                        }

                        override fun onSuccess() {
                            result.success(true)
                        }
                    })
                }

                "run" -> {
                    val dataJsonObject = jsonToMap.convertMapToJson(arguments)
                    val data =
                        convertJsonToObject<RunData>(dataJsonObject)

                    kyx.run(data, object : RunListener {
                        override fun onFail(step: TransactionStep?, exception: Exception) {
                            result.error(
                                "",
                                exception.message ?: "",
                                ""
                            )
                        }

                        override fun onNotWorkingHours(workingHours: WorkingHours) {

                        }

                        override fun onStepFinished(step: Step, runResponse: RunResponse) {
                            kyx.resume()
                        }

                        override fun onSuccess(runResponse: RunResponse) {
                            val modelMap = runResponse.serializeToMap()

                            val returnMap: Map<String, Any> =
                                jsonToMap.convertJsonToMap(JSONObject(modelMap))

                            result.success(returnMap)
                        }

                    })
                }

                "createPdf" -> {
                    val dataJsonObject = jsonToMap.convertMapToJson(arguments)
                    val data =
                        convertJsonToObject<CreatePdfData>(dataJsonObject)

                    kyx.createPdf(data, object : CreatePdfListener {
                        override fun onFail(exception: Exception) {
                            result.error(
                                "",
                                exception.message ?: "",
                                ""
                            )
                        }

                        override fun onSuccess(createPdfResponse: CreatePdfResponse) {
                            val modelMap = createPdfResponse.serializeToMap()

                            val returnMap: Map<String, Any> =
                                jsonToMap.convertJsonToMap(JSONObject(modelMap))

                            result.success(returnMap)
                        }

                    })
                }

                "checkTransactionStatus" -> {
                    val dataJsonObject =
                        jsonToMap.convertMapToJson(arguments)
                    val data =
                        convertJsonToObject<CheckTransactionStatusData>(
                            dataJsonObject
                        )

                    kyx.checkTransactionStatus(
                        data,
                        object : CheckTransactionStatusListener {
                            override fun onFail(exception: Exception) {
                                result.error(
                                    "",
                                    exception.message ?: "",
                                    ""
                                )
                            }

                            override fun onSuccess(checkTransactionStatusResponse: CheckTransactionStatusResponse) {
                                val modelMap = checkTransactionStatusResponse.serializeToMap()

                                val returnMap: Map<String, Any> =
                                    jsonToMap.convertJsonToMap(JSONObject(modelMap))

                                result.success(returnMap)
                            }

                        })
                }

                "getTransactionDetail" -> {
                    val dataJsonObject =
                        jsonToMap.convertMapToJson(arguments)
                    val data =
                        convertJsonToObject<GetTransactionDetailData>(
                            dataJsonObject
                        )

                    kyx.getTransactionDetail(
                        data,
                        object : GetTransactionDetailListener {
                            override fun onFail(exception: Exception) {
                                result.error(
                                    "",
                                    exception.message ?: "",
                                    ""
                                )
                            }

                            override fun onSuccess(getTransactionDetailResponse: GetTransactionDetailResponse) {
                                val modelMap = getTransactionDetailResponse.serializeToMap()

                                val returnMap: Map<String, Any> =
                                    jsonToMap.convertJsonToMap(JSONObject(modelMap))

                                result.success(returnMap)
                            }
                        })
                }

                "getTransactionVerificationResult" -> {
                    val dataJsonObject =
                        jsonToMap.convertMapToJson(arguments)
                    val data =
                        convertJsonToObject<GetTransactionVerificationResultData>(
                            dataJsonObject
                        )

                    kyx.getTransactionVerificationResult(
                        data,
                        object : GetTransactionVerificationResultListener {
                            override fun onFail(exception: Exception) {
                                result.error(
                                    "",
                                    exception.message ?: "",
                                    ""
                                )
                            }

                            override fun onSuccess(getTransactionVerificationResultResponse: GetTransactionVerificationResultResponse) {
                                val modelMap =
                                    getTransactionVerificationResultResponse.serializeToMap()

                                val returnMap: Map<String, Any> =
                                    jsonToMap.convertJsonToMap(JSONObject(modelMap))

                                result.success(returnMap)
                            }
                        })
                }

                "getTransactionTypes" -> {
                    val dataJsonObject =
                        jsonToMap.convertMapToJson(arguments)

                    kyx.getTransactionTypes(
                        object : GetTransactionTypesListener {
                            override fun onFail(exception: Exception) {
                                result.error(
                                    "",
                                    exception.message ?: "",
                                    ""
                                )
                            }

                            override fun onSuccess(getTransactionTypesResponse: GetTransactionTypesResponse) {
                                val modelMap = getTransactionTypesResponse.serializeToMap()

                                val returnMap: Map<String, Any> =
                                    jsonToMap.convertJsonToMap(JSONObject(modelMap))

                                result.success(returnMap)
                            }
                        })
                }

                else -> result.notImplemented()
            }
        } catch (e: Exception) {
            e.printStackTrace()
            result.error(
                "",
                e.message ?: "",
                ""
            )
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
