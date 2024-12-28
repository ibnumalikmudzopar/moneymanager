import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/navigation_provider.dart';
import 'views/home_screen.dart';
import 'views/insight_screen.dart';
import 'views/wallet_screen.dart';
import 'views/more_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    // List of screens corresponding to each tab
    final screens = [
      HomeScreen(),
      InsightScreen(),
      WalletScreen(),
      MoreScreen(),
    ];

    return Scaffold(
      // Menggunakan IndexedStack
      body: IndexedStack(
        index: currentIndex, // Index dari BottomNavigationBar
        children: screens,   // Semua widget tetap tersimpan di IndexedStack
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 0 ? Icons.home_filled : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24, 
              child: SvgPicture.asset(
                currentIndex == 1 ? 'assets/icons/insight_filled.svg' : 'assets/icons/insight_outlined.svg'
              ),
            ),
            label: 'Insight',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              currentIndex == 2 ? Icons.account_balance_wallet : Icons.account_balance_wallet_outlined,
            ),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 24,
              height: 24, 
              child: SvgPicture.asset(
                currentIndex == 3 ? 'assets/icons/more_filled.svg' : 'assets/icons/more_outlined.svg'
              ),
            ),
            label: 'More',
          ),
        ],
        selectedItemColor: Colors.white, // Warna untuk tab yang aktif
        unselectedItemColor: Colors.white, // Warna untuk tab yang tidak aktif
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        enableFeedback: false,
        showSelectedLabels: true,
        showUnselectedLabels: false,
      ),
    );
  }
}
