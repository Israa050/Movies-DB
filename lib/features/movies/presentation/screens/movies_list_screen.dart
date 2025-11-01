
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db/core/global/cubit/app_theme_cubit.dart';
import 'package:movies_db/features/movies/presentation/widgets/movies_list_builder.dart';

class MoviesListScreen extends StatelessWidget {

   const MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('🎬'),
            Text(
              ' Movies',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){
             context.read<AppThemeCubit>().toggleTheme();
          }, icon:  Icon(context.watch<AppThemeCubit>().isDark ?Icons.light_mode : Icons.dark_mode ,color: Colors.white,))],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15,),
        child: Column(
          children: [

            MoviesListBuilder(),
          ],
        ),
      ),
    );
  }
}
