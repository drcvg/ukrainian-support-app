import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AppBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const AppBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.border,
          ),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      child: Row(
        children: [
          _NavigationItem(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_rounded,
            label: 'Inicio',
            selected: selectedIndex == 0,
            onTap: () => onItemSelected(0),
          ),
          _NavigationItem(
            icon: Icons.translate_outlined,
            selectedIcon: Icons.translate_rounded,
            label: 'Traductor',
            selected: selectedIndex == 1,
            onTap: () => onItemSelected(1),
          ),
          _NavigationItem(
            icon: Icons.info_outline_rounded,
            selectedIcon: Icons.info_rounded,
            label: 'Información',
            selected: selectedIndex == 2,
            onTap: () => onItemSelected(2),
          ),
        ],
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