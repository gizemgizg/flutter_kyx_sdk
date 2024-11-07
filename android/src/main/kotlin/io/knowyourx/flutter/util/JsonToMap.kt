package io.knowyourx.flutter.util

import org.json.JSONArray
import org.json.JSONException
import org.json.JSONObject

class JsonToMap {

    @Throws(JSONException::class)
    fun convertJsonToMap(jsonObject: JSONObject): Map<String, Any> {
        val map: MutableMap<String, Any> = mutableMapOf()
        val iterator = jsonObject.keys()
        while (iterator.hasNext()) {
            val key = iterator.next()
            when (val value = jsonObject.get(key)) {
                is JSONObject -> map[key] = convertJsonToMap(value)
                is JSONArray -> map[key] = convertJsonToArray(value)
                is Double -> {
                    val intValue = value.toInt()

                    if (value == intValue.toDouble()) {
                        map[key] = intValue
                    } else {
                        map[key] = value
                    }
                }

                is Boolean, is Int, is String -> map[key] = value
                else -> map[key] = value.toString()
            }
        }
        return map
    }

    @Throws(JSONException::class)
    fun convertJsonToArray(jsonArray: JSONArray): ArrayList<Any> {
        val array = ArrayList<Any>()
        for (i in 0 until jsonArray.length()) {
            when (val value = jsonArray[i]) {
                is JSONObject -> array.add(convertJsonToMap(value))
                is JSONArray -> array.add(convertJsonToArray(value))
                is Double -> {
                    val intValue = value.toInt()

                    if (value == intValue.toDouble()) {
                        array.add(intValue)
                    } else {
                        array.add(value)
                    }
                }

                is Boolean, is Int, is String -> array.add(value)
                else -> array.add(value.toString())
            }
        }
        return array
    }

    @Throws(JSONException::class)
    fun convertMapToJson(map: Map<String, Any>): JSONObject {
        val jsonObject = JSONObject()
        for ((key, value) in map) {
            when (value) {
                null -> {}
                is Boolean -> jsonObject.put(key, value)
                is Number -> jsonObject.put(key, value)
                is String -> jsonObject.put(key, value)
                is Map<*, *> -> jsonObject.put(key, convertMapToJson(value as Map<String, Any>))
                is List<*> -> jsonObject.put(key, convertListToJson(value))
                else -> jsonObject.put(key, value.toString())
            }
        }
        return jsonObject
    }

    @Throws(JSONException::class)
    fun convertListToJson(list: List<Any?>): JSONArray {
        val jsonArray = JSONArray()
        for (item in list) {
            when (item) {
                null -> jsonArray.put(JSONObject.NULL)
                is Boolean, is Number, is String -> jsonArray.put(item)
                is Map<*, *> -> jsonArray.put(convertMapToJson(item as Map<String, Any>))
                is List<*> -> jsonArray.put(convertListToJson(item))
                else -> jsonArray.put(item.toString())
            }
        }
        return jsonArray
    }
}
