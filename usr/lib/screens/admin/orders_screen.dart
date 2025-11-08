import 'package:flutter/material.dart';
import '../../widgets/admin_layout.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AdminLayout(
      currentRoute: '/admin/orders',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'سفارشات',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'مدیریت سفارشات مشتریان',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),

            // Status Filters
            _buildStatusFilters(theme),
            const SizedBox(height: 24),

            // Orders List
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _buildOrdersList(theme),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusFilters(ThemeData theme) {
    final filters = [
      {'label': 'همه', 'count': '۱۲۳', 'color': theme.colorScheme.primary},
      {'label': 'در انتظار', 'count': '۴۵', 'color': const Color(0xFFF59E0B)},
      {'label': 'در حال پردازش', 'count': '۳۲', 'color': const Color(0xFF3B82F6)},
      {'label': 'تکمیل شده', 'count': '۴۶', 'color': const Color(0xFF10B981)},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: FilterChip(
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(filter['label'] as String),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: (filter['color'] as Color).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      filter['count'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: filter['color'] as Color,
                      ),
                    ),
                  ),
                ],
              ),
              selected: filter['label'] == 'همه',
              onSelected: (selected) {},
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOrdersList(ThemeData theme) {
    final orders = [
      {
        'id': '#۱۲۳۴۵',
        'customer': 'علی محمدی',
        'date': '۱۴۰۳/۰۱/۱۵',
        'amount': '۲,۵۰۰,۰۰۰',
        'status': 'تکمیل شده',
        'items': '۳',
      },
      {
        'id': '#۱۲۳۴۴',
        'customer': 'سارا احمدی',
        'date': '۱۴۰۳/۰۱/۱۵',
        'amount': '۱,۲۰۰,۰۰۰',
        'status': 'در حال پردازش',
        'items': '۲',
      },
      {
        'id': '#۱۲۳۴۳',
        'customer': 'رضا کریمی',
        'date': '۱۴۰۳/۰۱/۱۴',
        'amount': '۳,۸۰۰,۰۰۰',
        'status': 'تکمیل شده',
        'items': '۵',
      },
      {
        'id': '#۱۲۳۴۲',
        'customer': 'مریم رضایی',
        'date': '۱۴۰۳/۰۱/۱۴',
        'amount': '۹۵۰,۰۰۰',
        'status': 'در انتظار',
        'items': '۱',
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: orders.length,
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final order = orders[index];
        return ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_bag_outlined,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          title: Row(
            children: [
              Text(
                order['id']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                order['customer']!,
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          subtitle: Text('${order['items']} محصول • ${order['date']}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${order['amount']} تومان',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusColor(order['status']!).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      order['status']!,
                      style: TextStyle(
                        color: _getStatusColor(order['status']!),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 16),
                onPressed: () {},
              ),
            ],
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
