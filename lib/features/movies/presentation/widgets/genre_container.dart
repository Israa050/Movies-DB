
import 'package:flutter/material.dart';
import 'package:movies_db/core/themes/app_theme.dart';
import 'package:movies_db/core/themes/colors/app_colors.dart';

class GenreContainer extends StatelessWidget {
  const GenreContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).extension<ContainerThemeExtension>()?.containerColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor,),
      ),
      child: Center(
        child: Text('Action',style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }
}