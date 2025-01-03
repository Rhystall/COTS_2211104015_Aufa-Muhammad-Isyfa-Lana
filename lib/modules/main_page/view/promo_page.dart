import 'package:flutter/material.dart';
import 'package:gojek_clone/design_system/typography_collection.dart';
import 'package:gojek_clone/modules/main_page/widgets/bottom_navigation_bar.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Promo",
          style: TypographyCollection.h1,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Text("Page Promo"),
          ),
          CustomBottomNavigationBar(),
        ],
      ),
    );
  }
}
