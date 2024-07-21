import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/presentation/auth/bloc/auth_bloc.dart';
// import 'auth_bloc.dart'; // Ensure you import the correct path to your AuthBloc file
import 'login.dart';
import 'register.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final AuthBloc authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoginState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(show: () {})),
            );
          } else if (state is AuthRegisterState) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => RegisterPage(show: () {})),
            );
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage(''),
                  //   fit: BoxFit.cover,
                  // ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SWASTHYA',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Text(
                      'AI powered Healthcare Companion',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton.icon(
                      onPressed: () {
                        authBloc.add(LoginButtonPressedEvent());
                      },
                      icon: const Icon(Icons.login, color: Colors.white),
                      label: const Text('Login'),
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
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        authBloc.add(RegisterButtonPressedEvent());
                      },
                      icon: const Icon(Icons.person_add, color: Colors.white),
                      label: const Text('Register'),
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
        ),
      ),
    );
  }
}
