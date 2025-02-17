import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/views/pages/connections_page.dart';
import 'package:mentor_hub_mobile/views/pages/feed_page.dart';
import 'package:mentor_hub_mobile/views/pages/messages_page.dart';
import 'package:mentor_hub_mobile/views/pages/notifications_page.dart';
import 'package:mentor_hub_mobile/views/pages/profile_page.dart';
import 'package:mentor_hub_mobile/views/pages/rooms_page.dart';
import 'package:mentor_hub_mobile/views/widgets/navbar_widget.dart';
import 'package:mentor_hub_mobile/views/widgets/useravatar_widget.dart';

List<Widget> pages = [
  FeedPage(),
  ConnectionsPage(),
  MessagesPage(),
  ProfilePage(),
  NotificationsPage(),
  RoomsPage()
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Felipey';

    return Scaffold(
        appBar: AppBar(
          title: TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage())),
              child: Row(
                children: [
                  UserAvatar(
                    imageUrl: 'assets/images/user2.jpg',
                    name: title,
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Seja bem-vindo",
                        style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 255, 174, 0),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              )),
          actions: [
            OutlinedButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsPage()))
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade800),
              ),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Container(
              color: const Color.fromARGB(40, 158, 158, 158),
              height: 1.0,
            ),
          ),
        ),
        body: Center(
          child: Text("Pages"),
        ),
        // ValueListenableBuilder(
        //   valueListenable: selectedPageNotifier,
        //   builder: (context, selectedPage, child) {
        //     return pages.elementAt(selectedPage);
        //   },
        bottomNavigationBar: NavbarWidget());
  }
}
