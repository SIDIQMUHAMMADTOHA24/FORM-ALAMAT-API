import 'package:flutter/material.dart';

import '../../bloc/export.dart';
import 'my_home_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlamatBloc()..add(FetechProvinsi()),
        )
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePages(),
    );
  }
}
