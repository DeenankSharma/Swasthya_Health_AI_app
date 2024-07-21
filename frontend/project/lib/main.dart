import 'package:flutter/material.dart';
import 'package:project/gitit/gitit.dart';
import 'package:project/presentation/chat/bloc/chat_bloc.dart';
import 'package:project/presentation/chat/chat.dart';
import 'package:project/presentation/home/bloc/home_bloc.dart';
import 'package:project/presentation/home/home.dart';
import 'package:project/presentation/auth/intro.dart';
import 'package:project/presentation/auth/login.dart';
import 'package:project/presentation/auth/register.dart';
import 'package:project/presentation/profile/bloc/profile_bloc.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/screenIndexProvider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getInitit();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<HomeBloc>(create: (context)=>HomeBloc()),
        Provider<ChatBloc>(create: (context)=>ChatBloc()),
        Provider<ProfileBloc>(create: (context)=>ProfileBloc()),
        ChangeNotifierProvider(create: (context) => screenIndexProvider())
      ],child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Color.fromRGBO(240, 56, 88, 1),textTheme: GoogleFonts.montserratTextTheme(),),
        home:Intro(),
      ),
    );
  }
}