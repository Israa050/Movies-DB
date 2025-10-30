
import 'package:flutter/material.dart';
import 'package:movies_db/core/themes/colors/app_colors.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: AppColors.inActiveButton,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor,),
      ),
      child: Center(
        child: Text('Action'),
      ),
    );
  }
}