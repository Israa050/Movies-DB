
import 'package:flutter/material.dart';
import 'package:movies_db/core/themes/colors/app_colors.dart';
import 'package:movies_db/features/movies/presentation/widgets/genre_container.dart';

class MovieCardInfo extends StatelessWidget {
  const MovieCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.lightPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.asset('name'),

          Column(
            children: [
              Text('Title',),
              Text('Title',),
              GenreContainer(),
            ],
          )
        ],
      ),
    );
  }
}