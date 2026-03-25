import 'package:atlas_learning/src/presentation/widgets/HomeScreen/daily_speak.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../controller/HomeScreen/home_screen_controller.dart';
import '../../widgets/HomeScreen/topic_card.dart';
import '../Listening/listening_page.dart';
import '../Reading/reading_page.dart';
import '../Speaking/speaking_page.dart';
import '../Writing/writing_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                /// HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 10),
                        Text(
                          "Hello",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'ClashDisplay',
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "John Doe",
                          style: TextStyle(
                            fontSize: 32,
                            fontFamily: 'ClashDisplay',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 29),
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(
                        'assets/images/default_profile.png',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                DailySpeak(
                  onTap: () {
                  },
                ),
                const SizedBox(height: 30),

                SizedBox(
                  height: 42,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.tabs.length,
                    itemBuilder: (context, index) {
                      return Obx(() {
                        final isSelected =
                            controller.selectedTab.value == index;

                        return GestureDetector(
                          onTap: () => controller.changeTab(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF2563EB)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: isSelected
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10,
                                      ),
                                    ],
                            ),
                            child: Text(
                              controller.tabs[index],
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'ClashDisplay',
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black54,
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  ),
                ),

                const SizedBox(height: 25),

                /// GRID
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 18,
                  mainAxisSpacing: 18,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    TopicCard(
                      title: "Writing",
                      image: "assets/images/write.png",
                      onTap: () {
                        Get.to(() => WritingPage());
                      },
                    ),
                    TopicCard(
                      title: "Speaking",
                      image: "assets/images/speak.png",
                      onTap: () {
                        Get.to(() => SpeakingPage());
                      },
                    ),
                    TopicCard(
                      title: "Listening",
                      image: "assets/images/listen.png",
                      onTap: () {
                        Get.to(() => ListeningPage());
                      },
                    ),
                    TopicCard(
                      title: "Reading",
                      image: "assets/images/read.png",
                      onTap: () {
                        Get.to(() => ReadingPage());
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
