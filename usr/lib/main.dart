import 'package:flutter/material.dart';
import 'screens/admin/dashboard_screen.dart';
import 'screens/admin/products_screen.dart';
import 'screens/admin/categories_screen.dart';
import 'screens/admin/orders_screen.dart';
import 'screens/admin/customers_screen.dart';
import 'screens/admin/settings_screen.dart';
import 'screens/shop/home_screen.dart';
import 'screens/shop/product_detail_screen.dart';
import 'screens/shop/cart_screen.dart';
import 'screens/shop/checkout_screen.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMS فروشگاهی',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Vazir',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6366F1),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Vazir',
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/login',
      routes: {
        '/': (context) => const LoginScreen(),
        '/login': (context) => const LoginScreen(),
        '/admin/dashboard': (context) => const DashboardScreen(),
        '/admin/products': (context) => const ProductsScreen(),
        '/admin/categories': (context) => const CategoriesScreen(),
        '/admin/orders': (context) => const OrdersScreen(),
        '/admin/customers': (context) => const CustomersScreen(),
        '/admin/settings': (context) => const SettingsScreen(),
        '/shop/home': (context) => const HomeScreen(),
        '/shop/product': (context) => const ProductDetailScreen(),
        '/shop/cart': (context) => const CartScreen(),
        '/shop/checkout': (context) => const CheckoutScreen(),
      },
    );
  }
}
