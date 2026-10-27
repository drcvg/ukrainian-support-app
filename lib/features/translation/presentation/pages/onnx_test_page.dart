import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onnxruntime/flutter_onnxruntime.dart';

import 'dart:typed_data';

import '../../../../core/services/model_files_service.dart';
import '../../../../core/services/marianmt_service.dart';

class OnnxTestPage extends StatefulWidget {
  const OnnxTestPage({super.key});

  @override
  State<OnnxTestPage> createState() => _OnnxTestPageState();
}

class _OnnxTestPageState extends State<OnnxTestPage> {
  final TextEditingController _textoController = TextEditingController(
    text: 'Hola, ¿cómo estás?',
  );

  final MarianMTService _marianService = MarianMTService();

  String resultado = 'Selecciona una prueba.';
  bool ejecutando = false;
  bool espanolAUcraniano = true;
  double progresoDescarga = 0.0;
  bool mostrandoProgreso = false;

  Future<void> probarModelo() async {
    setState(() {
      ejecutando = true;
      resultado = 'Cargando modelo ONNX de prueba...';
    });

    OrtSession? session;
    OrtValue? a;
    OrtValue? b;
    Map<String, OrtValue>? outputs;

    try {
      final runtime = OnnxRuntime();
      session = await runtime.createSessionFromAsset(
        'assets/models/ort_test.onnx',
      );

      a = await OrtValue.fromList(Float32List.fromList([1.0, 2.0]), [1, 2]);

      b = await OrtValue.fromList(Float32List.fromList([3.0, 4.0]), [1, 2]);

      outputs = await session.run({'a': a, 'b': b});
      final valores = await outputs['resultado']!.asFlattenedList();

      if (!mounted) return;

      setState(() {
        resultado =
            '¡Modelo ONNX ejecutado correctamente!\nResultado: $valores';
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        resultado = 'Error al ejecutar ONNX:\n$e';
      });
    } finally {
      if (outputs != null) {
        for (final value in outputs.values) {
          await value.dispose();
        }
      }

      await a?.dispose();
      await b?.dispose();
      await session?.close();

      if (mounted) {
        setState(() => ejecutando = false);
      }
    }
  }

  Future<void> prepararModelos() async {
    setState(() {
      ejecutando = true;
      progresoDescarga = 0.0;
      mostrandoProgreso = true;
      resultado =
          'Preparando los modelos de traducción...\n'
          'La descarga puede ocupar varios cientos de MB.';
    });

    try {
      final rutas = await ModelFilesService.prepareModels(
        progress: (progreso) {
          if (!mounted) return;

          setState(() {
            progresoDescarga = progreso.clamp(0.0, 1.0).toDouble();
          });
        },
      );

      if (!mounted) return;

      setState(() {
        progresoDescarga = 1.0;
        resultado =
            'Modelos preparados correctamente.\n\n'
            'Español → ucraniano:\n${rutas['es_uk']}\n\n'
            'Ucraniano → español:\n${rutas['uk_es']}';
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        resultado = 'Error al preparar los modelos:\n$e';
      });
    } finally {
      if (mounted) {
        setState(() {
          ejecutando = false;
          mostrandoProgreso = false;
        });
      }
    }
  }

  Future<void> probarTraduccion() async {
    final texto = _textoController.text.trim();

    if (texto.isEmpty) {
      setState(() {
        resultado = 'Escribe un texto antes de traducir.';
      });
      return;
    }

    setState(() {
      ejecutando = true;
      resultado =
          'Cargando el modelo de traducción...\n'
          'La primera traducción puede tardar un poco.';
    });

    try {
      final traduccion = await _marianService.translate(
        texto,
        spanishToUkrainian: espanolAUcraniano,
      );

      if (!mounted) return;

      setState(() {
        resultado =
            'Traducción completada.\n\n'
            'Dirección: ${espanolAUcraniano ? 'Español → ucraniano' : 'Ucraniano → español'}\n\n'
            'Texto original:\n$texto\n\n'
            'Traducción:\n${traduccion.isEmpty ? '(El modelo devolvió un texto vacío)' : traduccion}';
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        resultado = 'Error en la traducción:\n$e';
      });
    } finally {
      if (mounted) {
        setState(() => ejecutando = false);
      }
    }
  }

  @override
  void dispose() {
    _textoController.dispose();
    unawaited(_marianService.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Prueba ONNX y MarianMT')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Prueba de traducción real',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<bool>(
                        initialValue: espanolAUcraniano,
                        decoration: const InputDecoration(
                          labelText: 'Dirección de traducción',
                          border: OutlineInputBorder(),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: true,
                            child: Text('Español → ucraniano'),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: Text('Ucraniano → español'),
                          ),
                        ],
                        onChanged: ejecutando
                            ? null
                            : (value) {
                                if (value != null) {
                                  setState(() {
                                    espanolAUcraniano = value;
                                  });
                                }
                              },
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _textoController,
                        enabled: !ejecutando,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Texto que quieres traducir',
                          hintText: 'Escribe aquí el texto...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: ejecutando ? null : probarTraduccion,
                        child: const Text('Probar traducción MarianMT'),
                      ),
                      const Divider(height: 32),
                      const Text(
                        'Resultado de las pruebas',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),
                      if (mostrandoProgreso) ...[
                        LinearProgressIndicator(
                          value: progresoDescarga,
                          minHeight: 8,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Descarga: ${(progresoDescarga * 100).toStringAsFixed(1)} %',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                      ],
                      SelectableText(resultado),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: ejecutando ? null : probarModelo,
                  child: const Text('Probar modelo ONNX básico'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: ejecutando ? null : prepararModelos,
                  child: const Text('Preparar modelos de traducción'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
