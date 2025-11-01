import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_db/core/themes/app_theme.dart';
import 'package:movies_db/core/themes/colors/app_colors.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';
import 'package:movies_db/features/movies/presentation/widgets/genre_container.dart';

class MovieCardInfo extends StatelessWidget {
  Movie movie;
  MovieCardInfo({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        //color: AppColors.lightPurple: ,
        color: Theme.of(
          context,
        ).extension<AppThemeExtension>()?.getContainerColor(context),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Row(
          children: [
            Hero(
              tag: movie.id!,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: CachedNetworkImageProvider('https://image.tmdb.org/t/p/w500${movie.posterPath}',),fit: BoxFit.cover)
                ),
              ),
            ),

            // horizontalPadding(5),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      maxLines: 1,
                      movie.title ?? 'Spider Man',
                      style: Theme.of(context).textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star,color: AppColors.yellow,),
                      Text(
                        movie.voteAverage!.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  GenreContainer(),
                ],
              ),
            ),

         //   Expanded(child: horizontalPadding(10)),

         //   IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
           // horizontalPadding(1),
          ],
        ),
      ),
    );
  }
}
