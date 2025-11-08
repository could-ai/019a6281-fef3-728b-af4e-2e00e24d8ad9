import 'package:flutter/material.dart';
import '../../widgets/admin_layout.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdminLayout(
      currentRoute: '/admin/settings',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'تنظیمات',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'تنظیمات عمومی سیستم',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),

            // General Settings
            _buildSettingsSection(
              theme,
              'تنظیمات عمومی',
              [
                _buildSettingItem(
                  theme,
                  'نام فروشگاه',
                  'فروشگاه من',
                  Icons.store_outlined,
                ),
                _buildSettingItem(
                  theme,
                  'ایمیل',
                  'info@myshop.com',
                  Icons.email_outlined,
                ),
                _buildSettingItem(
                  theme,
                  'تلفن',
                  '۰۲۱-۱۲۳۴۵۶۷۸',
                  Icons.phone_outlined,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Payment Settings
            _buildSettingsSection(
              theme,
              'تنظیمات پرداخت',
              [
                _buildSwitchItem(
                  theme,
                  'پرداخت آنلاین',
                  'فعال‌سازی درگاه پرداخت آنلاین',
                  Icons.payment,
                  true,
                ),
                _buildSwitchItem(
                  theme,
                  'پرداخت در محل',
                  'امکان پرداخت نقدی هنگام تحویل',
                  Icons.money,
                  true,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Notification Settings
            _buildSettingsSection(
              theme,
              'اعلان‌ها',
              [
                _buildSwitchItem(
                  theme,
                  'اعلان سفارشات',
                  'دریافت اعلان برای سفارشات جدید',
                  Icons.notifications_outlined,
                  true,
                ),
                _buildSwitchItem(
                  theme,
                  'اعلان ایمیل',
                  'ارسال اعلان‌ها به ایمیل',
                  Icons.email_outlined,
                  false,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Appearance Settings
            _buildSettingsSection(
              theme,
              'ظاهر',
              [
                _buildThemeSelector(theme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsSection(
    ThemeData theme,
    String title,
    List<Widget> children,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Divider(height: 1),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    ThemeData theme,
    String label,
    String value,
    IconData icon,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 20,
        ),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        value,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.edit_outlined, size: 20),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSwitchItem(
    ThemeData theme,
    String label,
    String subtitle,
    IconData icon,
    bool value,
  ) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: theme.colorScheme.primary,
          size: 20,
        ),
      ),
      title: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: (newValue) {},
      ),
    );
  }

  Widget _buildThemeSelector(ThemeData theme) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          Icons.palette_outlined,
          color: theme.colorScheme.primary,
          size: 20,
        ),
      ),
      title: Text(
        'تم رنگی',
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        'انتخاب تم روشن یا تیره',
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: SegmentedButton<String>(
        segments: const [
          ButtonSegment(
            value: 'light',
            icon: Icon(Icons.light_mode, size: 16),
          ),
          ButtonSegment(
            value: 'dark',
            icon: Icon(Icons.dark_mode, size: 16),
          ),
          ButtonSegment(
            value: 'system',
            icon: Icon(Icons.settings_suggest, size: 16),
          ),
        ],
        selected: const {'system'},
        onSelectionChanged: (Set<String> newSelection) {},
      ),
    );
  }
}
