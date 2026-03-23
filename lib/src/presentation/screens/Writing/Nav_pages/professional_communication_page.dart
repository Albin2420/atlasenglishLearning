import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Writing/submit_button.dart';

class ProfessionalCommunicationPage extends StatelessWidget {
  const ProfessionalCommunicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2),

      /// 🔹 FIXED APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xfff2f2f2),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text(
          "Professional Communication",
          style: TextStyle(
            fontSize: 21,
            fontFamily: "ClashDisplay",
            fontWeight: FontWeight.w600,
            color: Color(0xFFE2572F),
          ),
        ),
      ),

      /// 🔹 SCROLLABLE BODY
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Instruction
              const Text(
                "Write a professional message to your manager requesting a meeting to discuss a project update.",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "ClashDisplay",
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              /// CARD
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

                child: Column(
                  children: [

                    /// Recipient
                    const TextField(
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "To / Recipient",
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

                    const SizedBox(height: 15),

                    /// Subject
                    const TextField(
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "Subject / Topic",
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

                    const SizedBox(height: 15),

                    /// Message
                    const TextField(
                      maxLines: 8,
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "Write your professional message here...",
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

                    const SizedBox(height: 15),

                    /// Closing
                    const TextField(
                      style: TextStyle(fontFamily: "ClashDisplay"),
                      decoration: InputDecoration(
                        hintText: "Regards / Thank you",
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

      /// 🔹 FIXED SUBMIT BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        color: const Color(0xfff2f2f2),
        child: SubmitButton(
          onPressed: () {
            print("Professional Communication Submitted");
          },
        ),
      ),
    );
  }
}
