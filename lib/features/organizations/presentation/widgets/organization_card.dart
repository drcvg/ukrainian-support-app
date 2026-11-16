import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../models/organization_model.dart';

class OrganizationCard extends StatelessWidget {
  final Organization organization;
  final VoidCallback onTap;

  const OrganizationCard({
    super.key,
    required this.organization,
    required this.onTap,
  });

  String _locationLabel() {
    final cities = organization.locations
        .map((location) => location.city?.trim() ?? '')
        .where((city) => city.isNotEmpty)
        .toSet()
        .toList();

    if (cities.length > 1) {
      return 'Varias localidades';
    }

    if (cities.length == 1) {
      return cities.first;
    }

    if (organization.city.trim().isNotEmpty) {
      return organization.city;
    }

    return 'Ubicación pendiente de confirmar';
  }

  String _attentionLabel() {
    final modes = organization.locations
        .where((location) => location.active)
        .map((location) => location.attentionMode)
        .toSet();

    if (modes.isEmpty) {
      return _attentionText(organization.modalidadAtencion);
    }

    if (modes.length == 1) {
      return _attentionText(modes.first);
    }

    if (modes.contains('territorial')) {
      return 'Atención territorial';
    }

    if (modes.contains('cita_previa')) {
      return 'Consultar modalidad de atención';
    }

    return 'Modalidad no confirmada';
  }

  String _attentionText(String mode) {
    switch (mode) {
      case 'presencial':
        return 'Atención presencial';
      case 'cita_previa':
        return 'Cita previa';
      case 'territorial':
        return 'Atención territorial';
      case 'digital':
        return 'Atención digital';
      default:
        return 'Modalidad no confirmada';
    }
  }

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
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.blue.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.groups_outlined,
                  color: AppColors.blue,
                  size: 27,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      organization.name,
                      style: const TextStyle(
                        color: AppColors.dark,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      organization.category,
                      style: const TextStyle(
                        color: AppColors.blueDark,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: AppColors.gray,
                          size: 15,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            _locationLabel(),
                            style: const TextStyle(
                              color: AppColors.medium,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          color: AppColors.gray,
                          size: 14,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            _attentionLabel(),
                            style: const TextStyle(
                              color: AppColors.medium,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    Text(
                      organization.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
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
                Icons.arrow_forward_ios_rounded,
                color: AppColors.gray,
                size: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
