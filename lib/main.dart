import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/bloc_observer/bloc_observer.dart';
import 'app/constant/const.dart';
import 'app/constantroute.dart';
import 'app/route/ongenerate_view.dart';
import 'business_logic/Auth/auth_cubit.dart';
import 'business_logic/home/home_cubit.dart';
import 'data/network/local/local_network.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  ConstantApp.token = await CacheNetwork.getCacheData(key: 'token');
  debugPrint("token is : ${ConstantApp.token}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CategoriesCubit()..getCategories()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // initialRoute: RouteConstants.loginRoute,
        initialRoute: ConstantApp.token != null && ConstantApp.token != ""
            ? RouteConstants.homeRoute
            : RouteConstants.loginRoute,
        onGenerateRoute: RouteGenerator.generateRoutes,
      ),
    );
  }
}
