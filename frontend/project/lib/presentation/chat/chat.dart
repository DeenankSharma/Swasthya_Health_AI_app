import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/presentation/chat/bloc/chat_bloc.dart';
import 'package:project/presentation/home/home.dart';
import 'package:project/presentation/profile/profile.dart';
import 'package:project/providers/screenIndexProvider.dart';
import 'package:provider/provider.dart';

class Chat extends StatelessWidget {
  final ChatBloc chatbloc =ChatBloc();

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    return BlocConsumer<ChatBloc, ChatState>(
      bloc: chatbloc,
      buildWhen: (previous,current)=>current is ChatActionState,
      listenWhen: (previous,current)=>current is ChatActionState,
      listener: (context, state) {},
      builder: (context, state) {
        if (currentScreenIndex == 0) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
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
            title: Text('Swasthya Chat',style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromRGBO(240, 56, 88, 1),
          ),
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    child: Column(children: [Text('kaise ho')],),
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
