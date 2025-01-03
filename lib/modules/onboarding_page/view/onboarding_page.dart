import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gojek_clone/design_system/color_collection.dart';
import 'package:gojek_clone/design_system/typography_collection.dart';
import 'package:gojek_clone/modules/onboarding_page/controller/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  final List<Map<String, String>> onboardingData = [
    {
      "image": "lib/assets/onboarding_1.png",
      "title": "Selamat datang di gojek!",
      "description":
          "Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin  semua kebutuhan mu, kapanpun, dan di manapun",
    },
    {
      "image": "lib/assets/onboarding_2.png",
      "title": "Transportasi & logistik",
      "description":
          "Antarin kamu jalan atau ambilin barang lebih gampang tinggal  ngeklik doang~",
    },
    {
      "image": "lib/assets/onboarding_3.png",
      "title": "Pesan makan & belanja",
      "description": "Lagi ngidam sesuatu? Gojek beliin gak pakai lama.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/assets/logo.png', height: 20),
                Image.asset('lib/assets/Language.png', height: 20),
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: controller.updatePage,
              itemCount: onboardingData.length,
              itemBuilder: (context, index) => OnboardingContent(
                image: onboardingData[index]["image"]!,
                title: onboardingData[index]["title"]!,
                description: onboardingData[index]["description"]!,
              ),
            ),
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingData.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: controller.currentPage.value == index
                            ? ColorCollection.greenGojek
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Tambahkan ini agar Column tidak mengambil seluruh tinggi
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/form-login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorCollection.greenGojek,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/form-login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorCollection.white,
                    minimumSize: const Size(double.infinity, 50),
                    side: const BorderSide(color: ColorCollection.greenGojek),
                  ),
                  child: const Text(
                    "Belum ada akun?, Daftar dulu",
                    style: TextStyle(
                        fontSize: 16, color: ColorCollection.greenGojek),
                  ),
                ),
                const SizedBox(height: 20),
                Text.rich(
                  TextSpan(
                    text:
                        "Dengan masuk atau mendaftar, kamu menyetujui ", // Bagian teks biasa
                    style: TypographyCollection.paragraph2.copyWith(
                      color: ColorCollection.grey,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "Ketentuan layanan", // Bagian teks yang berwarna biru
                        style: TypographyCollection.paragraph2.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      const TextSpan(
                        text: " dan ", // Teks biasa lagi
                      ),
                      TextSpan(
                        text:
                            "Kebijakan privasi", // Bagian teks yang berwarna biru
                        style: TypographyCollection.paragraph2.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      const TextSpan(
                        text: ".", // Titik di akhir kalimat
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required int index}) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 8),
          height: 10,
          width: controller.currentPage.value == index ? 24 : 10,
          decoration: BoxDecoration(
            color: controller.currentPage.value == index
                ? Colors.blue
                : Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
        ));
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300),
        const SizedBox(height: 20),
        Text(
          title,
          style: TypographyCollection.h2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Text(
            description,
            style: TypographyCollection.paragraph1
                .copyWith(color: ColorCollection.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
