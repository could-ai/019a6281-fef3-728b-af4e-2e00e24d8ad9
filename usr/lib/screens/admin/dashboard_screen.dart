import 'package:flutter/material.dart';
import '../../widgets/admin_layout.dart';
import '../../widgets/stat_card.dart';
import '../../widgets/chart_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;
    final isTablet = size.width > 768 && size.width <= 1024;

    return AdminLayout(
      currentRoute: '/admin/dashboard',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'داشبورد',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'خلاصه عملکرد فروشگاه شما',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),

            // Stats Grid
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 1;
                if (isDesktop) {
                  crossAxisCount = 4;
                } else if (isTablet) {
                  crossAxisCount = 2;
                } else if (size.width > 600) {
                  crossAxisCount = 2;
                }

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: isDesktop ? 1.5 : 1.8,
                  children: const [
                    StatCard(
                      title: 'کل فروش',
                      value: '۱۲۳,۴۵۶,۰۰۰',
                      unit: 'تومان',
                      icon: Icons.attach_money,
                      trend: 12.5,
                      color: Color(0xFF10B981),
                    ),
                    StatCard(
                      title: 'سفارشات',
                      value: '۱,۲۳۴',
                      unit: 'سفارش',
                      icon: Icons.shopping_cart_outlined,
                      trend: 8.2,
                      color: Color(0xFF3B82F6),
                    ),
                    StatCard(
                      title: 'مشتریان',
                      value: '۵,۶۷۸',
                      unit: 'کاربر',
                      icon: Icons.people_outline,
                      trend: 15.3,
                      color: Color(0xFF8B5CF6),
                    ),
                    StatCard(
                      title: 'محصولات',
                      value: '۴۵۶',
                      unit: 'محصول',
                      icon: Icons.inventory_2_outlined,
                      trend: -2.4,
                      color: Color(0xFFF59E0B),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 24),

            // Charts Row
            LayoutBuilder(
              builder: (context, constraints) {
                if (isDesktop) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ChartCard(
                          title: 'فروش ماهانه',
                          subtitle: 'آمار فروش ۶ ماه اخیر',
                          height: 300,
                          child: _buildSalesChart(theme),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ChartCard(
                          title: 'سفارشات امروز',
                          subtitle: '۱۲۴ سفارش جدید',
                          height: 300,
                          child: _buildRecentOrders(theme),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      ChartCard(
                        title: 'فروش ماهانه',
                        subtitle: 'آمار فروش ۶ ماه اخیر',
                        height: 300,
                        child: _buildSalesChart(theme),
                      ),
                      const SizedBox(height: 16),
                      ChartCard(
                        title: 'سفارشات امروز',
                        subtitle: '۱۲۴ سفارش جدید',
                        height: 300,
                        child: _buildRecentOrders(theme),
                      ),
                    ],
                  );
                }
              },
            ),
            const SizedBox(height: 24),

            // Recent Activity
            ChartCard(
              title: 'فعالیت‌های اخیر',
              subtitle: 'آخرین تغییرات در سیستم',
              child: _buildRecentActivity(theme),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSalesChart(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.show_chart,
            size: 64,
            color: theme.colorScheme.primary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'نمودار فروش',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentOrders(ThemeData theme) {
    final orders = [
      {'id': '#۱۲۳۴۵', 'amount': '۲,۵۰۰,۰۰۰ تومان', 'status': 'تکمیل شده'},
      {'id': '#۱۲۳۴۴', 'amount': '۱,۲۰۰,۰۰۰ تومان', 'status': 'در حال پردازش'},
      {'id': '#۱۲۳۴۳', 'amount': '۳,۸۰۰,۰۰۰ تومان', 'status': 'تکمیل شده'},
      {'id': '#۱۲۳۴۲', 'amount': '۹۵۰,۰۰۰ تومان', 'status': 'در انتظار'},
    ];

    return ListView.separated(
      shrinkWrap: true,
      itemCount: orders.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            order['id']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(order['amount']!),
          trailing: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _getStatusColor(order['status']!).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              order['status']!,
              style: TextStyle(
                color: _getStatusColor(order['status']!),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecentActivity(ThemeData theme) {
    final activities = [
      {
        'icon': Icons.add_shopping_cart,
        'title': 'سفارش جدید ثبت شد',
        'subtitle': 'سفارش #۱۲۳۴۵ توسط علی محمدی',
        'time': '۵ دقیقه پیش',
        'color': const Color(0xFF3B82F6),
      },
      {
        'icon': Icons.inventory_2,
        'title': 'محصول جدید اضافه شد',
        'subtitle': 'گوشی Samsung Galaxy S24',
        'time': '۱۵ دقیقه پیش',
        'color': const Color(0xFF10B981),
      },
      {
        'icon': Icons.person_add,
        'title': 'مشتری جدید ثبت‌نام کرد',
        'subtitle': 'سارا احمدی',
        'time': '۳۰ دقیقه پیش',
        'color': const Color(0xFF8B5CF6),
      },
      {
        'icon': Icons.local_shipping,
        'title': 'سفارش ارسال شد',
        'subtitle': 'سفارش #۱۲۳۴۰ به مقصد رسید',
        'time': '۱ ساعت پیش',
        'color': const Color(0xFFF59E0B),
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (activity['color'] as Color).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              activity['icon'] as IconData,
              color: activity['color'] as Color,
              size: 24,
            ),
          ),
          title: Text(
            activity['title'] as String,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(activity['subtitle'] as String),
          trailing: Text(
            activity['time'] as String,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'تکمیل شده':
        return const Color(0xFF10B981);
      case 'در حال پردازش':
        return const Color(0xFF3B82F6);
      case 'در انتظار':
        return const Color(0xFFF59E0B);
      default:
        return const Color(0xFF6B7280);
    }
  }
}
