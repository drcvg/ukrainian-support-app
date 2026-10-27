
package com.example.ukranian_support

import android.os.Handler
import android.os.Looper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.BufferedInputStream
import java.io.BufferedOutputStream
import java.io.File
import java.io.FileOutputStream

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "com.example.ukranian_support/model_files"

        private val MODEL_FILES = listOf(
            "config.json",
            "decoder_model.onnx",
            "encoder_model.onnx",
            "generation_config.json",
            "source.spm",
            "special_tokens_map.json",
            "target.spm",
            "tokenizer_config.json",
            "vocab.json"
        )
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            if (call.method == "prepareModels") {
                Thread {
                    try {
                        val esUk = copyModelDirectory("es_uk")
                        val ukEs = copyModelDirectory("uk_es")

                        val paths = mapOf(
                            "es_uk" to esUk.absolutePath,
                            "uk_es" to ukEs.absolutePath
                        )

                        Handler(Looper.getMainLooper()).post {
                            result.success(paths)
                        }
                    } catch (e: Exception) {
                        Handler(Looper.getMainLooper()).post {
                            result.error(
                                "MODEL_COPY_ERROR",
                                e.message ?: "No se pudieron preparar los modelos",
                                null
                            )
                        }
                    }
                }.start()
            } else {
                result.notImplemented()
            }
        }
    }

    private fun copyModelDirectory(direction: String): File {
        val destination = File(filesDir, "marianmt_models/$direction")

        if (!destination.exists() && !destination.mkdirs()) {
            throw IllegalStateException(
                "No se pudo crear el directorio ${destination.absolutePath}"
            )
        }

        for (fileName in MODEL_FILES) {
            val assetPath = "marianmt_models/$direction/$fileName"
            val destinationFile = File(destination, fileName)

            // Reutilizar archivos ya copiados y no vacíos.
            if (destinationFile.exists() && destinationFile.length() > 0L) {
                continue
            }

            val temporaryFile = File(destination, "$fileName.tmp")

            try {
                assets.open(assetPath).use { asset ->
                    BufferedInputStream(asset).use { input ->
                        FileOutputStream(temporaryFile).use { outputStream ->
                            BufferedOutputStream(outputStream).use { output ->
                                val buffer = ByteArray(1024 * 1024)

                                while (true) {
                                    val count = input.read(buffer)
                                    if (count == -1) break
                                    output.write(buffer, 0, count)
                                }

                                output.flush()
                            }
                        }
                    }
                }

                if (destinationFile.exists() && !destinationFile.delete()) {
                    throw IllegalStateException(
                        "No se pudo reemplazar $fileName"
                    )
                }

                if (!temporaryFile.renameTo(destinationFile)) {
                    throw IllegalStateException(
                        "No se pudo finalizar la copia de $fileName"
                    )
                }
            } finally {
                if (temporaryFile.exists()) {
                    temporaryFile.delete()
                }
            }
        }

        return destination
    }
}
