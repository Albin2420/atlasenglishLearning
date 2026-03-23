import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Writing/submit_button.dart';

class ApplicationPage extends StatelessWidget {
  final String question;
  const ApplicationPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f2f2),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Applications / CV",
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              /// QUESTION FROM JSON
              Text(
                question,
                style: const TextStyle(
                  fontSize: 17,
                  fontFamily: "ClashDisplay",
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
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
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontFamily: "ClashDisplay"),
                    ),
                    const Divider(),
                    const SizedBox(height: 15),
                    TextField(
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        hintText: "To",
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontFamily: "ClashDisplay"),
                    ),
                    const Divider(),
                    const SizedBox(height: 15),
                    TextField(
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        hintText: "Subject",
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontFamily: "ClashDisplay"),
                    ),
                    const Divider(),
                    const SizedBox(height: 15),
                    TextField(
                      maxLines: 8,
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        hintText: "Write your application here...",
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontFamily: "ClashDisplay"),
                    ),
                    const Divider(),
                    const SizedBox(height: 15),
                    TextField(
                      cursorColor: Colors.orange,
                      decoration: const InputDecoration(
                        hintText: "Yours faithfully / sincerely",
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(fontFamily: "ClashDisplay"),
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
        color: const Color(0xfff2f2f2),
        child: SubmitButton(
          onPressed: () {
            log("Application Submitted");
          },
        ),
      ),
    );
  }
}