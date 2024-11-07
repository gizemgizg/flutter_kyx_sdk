package io.knowyourx.flutter.util

import android.graphics.Bitmap
import com.google.gson.InstanceCreator
import com.google.gson.JsonDeserializationContext
import com.google.gson.JsonDeserializer
import com.google.gson.JsonElement
import com.google.gson.JsonNull
import com.google.gson.JsonPrimitive
import com.google.gson.JsonSerializationContext
import com.google.gson.JsonSerializer
import com.kyx.kyx_sdk.common.enums.TransactionStepCode
import com.kyx.kyx_sdk.common.enums.TransactionStepStatusCode
import com.kyx.kyx_sdk.domain.model.transaction.TransactionDetailStatus
import com.kyx.kyx_sdk.domain.model.transaction.TransactionDocumentGroup
import com.kyx.kyx_sdk.domain.model.transaction.TransactionDocumentType
import com.kyx.kyx_sdk.domain.model.transaction.TransactionImageValidation
import com.kyx.kyx_sdk.domain.model.transaction.TransactionStatus
import com.kyx.kyx_selfie_video.util.enums.VideoQuality
import com.kyx.kyxsdkapp.common.model.*
import com.kyx.kyxsdkapp.domain.kyx_model.KyxLanguage
import java.lang.reflect.Type
import java.time.LocalDateTime

class RunDataInstanceCreator : InstanceCreator<RunData> {
    override fun createInstance(type: Type): RunData {
        return RunData(
            createTransactionData = CreateTransactionData(),
            frontCardDetectionData = FrontCardDetectionData(),
            backCardDetectionData = BackCardDetectionData(),
            livenessData = LivenessData(),
            mrzReaderData = MrzReaderData(),
            nfcReaderData = NfcReaderData(),
            speechRecognitionData = SpeechRecognitionData(
                speechText = "Bu bir test metnidir. Sondaki kelimeyi okuduğunuzda işlem tamamlanacaktır. Onaylıyorum.",
                videoQuality = VideoQuality.LOW
            ),
            videoCallData = VideoCallData(),
            resultPageData = ResultPageData(),
        ) // Varsayılan değerlerle bir nesne oluşturun.
    }
}

class SpeechRecognitionDataInstanceCreator : InstanceCreator<SpeechRecognitionData> {
    override fun createInstance(type: Type): SpeechRecognitionData {
        return SpeechRecognitionData(
            speechText = "Bu bir test metnidir. Sondaki kelimeyi okuduğunuzda işlem tamamlanacaktır. Onaylıyorum.",
            videoQuality = VideoQuality.LOW
        ) // Varsayılan değerlerle bir nesne oluşturun.
    }
}

class BitmapSerializer : JsonSerializer<Bitmap> {
    override fun serialize(
        src: Bitmap?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.toBase64())
    }
}

class TransactionDocumentTypeSerializer : JsonSerializer<TransactionDocumentType> {
    override fun serialize(
        src: TransactionDocumentType?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.value)
    }
}

class TransactionDocumentGroupSerializer : JsonSerializer<TransactionDocumentGroup> {
    override fun serialize(
        src: TransactionDocumentGroup?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.value)
    }
}

class TransactionStepCodeSerializer : JsonSerializer<TransactionStepCode> {
    override fun serialize(
        src: TransactionStepCode?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.order)
    }
}

class TransactionStepStatusCodeSerializer : JsonSerializer<TransactionStepStatusCode> {
    override fun serialize(
        src: TransactionStepStatusCode?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.order)
    }
}

class LocalDateTimeSerializer : JsonSerializer<LocalDateTime> {
    override fun serialize(
        src: LocalDateTime?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.toString())
    }
}

class TransactionStatusSerializer : JsonSerializer<TransactionStatus> {
    override fun serialize(
        src: TransactionStatus?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.value)
    }
}

class TransactionImageValidationSerializer : JsonSerializer<TransactionImageValidation> {
    override fun serialize(
        src: TransactionImageValidation?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.value)
    }
}

class TransactionDetailStatusSerializer : JsonSerializer<TransactionDetailStatus> {
    override fun serialize(
        src: TransactionDetailStatus?,
        typeOfSrc: Type?,
        context: JsonSerializationContext?
    ): JsonElement {
        if (src == null) return JsonNull.INSTANCE

        return JsonPrimitive(src.value)
    }
}


class KyxLanguageDeserializer : JsonDeserializer<KyxLanguage> {
    override fun deserialize(
        json: JsonElement,
        typeOfT: Type,
        context: JsonDeserializationContext
    ): KyxLanguage {
        val languageAsString = json.asString

        // Enum'a dönüştürme işlemi (örnek, burada kendi uygulamanıza göre ayarlamanız gerekebilir)
        return KyxLanguage.values().firstOrNull { it.code == languageAsString }
            ?: KyxLanguage.Turkish
    }
}