import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/presentation/chat/chat.dart';
import 'package:project/presentation/home/bloc/home_bloc.dart';
import 'package:project/presentation/profile/profile.dart';
import 'package:project/providers/screenIndexProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Adding event to fetch recommendations on init
    context.read<HomeBloc>().add(RecommendationsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    final _screenindexprovider = Provider.of<screenIndexProvider>(context);
    int currentScreenIndex = _screenindexprovider.fetchCurrentScreenIndex;

    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is HomeState,
      listenWhen: (previous, current) => current is HomeState,
      listener: (context, state) {
        if (state is RecommendationsInitialFetchSuccessState) {
          // Handle any additional actions on state change if needed
        }
      },
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
              MaterialPageRoute(builder: (context) =>  Profile()),
            );
          });
        }
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: Icon(Icons.monitor_heart_outlined, color: Colors.white),
            ),
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
            backgroundColor: const Color.fromRGBO(240, 56, 88, 1), // Background color
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                      child: Text(
                        "Recommendations",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is RecommendationsInitialFetchSuccessState) {
                            final successState = state as RecommendationsInitialFetchSuccessState;
                            return SizedBox(
                              height: 250, // Ensure fixed height for ListView
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: successState.items.length,
                                itemBuilder: (context, index) {
                                  final item = successState.items[index];
                                  return Container(
                                    width: 200, // Set a fixed width for each item
                                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        // Handle tap if needed
                                        print('Tapped on: ${item.title}');
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Image.network(
                                                item.thumbnails,
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.title,
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 4.0),
                                                  Text(
                                                    item.channelTitle,
                                                    style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                      child: Text(
                        "Articles/Blogs",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          if (state is RecommendationsInitialFetchSuccessState) {
                            final successState = state as RecommendationsInitialFetchSuccessState;
                            return SizedBox(
                              height: 250, // Ensure fixed height for ListView
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: successState.items2.length,
                                itemBuilder: (context, index) {
                                  final item = successState.items2[index];
                                  return Container(
                                    width: 200, // Set a fixed width for each item
                                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: InkWell(
                                      onTap: () {
                                        // Handle tap if needed
                                        print('Tapped on: ${item.title}');
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(16.0),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Image.network(
                                                item.urlToImage,
                                                height: 80.0,
                                                width: 80.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(width: 16.0),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item.title,
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 4.0),
                                                  Text(
                                                    "By - " + item.author,
                                                    style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  const SizedBox(height: 4.0),
                                                  Text(
                                                    "By - " + item.description,
                                                    style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey,
                                                    ),
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
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
                      (currentScreenIndex == 0) ? Icons.home : Icons.home_outlined,
                      color: Colors.white,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      (currentScreenIndex == 1) ? Icons.chat_bubble : Icons.chat_bubble_outline,
                      color: Colors.white,
                    ),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      (currentScreenIndex == 2) ? Icons.person : Icons.person_outline,
                      color: Colors.white,
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
