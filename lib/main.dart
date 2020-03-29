import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttermobiletemplate/bloc/bloc.dart';
import 'package:fluttermobiletemplate/repositories/authentication_repository.dart';
import 'package:fluttermobiletemplate/ui/pages/main_page.dart';
import 'package:fluttermobiletemplate/ui/themes.dart';
import 'package:fluttermobiletemplate/utils/app_localizations.dart';
import 'package:fluttermobiletemplate/utils/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SharedPrefsBloc>(
          create: (context) => SharedPrefsBloc(),
        ),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository = AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SharedPrefsBloc>(context).add(GetSharedPrefs());

    return MaterialApp(
      theme: Themes.getDarkTheme(),
      supportedLocales: [
        const Locale("en"),
        const Locale("ro"),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        return supportedLocales.firstWhere(
              (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
          orElse: () => supportedLocales.first,
        );
      },
      initialRoute: "main-page",
      routes: {
        "main-page": (context) => MultiBlocProvider(
              providers: [
                BlocProvider<RegisterBloc>(
                  create: (context) => RegisterBloc(authenticationRepository),
                ),
              ],
              child: MainPage(),
            ),
      },
    );
  }
}
