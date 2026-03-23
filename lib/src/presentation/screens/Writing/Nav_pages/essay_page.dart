import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Writing/submit_button.dart';

class EssayPage extends StatelessWidget {
  final String question;
  const EssayPage({super.key, required this.question});

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
          "Essays",
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
          padding: const EdgeInsets.all(20),
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
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: const Column(
                  children: [
                    TextField(
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "Essay Title",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      maxLines: 3,
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "Introduction",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      maxLines: 8,
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "Body Paragraphs",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      maxLines: 3,
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "Conclusion",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
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
        color: const Color(0xfff2f2f2),
        child: SubmitButton(
          onPressed: () {
            log("Essay Submitted");
          },
        ),
      ),
    );
  }
}