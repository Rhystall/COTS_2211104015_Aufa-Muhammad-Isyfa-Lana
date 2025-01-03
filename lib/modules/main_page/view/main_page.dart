import 'package:flutter/material.dart';
import 'package:gojek_clone/design_system/color_collection.dart';
import 'package:gojek_clone/modules/main_page/widgets/bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: ColorCollection.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search,
                        color: Colors.black), // Ikon search
                    const SizedBox(width: 8), // Spacer
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Find services, food, or places",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorCollection.white,
              ),
              child: const Icon(Icons.person,
                  color: ColorCollection.greenGojek), // Ikon person
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Gopay Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Rp 43.434",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _GopayIcon(icon: Icons.add, label: "Top Up"),
                        SizedBox(width: 10),
                        _GopayIcon(icon: Icons.payment, label: "Pay"),
                        SizedBox(width: 10),
                        _GopayIcon(icon: Icons.explore, label: "Explore"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Services Section
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              _ServiceIcon(icon: Icons.motorcycle, label: "GoRide"),
              _ServiceIcon(icon: Icons.local_dining, label: "GoFood"),
              _ServiceIcon(icon: Icons.shopping_cart, label: "GoMart"),
              _ServiceIcon(icon: Icons.delivery_dining, label: "GoSend"),
              _ServiceIcon(icon: Icons.local_taxi, label: "GoCar"),
              _ServiceIcon(icon: Icons.local_offer, label: "Promo"),
              _ServiceIcon(icon: Icons.more_horiz, label: "More"),
            ],
          ),

          const SizedBox(height: 20),

          // Promos Section
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal, // Scroll secara horizontal
              children: [
                Container(
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Membuat sudut membulat
                    ),
                    color: Colors.white, // Warna background putih
                    elevation: 2, // Memberikan sedikit bayangan
                    child: Padding(
                      padding:
                          const EdgeInsets.all(12.0), // Padding di dalam card
                      child: Center(
                        child: Text(
                          "Restos near me",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Membuat sudut membulat
                    ),
                    color: Colors.white, // Warna background putih
                    elevation: 2, // Memberikan sedikit bayangan
                    child: Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.all(12.0), // Padding di dalam card
                        child: Text(
                          "Best-seller in my area",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Tambahkan card lainnya sesuai kebutuhan
              ],
            ),
          ),

          const SizedBox(height: 10),
          _PromoCard(
            imageUrl: 'lib/assets/promo1.png',
            title: "Makin Seru",
            description: "Aktifkan sambungkan Gopay di Tokopedia",
          ),
          _PromoCard(
            imageUrl: 'lib/assets/promo2.png',
            title: "Makin Seru",
            description: "Sambungkan akun ke Tokopedia, banyak untung!",
          ),
          _PromoCard(
            imageUrl: 'lib/assets/promo3.png',
            title: "Bayar Apa Aja",
            description: "Lebih hemat pakai Gopay!",
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class _GopayIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _GopayIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ServiceIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.green),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _PromoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const _PromoCard({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Membulatkan sudut
      ),
      elevation: 2, // Memberikan efek bayangan
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Promo
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Promo
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                // Deskripsi Promo
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
