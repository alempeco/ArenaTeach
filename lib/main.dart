import 'package:arenazadatak/providers/auth_provider.dart';
import 'package:arenazadatak/screens/auth_screen.dart';
import 'package:arenazadatak/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'My ToDo App';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
        /* ChangeNotifierProxyProvider<AuthProvider, ToDoProvider>(
          update: (ctx, auth, previousToDos) => ToDoProvider(auth.token,
              auth.userId, previousToDos == null ? [] : previousToDos.toDoList),
          create: (ctx) => ToDoProvider('', '', []),
        ), */
      ],
      child: Consumer<AuthProvider>(
          builder: (ctx, auth, _) => MaterialApp(
                title: title,
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSwatch(primarySwatch: Colors.green)
                          .copyWith(secondary: Colors.white70),
                  scaffoldBackgroundColor: Colors.blueGrey,
                ),
                home: auth.isAuth
                    ? const HomeScreen()
                    /*:  FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? const SplashScreen() */
                    : const AuthScreen(),
              )

          /* initialRoute: '/',
          routes: {
            /* CrudToDoScreen.routeName: (ctx) => const CrudToDoScreen(
                  isEdit: false,
                ) */
            HomeScreen.routeName: (ctx) => const HomeScreen(), 
      
          },*/

          ),
    );
  }
}
