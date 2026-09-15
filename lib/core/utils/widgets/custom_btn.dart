import 'package:chatbot_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.onTap, required this.title, this.icon});
  final void Function()? onTap;
  final String title;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        elevation: 4,
        color: AppColors.orangeColor,
        shadowColor: AppColors.orangeColor,
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 18)),
              icon == null ? SizedBox.shrink() : icon!,
            ],
          ),
        ),
      ),
    );
  }
}
