import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_db/core/helper/spacing.dart';
import 'package:movies_db/core/themes/styles/text_styles.dart';
import 'package:movies_db/features/movies/data/models/api_response.dart';

class MovieDetailsScreen extends StatelessWidget {
  Movie movie;
   MovieDetailsScreen({super.key,required this.movie});

  String overView = 'When a downtrodden janitor, Winston Gooze, is exposed to a catastrophic toxic accident,' 'he’s transformed into a new kind of hero: The Toxic Avenger. Now, Toxie must rise from outcast to savior, taking on ruthless corporate overlords and corrupt forces who threaten his son, his friends, and his community.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        
            Hero(
              tag: movie.id!,
              child: Container(
                height: 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  //image: DecorationImage(image: AssetImage('assets/images/spider_man.jpeg'),fit: BoxFit.cover),
                  image: DecorationImage(image: CachedNetworkImageProvider('https://image.tmdb.org/t/p/w500${movie.posterPath}'),fit: BoxFit.cover),
                ),
              ),
            ),
        
            verticalPadding(20),

            
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: Text(movie.title?? 'Spider man',style: Theme.of(context).textTheme.headlineSmall,),
            ),

             Padding(
               padding: const EdgeInsets.only(left:15, right: 15),
               child: Text(movie.overview?? overView,style: Theme.of(context).textTheme.bodyLarge,),
             ),

             verticalPadding(10),

        
        
          ],
        ),
      ),
    );
  }

  Widget descriptionSection(BuildContext context){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
        child: Column(
          children: [
      
            Text('Spider man',style: TextStyles.font16BlackSemiBold,),
            verticalPadding(10),
            Expanded(child: Text('Description',style:  TextStyles.font16BlackSemiBold,)),
        
          ],
        ),
      ),
    );
  }
}
