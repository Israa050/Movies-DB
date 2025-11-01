import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_db/core/di/dependency_injection.dart';
import 'package:movies_db/core/global/cubit/app_theme_cubit.dart';
import 'package:movies_db/core/routing/app_router.dart';
import 'package:movies_db/core/routing/routes.dart';
import 'package:movies_db/core/themes/app_theme.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  await setupGetIt();
   await SentryFlutter.init(
    (options) {
      options.dsn = 'https://c40c749a308a0e714b96260034c7d32a@o4510288126738432.ingest.us.sentry.io/4510288139321344';
      // Adds request headers and IP for users, for more info visit:
      // https://docs.sentry.io/platforms/dart/guides/flutter/data-management/data-collected/
      options.sendDefaultPii = true;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AppThemeCubit>(),
      child: MyAppWidget(
        appRouter: AppRouter(),
      ),
    );
  }
}

class MyAppWidget extends StatelessWidget {

  AppRouter appRouter;
   MyAppWidget({super.key,required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: context.watch<AppThemeCubit>().isDark ? ThemeMode.dark : ThemeMode.light,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.moviesScreen,
      );
  }
}