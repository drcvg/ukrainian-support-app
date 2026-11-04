import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/recursos_data.dart';

class ResourcesPage extends StatelessWidget {
  const ResourcesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = recursos
        .map((recurso) => recurso.categoria)
        .toSet()
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.dark,
          ),
        ),
        title: const Text(
          'Recursos de Apoyo',
          style: TextStyle(
            color: AppColors.dark,
            fontWeight: FontWeight.w700,
            fontSize: 19,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 30),
        children: [
          const Text(
            'Organizaciones y servicios de ayuda',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Encuentra organizaciones que ofrecen orientación, '
            'asistencia y apoyo a personas ucranianas en España.',
            style: TextStyle(
              color: AppColors.medium,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          ...categories.map((category) {
            final categoryResources = recursos
                .where((recurso) => recurso.categoria == category)
                .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12, top: 8),
                  child: Text(
                    category,
                    style: const TextStyle(
                      color: AppColors.blueDark,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                ...categoryResources.map(
                  (recurso) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _ResourceCard(
                      nombre: recurso.nombre,
                      descripcion: recurso.descripcion,
                      onTap: () => _openOfficialPage(
                        context,
                        recurso.urlOficial,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.blue,
                  size: 22,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'La disponibilidad de los servicios y las '
                    'condiciones de atención pueden variar. '
                    'Consulta siempre la información actualizada '
                    'en las páginas oficiales.',
                    style: TextStyle(
                      color: AppColors.medium,
                      fontSize: 12,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openOfficialPage(
    BuildContext context,
    String url,
  ) async {
    final uri = Uri.tryParse(url);

    if (uri == null || !await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo abrir la página oficial.'),
        ),
      );
    }
  }
}

class _ResourceCard extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final VoidCallback onTap;

  const _ResourceCard({
    required this.nombre,
    required this.descripcion,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(17),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.blue.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.volunteer_activism_outlined,
                  color: AppColors.blue,
                  size: 25,
                ),
              ),
              const SizedBox(width: 13),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      descripcion,
                      style: const TextStyle(
                        color: AppColors.medium,
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.open_in_new_rounded,
                color: AppColors.gray,
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}