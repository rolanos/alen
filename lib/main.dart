import 'package:alen/features/articles/view/bloc/article_bloc.dart';
import 'package:alen/features/auth/view/bloc/auth_bloc.dart';
import 'package:alen/core/color_ui.dart';
import 'package:alen/features/forum/view/bloc/question_bloc.dart';
import 'package:alen/features/qr/view/bloc/qr_bloc.dart';
import 'package:alen/features/splash_creen.dart';
import 'package:alen/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = getRouter(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(Init()),
        ),
        BlocProvider(
          create: (context) => ArticleBloc()..add(GetAllArticle()),
        ),
        BlocProvider(
          create: (context) => QuestionBloc()..add(GetAllQuestions()),
        ),
        BlocProvider(
          create: (context) => QrBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsUi.scaffoldColor,
          fontFamily: 'Inter',
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 60, fontWeight: FontWeight.w600),
            titleMedium: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            titleSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
