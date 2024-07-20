import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/presentation/login_page/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SWASTHYA',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 40
                    )
                  ),
                
                ),
                Text(
                  'AI powered Healthcare Companion',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      color: Colors.red,
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                    )
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  onPressed:(){loginBloc.add(LoginButtonClickedEvent());} ,
                  icon: const Icon(Icons.login, color: Colors.white),
                  label: const Text('Login with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}