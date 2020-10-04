import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/lang/lang_bloc.dart';
import 'package:localization/lang/lang_event.dart';
import 'package:localization/lang/lang_state.dart';
import 'package:localization/localization/translations.dart';

import 'localization/app_localizations.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LanguageBloc>(
      create: (_) => LanguageBloc()..add(AppStart()),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, snapshot) {
      LanguageBloc languageBloc = BlocProvider.of(context);

      return MaterialApp(
        title: 'Flutter Demo',
        supportedLocales: [
          Locale('ar', 'EG'),
          Locale('en', 'US'),
        ],
        locale: Locale(languageBloc.lang),
        localizationsDelegates: [
          // THIS CLASS WILL BE ADDED LATER
          // A class which loads the translations from JSON files
          AppLocalizations.delegate,
          // Built-in localization of basic text for Material widgets
          GlobalMaterialLocalizations.delegate,
          // Built-in localization for text direction LTR/RTL
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          DefaultCupertinoLocalizations.delegate
        ],
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    LanguageBloc languageBloc = BlocProvider.of(context);
    print(languageBloc.lang);
    languageBloc
        .add(ChangeLanguage(lang: languageBloc.lang == 'en' ? 'ar' : 'en'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizations.of(context).translate(kName),
            ),
            Text(
              AppLocalizations.of(context).translate(kHello),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
