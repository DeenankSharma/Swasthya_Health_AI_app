import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/presentation/auth/bloc/auth_bloc.dart';
import 'package:project/presentation/home/home.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback show;
  const LoginPage({super.key, required this.show});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  bool visibil = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SWASTHYA',
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            textfild(),
            SizedBox(height: 15.w),
            textfild2(),
            SizedBox(height: 8.h),
            have(),
            SizedBox(height: 20.h),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthRequestSuccessState) {
                  state.response.fold((left) {
                    _emailController.text = '';
                    _passwordController.text = '';
                    var snackbar = SnackBar(
                      content: Text(
                        left,
                        style: TextStyle(fontFamily: 'dana', fontSize: 14),
                      ),
                      backgroundColor: Colors.black,
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 1),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, (right) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Home()));
                  });
                }
              },
              builder: (context, state) {
                if (state is AuthLoadingState) {
                  return CircularProgressIndicator();
                }
                if (state is AuthInitState) {
                  return Login();
                }
                if (state is AuthRequestSuccessState) {
                  Widget widget = Text('');
                  state.response.fold((l) {
                    widget = Login();
                  }, (r) {
                    widget = Text(r);
                  });
                  return widget;
                }
                return Text('');
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding textfild() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18.sp, color: Colors.red),
          controller: _emailController,
          focusNode: _focusNode1,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email,
              color: _focusNode1.hasFocus ? Colors.red : Colors.red,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding textfild2() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          style: TextStyle(fontSize: 18.sp, color: Colors.red),
          controller: _passwordController,
          focusNode: _focusNode2,
          obscureText: visibil,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    visibil = !visibil;
                  });
                },
                child: Icon(
                  visibil ? Icons.visibility_off : Icons.visibility,
                  color: _focusNode2.hasFocus ? Colors.red : Colors.red,
                )),
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.key,
              color: _focusNode2.hasFocus ? Colors.red : Colors.red,
            ),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                width: 2.w,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row or() {
    return Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 1.5.w,
          endIndent: 4,
          indent: 20,
        )),
        Text(
          "OR",
          style: TextStyle(
            color: Colors.red,
            fontSize: 14,
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 1.5.w,
          endIndent: 20,
          indent: 4,
        ))
      ],
    );
  }

  Padding Login() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<AuthBloc>(context)
              .add(AuthLoginRequest(_emailController.text, _passwordController.text));
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  
  GestureDetector have() {
    return GestureDetector(
      onTap: widget.show,
      child: Text(
        "Don't have an account? Sign Up",
        style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            fontFamily: 'dana'),
      ),
    );
  }

  // Container logo() {
  //   return Container(
  //     height: 130.h,
  //     width: 130.w,
  //     decoration: const BoxDecoration(
  //       shape: BoxShape.circle,
  //       image: DecorationImage(
  //         image: AssetImage('images/logo.png'),
  //       ),
  //     ),
  //   );
  // }
}
