import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/Writing/submit_button.dart';

class EssayPage extends StatelessWidget {
  const EssayPage({super.key});

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
          "Essays",
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
                "Write an essay about the importance of technology in education.",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "ClashDisplay",
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),

              /// ESSAY CARD
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

                    /// Essay Title
                    const TextField(
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

                    const SizedBox(height: 15),

                    /// Introduction
                    const TextField(
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

                    const SizedBox(height: 15),

                    /// Body
                    const TextField(
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

                    const SizedBox(height: 15),

                    /// Conclusion
                    const TextField(
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

      /// 🔹 FIXED SUBMIT BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        color: const Color(0xfff2f2f2),
        child: SubmitButton(
          onPressed: () {
            print("Essay Submitted");
          },
        ),
      ),
    );
  }
}
