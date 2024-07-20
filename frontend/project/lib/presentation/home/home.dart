import 'package:flutter/material.dart';
import 'package:project/presentation/chat/chat.dart';
import 'package:project/presentation/home/bloc/home_bloc.dart';
import 'package:project/presentation/profile/profile.dart';
import 'package:project/providers/screenIndexProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final HomeBloc homebloc =HomeBloc();


  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      buildWhen: (previous,current)=>current is HomeActionState,
      listenWhen: (previous,current)=>current is HomeActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (currentScreenIndex == 1) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Chat()),
            );
          });
        }
        if (currentScreenIndex == 2) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          });
        }
        return Scaffold(
          appBar: AppBar(
            title: Text('Hi Deenank',style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromRGBO(240, 56, 88, 1),
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    child: Column(children: [Text('hello ji')],),
                  ),
                ),
              ),
              BottomNavigationBar(
                currentIndex: currentScreenIndex,
                onTap: (value) {
                  _screenindexprovider.updateScreenIndex(value);
                },
                backgroundColor: Colors.redAccent.shade400,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      (currentScreenIndex == 0)
                          ? Icons.home
                          : Icons.home_outlined,
                      color: (currentScreenIndex == 0)
                          ? Colors.white
                          : Colors.white,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      (currentScreenIndex == 1)
                          ? Icons.chat_bubble
                          : Icons.chat_bubble_outline,
                      color: (currentScreenIndex == 1)
                          ? Colors.white
                          : Colors.white,
                    ),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      (currentScreenIndex == 2)
                          ? Icons.person
                          : Icons.person_outline,
                      color: (currentScreenIndex == 2)
                          ? Colors.white
                          : Colors.white,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ],
          ),
          
        );
      },
    );
  }
}