import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gojek_clone/modules/main_page/view/main_page.dart';
import 'package:gojek_clone/modules/main_page/view/order_page.dart';
import 'package:gojek_clone/modules/main_page/view/promo_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan index
    switch (index) {
      case 0:
        Get.off(() => MainPage()); // Navigasi ke MainPage
        break;
      case 1:
        Get.to(() => PromoPage()); // Navigasi ke PromoPage
        break;
      case 2:
        Get.to(() => OrderPage()); // Navigasi ke OrderPage
        break;
      case 3:
        Get.to(() => OrderPage()); // Navigasi ke ChatPage
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      iconSize: 40, // Ukuran ikon tetap konsisten
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: TextStyle(color: Colors.black),
      unselectedLabelStyle: TextStyle(color: Colors.black),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type:
          BottomNavigationBarType.fixed, // Tipe fixed untuk mencegah pembesaran
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 0
                ? 'lib/assets/icons/home_active.png' // Ikon aktif
                : 'lib/assets/icons/home_inactive.png', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 1
                ? 'lib/assets/icons/promo_active.png' // Ikon aktif
                : 'lib/assets/icons/promo_inactive.png', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Promos',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 2
                ? 'lib/assets/icons/order_active.png' // Ikon aktif
                : 'lib/assets/icons/order_inactive.png', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            _selectedIndex == 3
                ? 'lib/assets/icons/chat_active.png' // Ikon aktif
                : 'lib/assets/icons/chat_inactive.png', // Ikon tidak aktif
            width: 40,
            height: 40,
          ),
          label: 'Chat',
        ),
      ],
    );
  }
}
