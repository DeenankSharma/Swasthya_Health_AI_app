import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/presentation/chat/chat.dart';
import 'package:project/presentation/home/bloc/home_bloc.dart';
import 'package:project/presentation/profile/profile.dart';
import 'package:project/providers/screenIndexProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  final HomeBloc homebloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homebloc,
      buildWhen: (previous, current) => current is HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
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
            leading: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Icon(Icons.monitor_heart_outlined, color: Colors.white)),
            title: Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: Text(
                'Swasthya',
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            backgroundColor:
                const Color.fromRGBO(240, 56, 88, 1), // Background color
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(children: [
                  Padding(padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),child: Text("Trending",style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                    child:Opacity(opacity: 0.5,child: Container(
                      height: 300,
                      // color: Colors.cyan,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.cyan),
                    ),)
                    
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),child: Text("Recommendations",style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                    child:Opacity(opacity: 0.5,child:  Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.red),
                              
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 150,
                              width: 300,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 150,
                              width: 300,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 150,
                              width: 300,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Container(
                              height: 150,
                              width: 300,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.red),
                            ),
                          )
                        ],
                      ),
                      height: 300,
                      
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.cyan,),
                    ),)
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),child: Text("Articles/Blogs",style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),),),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                    child:Opacity(opacity: 0.5,child: Container(
                      height: 300,
                      // color: Colors.cyan,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0),color: Colors.cyan),
                    ),)
                    
                  ),
                ]),
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
