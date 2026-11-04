import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/organizations_data.dart';
import '../../models/organization_model.dart';
import '../widgets/organization_card.dart';

class OrganizationsPage extends StatelessWidget {
  const OrganizationsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          'Organizaciones',
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
            'Comunidad ucraniana en España',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Encuentra asociaciones y organizaciones de la '
            'comunidad ucraniana que desarrollan actividades '
            'culturales, sociales y comunitarias en España.',
            style: TextStyle(
              color: AppColors.medium,
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.groups_rounded,
                  color: AppColors.blue,
                  size: 26,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Organizaciones disponibles',
                        style: TextStyle(
                          color: AppColors.medium,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        '${organizations.length} organizaciones',
                        style: const TextStyle(
                          color: AppColors.dark,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
          const Text(
            'Directorio de organizaciones',
            style: TextStyle(
              color: AppColors.dark,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 13),
          ...organizations.map(
            (organization) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: OrganizationCard(
                organization: organization,
                onTap: () => _showOrganizationDetails(
                  context,
                  organization,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
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
                    'La información de contacto y las actividades '
                    'de cada organización pueden cambiar. '
                    'Consulta siempre sus canales oficiales.',
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

  void _showOrganizationDetails(
    BuildContext context,
    Organization organization,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.border,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Text(
                  organization.name,
                  style: const TextStyle(
                    color: AppColors.dark,
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  organization.category,
                  style: const TextStyle(
                    color: AppColors.blueDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  organization.description,
                  style: const TextStyle(
                    color: AppColors.medium,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 18),
                _detailRow(
                  Icons.location_on_outlined,
                  organization.city,
                ),
                if (organization.address.isNotEmpty)
                  _detailRow(
                    Icons.place_outlined,
                    organization.address,
                  ),
                if (organization.phone.isNotEmpty)
                  _detailRow(
                    Icons.phone_outlined,
                    organization.phone,
                  ),
                if (organization.email.isNotEmpty)
                  _detailRow(
                    Icons.email_outlined,
                    organization.email,
                  ),
                const SizedBox(height: 20),
                if (organization.website.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => _openWebsite(
                        context,
                        organization.website,
                      ),
                      icon: const Icon(Icons.open_in_new_rounded),
                      label: const Text('Visitar página oficial'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blue,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _detailRow(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppColors.gray, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppColors.medium,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openWebsite(
    BuildContext context,
    String url,
  ) async {
    final uri = Uri.tryParse(url);

    if (uri == null ||
        !await launchUrl(
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