import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_details.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentPage = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(children: [item(0), item(1)]),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (a) {
                  currentPage = a;
                  setState(() {});
                },
                children: const [ChatScreen(), ChatScreen()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget item(int i) {
    return Expanded(
      child: InkWell(
        onTap: () {
          pageController.animateToPage(
            i,
            duration: const Duration(seconds: 1),
            curve: Curves.linearToEaseOut,
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          color: currentPage == i ? Colors.lightBlue : null,
          alignment: Alignment.center,
          child: Text(
            ['Chats', 'Online'][i],
            style: TextStyle(
              fontSize: 18,
              color: currentPage == i ? Colors.white : null,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (_, li) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const ChatDetailsScreen(),
                ),
              );
            },
            leading: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
            ),
            title: const Text(
              'Bayo Israel',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: const Text(
              'Online',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        });
  }
}
