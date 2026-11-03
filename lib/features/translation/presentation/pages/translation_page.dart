import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/bottom_navigation.dart';
import '../../../../core/services/marianmt_service.dart';

class TranslationPage extends StatefulWidget {
  const TranslationPage({super.key});

  @override
  State<TranslationPage> createState() => _TranslationPageState();
}

class _TranslationPageState extends State<TranslationPage> {
  final TextEditingController _inputController = TextEditingController();
  final MarianMTService _marianService = MarianMTService();
  final FlutterTts _flutterTts = FlutterTts();

  bool _isSpeaking = false;

  String _sourceLanguage = 'Ucraniano';
  String _targetLanguage = 'Español';

  String _translation = '';

  bool _isLoading = false;
  bool _hasError = false;

  double? _modelPreparationProgress;
  bool _isPreparingModel = false;
  String _statusMessage = '';

  @override
  void dispose() {
    _inputController.dispose();
    _marianService.dispose();
    super.dispose();
  }

  void _swapLanguages() {
    setState(() {
      final oldSource = _sourceLanguage;

      _sourceLanguage = _targetLanguage;
      _targetLanguage = oldSource;

      _translation = '';
      _hasError = false;
    });
  }

  Future<void> _translate() async {
    final text = _inputController.text.trim();

    if (text.isEmpty) {
      setState(() {
        _hasError = true;
        _translation = '';
        _modelPreparationProgress = null;
        _statusMessage = '';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _hasError = false;
      _translation = '';
      _isPreparingModel = true;
      _modelPreparationProgress = null;
      _statusMessage = 'Cargando traductor...';
    });

    try {
      final translation = await _marianService.translate(
        text,
        spanishToUkrainian: _sourceLanguage == 'Español',
        onModelPreparationProgress: (progress) {
  if (!mounted) return;

  setState(() {
    _isPreparingModel = false;
    _modelPreparationProgress = progress;
    _statusMessage = 'Descargando modelos de traducción...';
  });
},
      );

      if (!mounted) return;

      setState(() {
        _translation = translation;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _hasError = true;
        _translation = '';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo traducir el texto: $e'),
          duration: const Duration(seconds: 5),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isPreparingModel = false;
          _modelPreparationProgress = null;
          _statusMessage = '';
        });
      }
    }
  }

  Future<void> _copyTranslation() async {
    if (_translation.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: _translation));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Traducción copiada'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _speakTranslation() async {
    if (_translation.isEmpty || _isSpeaking) return;

    try {
      setState(() {
        _isSpeaking = true;
      });

      await _flutterTts.setLanguage(
        _targetLanguage == 'Español' ? 'es-ES' : 'uk-UA',
      );

      await _flutterTts.setSpeechRate(0.45);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);
      await _flutterTts.awaitSpeakCompletion(true);

      await _flutterTts.speak(_translation);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No se pudo reproducir el audio: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSpeaking = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Traduce sin conexión',
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'El texto se procesa directamente en tu dispositivo.',
                      style: TextStyle(
                        color: AppColors.medium,
                        fontSize: 15,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 24),

                    _buildLanguageSelector(),

                    const SizedBox(height: 20),

                    _buildInputSection(),

                    const SizedBox(height: 16),

                    _buildTranslateButton(),

                    _buildPreparationProgress(),

                    const SizedBox(height: 24),

                    _buildResultSection(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            AppBottomNavigation(
              selectedIndex: 1,
              onItemSelected: (index) {
                if (index == 0) {
                  context.go('/');
                } else if (index == 2) {
                  // Información la conectaremos después.
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 16, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.go('/'),
            icon: const Icon(Icons.arrow_back_rounded, color: AppColors.dark),
          ),
          const Expanded(
            child: Text(
              'Traductor Offline',
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: _LanguageButton(language: _sourceLanguage, onTap: () {}),
          ),

          IconButton(
            onPressed: _swapLanguages,
            style: IconButton.styleFrom(
              backgroundColor: AppColors.blueLight,
              foregroundColor: AppColors.blue,
            ),
            icon: const Icon(Icons.swap_horiz_rounded),
          ),

          Expanded(
            child: _LanguageButton(language: _targetLanguage, onTap: () {}),
          ),
        ],
      ),
    );
  }

  Widget _buildInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _sourceLanguage,
          style: const TextStyle(
            color: AppColors.dark,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _hasError ? AppColors.error : AppColors.border,
            ),
          ),
          child: TextField(
            controller: _inputController,
            maxLines: 6,
            textInputAction: TextInputAction.newline,
            onChanged: (_) {
              if (_hasError) {
                setState(() {
                  _hasError = false;
                });
              }
            },
            decoration: InputDecoration(
              hintText: 'Escribe el texto que quieres traducir...',
              hintStyle: const TextStyle(color: AppColors.gray),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              suffixIcon: _inputController.text.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        _inputController.clear();
                        setState(() {
                          _translation = '';
                          _hasError = false;
                        });
                      },
                      icon: const Icon(Icons.close_rounded),
                    )
                  : null,
            ),
          ),
        ),

        if (_hasError) ...[
          const SizedBox(height: 8),
          const Row(
            children: [
              Icon(
                Icons.error_outline_rounded,
                color: AppColors.error,
                size: 18,
              ),
              SizedBox(width: 6),
              Text(
                'Escribe un texto para poder traducirlo.',
                style: TextStyle(color: AppColors.error, fontSize: 13),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildTranslateButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _translate,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: AppColors.blueMid,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: _isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.white,
                ),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.translate_rounded),
                  SizedBox(width: 8),
                  Text(
                    'Traducir',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildPreparationProgress() {
    if (!_isLoading) {
      return const SizedBox.shrink();
    }

    final progress = _modelPreparationProgress;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _statusMessage.isEmpty ? 'Cargando traductor...' : _statusMessage,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          if (_isPreparingModel)
            const Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.blue,
                ),
              ),
            )
          else ...[
            LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              borderRadius: BorderRadius.circular(8),
              backgroundColor: AppColors.blueLight,
              color: AppColors.blue,
            ),
            if (progress != null) ...[
              const SizedBox(height: 8),
              Text(
                '${(progress * 100).round()} %',
                style: const TextStyle(color: AppColors.medium, fontSize: 13),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Widget _buildResultSection() {
    if (_translation.isEmpty && !_isLoading) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.blueLight,
          borderRadius: BorderRadius.circular(18),
        ),
        child: const Column(
          children: [
            Icon(Icons.translate_rounded, color: AppColors.blue, size: 32),
            SizedBox(height: 10),
            Text(
              'La traducción aparecerá aquí',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.medium, fontSize: 14),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Traducción',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            _translation,
            style: const TextStyle(
              color: AppColors.dark,
              fontSize: 16,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _copyTranslation,
                  icon: const Icon(Icons.copy_outlined, size: 18),
                  label: const Text('Copiar'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.blue,
                    side: const BorderSide(color: AppColors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 10),

              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _translation.isEmpty || _isSpeaking
                      ? null
                      : _speakTranslation,
                  icon: const Icon(Icons.volume_up_outlined, size: 18),
                  label: Text(_isSpeaking ? 'Reproduciendo...' : 'Escuchar'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.blue,
                    side: const BorderSide(color: AppColors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LanguageButton extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const _LanguageButton({required this.language, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              language,
              style: const TextStyle(
                color: AppColors.dark,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
              color: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}
