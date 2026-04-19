import 'package:bookly_app/Core/Utilits/go_router.dart';
import 'package:bookly_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnimationLogo extends StatefulWidget {
  const AnimationLogo({super.key});

  @override
  State<AnimationLogo> createState() => _AnimationLogoState();
}

class _AnimationLogoState extends State<AnimationLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    // 🎮 Animation controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // 📏 Size animation
    sizeAnimation = Tween<double>(
      begin: 100,
      end: 250, // 🔥 make it bigger here
    ).animate(controller);

    // ▶️ Start animation
    controller.forward();

    // ✅ Listen when animation finishes
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 🚀 Navigate AFTER animation ends
        GoRouter.of(context).pushReplacement(AppRouter.homeRoute);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose(); // 🧹 clean memory
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: sizeAnimation,
        builder: (context, child) {
          return SizedBox(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
            child: Image.asset(kLogoPath, fit: BoxFit.contain),
          );
        },
      ),
    );
  }
}
