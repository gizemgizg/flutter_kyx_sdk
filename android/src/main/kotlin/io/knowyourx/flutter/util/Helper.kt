package io.knowyourx.flutter.util

import android.graphics.Bitmap
import android.util.Base64
import com.google.gson.GsonBuilder
import com.google.gson.reflect.TypeToken
import com.kyx.kyx_sdk.common.enums.TransactionStepCode
import com.kyx.kyx_sdk.common.enums.TransactionStepStatusCode
import com.kyx.kyx_sdk.domain.model.transaction.TransactionDetailStatus
import com.kyx.kyx_sdk.domain.model.transaction.TransactionDocumentGroup
import com.kyx.kyx_sdk.domain.model.transaction.TransactionDocumentType
import com.kyx.kyx_sdk.domain.model.transaction.TransactionImageValidation
import com.kyx.kyx_sdk.domain.model.transaction.TransactionStatus
import com.kyx.kyxsdkapp.common.model.*
import com.kyx.kyxsdkapp.domain.kyx_model.KyxLanguage
import org.json.JSONException
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.time.LocalDateTime

fun <T> T.serializeToMap(): Map<String, Any> {
    return convert()
}

inline fun <I, reified O> I.convert(): O {
    val gson = GsonBuilder()
        .registerTypeHierarchyAdapter(Bitmap::class.java, BitmapSerializer())
        .registerTypeHierarchyAdapter(
            LocalDateTime::class.java,
            LocalDateTimeSerializer()
        )
        .registerTypeAdapter(
            TransactionDocumentType::class.java,
            TransactionDocumentTypeSerializer()
        )
        .registerTypeAdapter(
            TransactionDocumentGroup::class.java,
            TransactionDocumentGroupSerializer()
        )
        .registerTypeAdapter(
            TransactionDetailStatus::class.java,
            TransactionDetailStatusSerializer()
        )
        .registerTypeAdapter(
            TransactionStepStatusCode::class.java,
            TransactionStepStatusCodeSerializer()
        )
        .registerTypeAdapter(
            TransactionStepCode::class.java,
            TransactionStepCodeSerializer()
        )
        .registerTypeAdapter(
            TransactionImageValidation::class.java,
            TransactionImageValidationSerializer()
        )
        .registerTypeAdapter(
            TransactionStatus::class.java,
            TransactionStatusSerializer()
        )

        .create()
    val json = gson.toJson(this)
    return gson.fromJson(json, object : TypeToken<O>() {}.type)
}

@Throws(JSONException::class)
inline fun <reified T> convertJsonToObject(jsonObject: JSONObject): T {
    val gson = GsonBuilder()
        .registerTypeAdapter(RunData::class.java, RunDataInstanceCreator())
        .registerTypeAdapter(KyxLanguage::class.java, KyxLanguageDeserializer())
        .registerTypeAdapter(SpeechRecognitionData::class.java, SpeechRecognitionDataInstanceCreator())
        .create()

    val jsonString = jsonObject.toString()
    return gson.fromJson(jsonString, T::class.java)
}

fun Bitmap.toBase64(): String {
    ByteArrayOutputStream().apply {
        compress(Bitmap.CompressFormat.JPEG, 80, this)
        return "data:image/jpeg;base64," + Base64.encodeToString(toByteArray(), Base64.DEFAULT)
    }
}