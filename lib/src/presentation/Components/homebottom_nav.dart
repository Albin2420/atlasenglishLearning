import 'package:flutter/material.dart';

class HomeHeaderWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const HomeHeaderWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        alignment: Alignment.center,
        children: [

          /// 🔹 Background split
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(color: Colors.transparent),
              ),
              Expanded(
                flex: 1,
                child: Container(color: const Color(0xFF3BC0A6)),
              ),
            ],
          ),

          /// 🔹 Circular icon container
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF3BC0A6),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  "assets/images/home.png",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
