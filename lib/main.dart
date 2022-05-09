import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/application/downloads/downloads_bloc.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/domain/core/dipentancy_injuction/injectable.dart';
import 'package:netflix_ui/presentation/main_page/screen_main_page.dart';

import 'application/fast_laugh/fastlaugh_bloc.dart';
import 'application/home/home_bloc.dart';
import 'application/hot_and_new/hotandnew_bloc.dart';
import 'application/search/search_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
        BlocProvider(create: (ctx) => getIt<FastlaughBloc>()),
        BlocProvider(create: (ctx) => getIt<HotandnewBloc>()),
        BlocProvider(create: (ctx) => getIt<HomeBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
