import 'package:flutter/material.dart';
import 'package:mmvm_rest_apis_provider/resources/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;

  const RoundButton(
      {required this.title,
      this.loading = false,
      required this.onpress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 40,
        width: 200,
        decoration: BoxDecoration(
            color: AppColors.buttoncolor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: AppColors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: AppColors.white),
                  )),
      ),
    );
  }
}
