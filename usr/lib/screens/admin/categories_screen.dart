import 'package:flutter/material.dart';
import '../../widgets/admin_layout.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdminLayout(
      currentRoute: '/admin/categories',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'دسته‌بندی‌ها',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'مدیریت دسته‌بندی‌های محصولات',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                FilledButton.icon(
                  onPressed: () {
                    // TODO: Add category
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('افزودن دسته‌بندی'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Categories Grid
            _buildCategoriesGrid(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid(ThemeData theme) {
    final categories = [
      {'name': 'موبایل', 'count': '۴۵', 'icon': Icons.smartphone},
      {'name': 'لپ‌تاپ', 'count': '۳۲', 'icon': Icons.laptop},
      {'name': 'تبلت', 'count': '۱۸', 'icon': Icons.tablet},
      {'name': 'صوتی', 'count': '۲۷', 'icon': Icons.headphones},
      {'name': 'دوربین', 'count': '۱۵', 'icon': Icons.camera_alt},
      {'name': 'لوازم جانبی', 'count': '۶۸', 'icon': Icons.devices_other},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          category['icon'] as IconData,
                          color: theme.colorScheme.primary,
                          size: 24,
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(Icons.edit_outlined, size: 20),
                                SizedBox(width: 8),
                                Text('ویرایش'),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete_outline, size: 20, color: Color(0xFFEF4444)),
                                SizedBox(width: 8),
                                Text('حذف', style: TextStyle(color: Color(0xFFEF4444))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        category['name'] as String,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${category['count']} محصول',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
