// import 'package:flutter/material.dart';
// import 'home.dart';
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cats VS Dogs',
//       home: Home(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
import 'package:meddetect/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:meddetect/core/theme/theme.dart';
import 'package:meddetect/features/auth/presentation/bloc/auth_bloc.dart';
//import 'package:meddetect/features/auth/presentation/pages/login_page.dart';
//import 'package:meddetect/home.dart';
import 'package:meddetect/splash.dart';
import 'package:meddetect/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meddetect/features/auth/presentation/pages/selection_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brain tumor detection',
      theme: AppTheme.darkThemeMode,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, isLoggedIn) {
          if (isLoggedIn) {
            return SelectionScreen();
          }
          return  SplashScreen();
        },
      ),
    );
  }
}
