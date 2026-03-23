import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Writing/submit_button.dart';

class FormalEmailPage extends StatelessWidget {
  const FormalEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      /// 🔹 APP BAR (FIXED)
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F4F4),
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

      /// 🔹 BODY (SCROLLABLE)
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 20),

              /// QUESTION
              const Text(
                "Write a formal email to your school principal requesting a re-exam due to a medical emergency.",
                style: TextStyle(
                  fontSize: 19.5,
                  fontFamily: "ClashDisplay",
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 25),

              /// EMAIL CARD
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

                    /// FROM
                    TextField(
                      cursorColor: Colors.orange, // ✅ cursor color
                      decoration: const InputDecoration(
                        hintText: "From",
                        hintStyle: TextStyle(
                          fontFamily: "ClashDisplay",
                          color: Colors.grey,
                          fontSize: 16,
                        ),

                        border: InputBorder.none, // ❌ removes line
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

                    /// TO
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

                    /// MESSAGE FIELD
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

      /// 🔹 FIXED SUBMIT BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        color: const Color(0xFFF4F4F4),
        child:  SubmitButton(
          onPressed: () {
            log("Submit clicked");
          },
        ),
      ),
    );
  }
}
