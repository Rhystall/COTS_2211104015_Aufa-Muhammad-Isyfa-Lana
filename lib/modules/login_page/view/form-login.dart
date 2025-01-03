import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gojek_clone/design_system/color_collection.dart';
import 'package:gojek_clone/design_system/typography_collection.dart';

class FormLoginPage extends StatelessWidget {
  FormLoginPage({super.key});

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('lib/assets/logo.png', height: 20),
            Icon(
              Icons.question_mark_sharp,
              color: ColorCollection.grey,
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TypographyCollection.h1,
            ),
            Text(
              'Enter your registered phone number to log in',
              style: TypographyCollection.subhead1.copyWith(
                color: ColorCollection.grey,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Phone number*',
              style: TextStyle(fontSize: 14, color: ColorCollection.grey),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text('+62', style: TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  const VerticalDivider(thickness: 1, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'Enter phone number',
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Issue with number?',
                style:
                    TextStyle(color: ColorCollection.greenGojek, fontSize: 14),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/main');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorCollection.greenGojek,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
