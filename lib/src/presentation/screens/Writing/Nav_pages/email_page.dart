import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Writing/submit_button.dart';

class FormalEmailPage extends StatelessWidget {
  final String question;
  const FormalEmailPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, size: 26, color: Colors.black),
        ),
        title: const Text(
          "Formal/Informal E-mails",
          style: TextStyle(
            fontSize: 21,
            fontFamily: "ClashDisplay",
            fontWeight: FontWeight.w600,
            color: Color(0xFFE2572F),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// QUESTION FROM JSON
              Text(
                question,
                style: const TextStyle(
                  fontSize: 19.5,
                  fontFamily: "ClashDisplay",
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        hintText: "From",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontFamily: "ClashDisplay",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 20),
                    TextField(
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        hintText: "To",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontFamily: "ClashDisplay",
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 20),
                    TextField(
                      maxLines: 8,
                      decoration: const InputDecoration(
                        hintText: "Good morning...",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        color: const Color(0xFFF4F4F4),
        child: SubmitButton(
          onPressed: () {
            log("Submit clicked");
          },
        ),
      ),
    );
  }
}