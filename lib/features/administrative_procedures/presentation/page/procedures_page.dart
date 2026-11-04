
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/procedures_data.dart';
import '../widgets/procedure_card.dart';

class ProceduresPage extends StatelessWidget {
  const ProceduresPage({super.key});

  @override
  Widget build(BuildContext context) {
    const category = 'Extranjería y situación legal';

    final categoryProcedures = procedures
        .where((procedure) => procedure.category == category)
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.dark,
          ),
        ),
        title: const Text(
          'Procedimientos administrativos',
          style: TextStyle(
            color: AppColors.dark,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trámites en España',
                style: TextStyle(
                  color: AppColors.dark,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Consulta información práctica para realizar '
                'los principales procedimientos administrativos.',
                style: TextStyle(
                  color: AppColors.medium,
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.blueDark.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.gavel_rounded,
                        color: AppColors.blueDark,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category,
                            style: TextStyle(
                              color: AppColors.dark,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Documentación, residencia y protección '
                            'internacional.',
                            style: TextStyle(
                              color: AppColors.medium,
                              fontSize: 13,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Trámites disponibles (${categoryProcedures.length})',
                style: const TextStyle(
                  color: AppColors.dark,
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 14),
              ...categoryProcedures.map(
                (procedure) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: ProcedureCard(
                    procedure: procedure,
                    onTap: () {
                      context.push(
                        '/administrative-procedures/${procedure.id}',
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'La información es orientativa. Consulta siempre '
                'los requisitos actualizados en los organismos oficiales.',
                style: TextStyle(
                  color: AppColors.gray,
                  fontSize: 12,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
