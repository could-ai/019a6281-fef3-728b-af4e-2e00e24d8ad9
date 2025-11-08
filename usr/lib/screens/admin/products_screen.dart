import 'package:flutter/material.dart';
import '../../widgets/admin_layout.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 1024;

    return AdminLayout(
      currentRoute: '/admin/products',
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
                      'محصولات',
                      style: theme.textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'مدیریت محصولات فروشگاه',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                FilledButton.icon(
                  onPressed: () {
                    // TODO: Add product
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('افزودن محصول'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Products Grid
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search and Filter
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'جستجوی محصول...',
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.filter_list),
                          label: const Text('فیلتر'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Products Table
                    _buildProductsTable(theme, isDesktop),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsTable(ThemeData theme, bool isDesktop) {
    final products = [
      {
        'name': 'گوشی Samsung Galaxy S24',
        'category': 'موبایل',
        'price': '۲۵,۰۰۰,۰۰۰',
        'stock': '۱۵',
        'status': 'موجود',
      },
      {
        'name': 'لپ‌تاپ Dell XPS 13',
        'category': 'لپ‌تاپ',
        'price': '۴۵,۰۰۰,۰۰۰',
        'stock': '۸',
        'status': 'موجود',
      },
      {
        'name': 'هدفون Sony WH-1000XM5',
        'category': 'صوتی',
        'price': '۱۲,۰۰۰,۰۰۰',
        'stock': '۰',
        'status': 'ناموجود',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('نام محصول', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('دسته‌بندی', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('قیمت', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('موجودی', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('وضعیت', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('عملیات', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: products.map((product) {
          return DataRow(
            cells: [
              DataCell(Text(product['name']!)),
              DataCell(Text(product['category']!)),
              DataCell(Text('${product['price']} تومان')),
              DataCell(Text(product['stock']!)),
              DataCell(
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: product['status'] == 'موجود'
                        ? const Color(0xFF10B981).withOpacity(0.1)
                        : const Color(0xFFEF4444).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    product['status']!,
                    style: TextStyle(
                      color: product['status'] == 'موجود'
                          ? const Color(0xFF10B981)
                          : const Color(0xFFEF4444),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              DataCell(
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit_outlined, size: 20),
                      onPressed: () {},
                      color: theme.colorScheme.primary,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20),
                      onPressed: () {},
                      color: const Color(0xFFEF4444),
                    ),
                  ],
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
