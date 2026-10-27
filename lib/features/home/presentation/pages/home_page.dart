import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/bottom_navigation.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Encabezado
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 16, 12),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Ukrainian Support',
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Configuración la conectaremos más adelante.
                    },
                    icon: const Icon(
                      Icons.settings_outlined,
                      color: AppColors.medium,
                    ),
                  ),
                ],
              ),
            ),

            // Contenido
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bienvenido/a',
                      style: TextStyle(
                        color: AppColors.dark,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Encuentra herramientas e información de apoyo en España.',
                      style: TextStyle(
                        color: AppColors.medium,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Traductor
                    _HomeCard(
                      icon: Icons.translate_rounded,
                      title: 'Traductor Offline',
                      description:
                          'Traduce entre español y ucraniano sin conexión a Internet.',
                      color: AppColors.blue,
                      onTap: () {
                        context.go('/translation');
                      },
                    ),

                    const SizedBox(height: 16),

                    // Trámites
                    _HomeCard(
                      icon: Icons.description_outlined,
                      title: 'Trámites Administrativos',
                      description:
                          'Consulta información sobre trámites importantes en España.',
                      color: AppColors.blueDark,
                      onTap: () {
                        // Lo conectaremos cuando creemos la pantalla.
                      },
                    ),

                    const SizedBox(height: 16),

                    // Recursos
                    _HomeCard(
                      icon: Icons.support_agent_rounded,
                      title: 'Recursos de Apoyo',
                      description:
                          'Encuentra organizaciones y recursos de ayuda disponibles.',
                      color: const Color(0xFF286C6D),
                      onTap: () {
                        // Lo conectaremos cuando creemos la pantalla.
                      },
                    ),
                                        const SizedBox(height: 16),

                    // Acceso temporal para probar los modelos ONNX.
                    _HomeCard(
                      icon: Icons.memory_rounded,
                      title: 'Prueba ONNX',
                      description:
                          'Comprueba el motor de traducción y prepara los modelos offline.',
                      color: AppColors.blueDark,
                      onTap: () {
                        context.go('/onnx-test');
                      },
                    ),
                  ],
                ),
              ),
            ),

            // Navegación inferior
            AppBottomNavigation(
  selectedIndex: 0,
  onItemSelected: (index) {
    if (index == 1) {
      context.go('/translation');
    }
  },
),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final VoidCallback onTap;

  const _HomeCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 28,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      description,
                      style: const TextStyle(
                        color: AppColors.medium,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Text(
                          'Abrir',
                          style: TextStyle(
                            color: color,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: color,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _NavigationItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.blue : AppColors.gray;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selected ? selectedIcon : icon,
                color: color,
                size: 24,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight:
                      selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}