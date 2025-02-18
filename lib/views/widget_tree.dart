import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/models.dart';
import 'package:mentor_hub_mobile/data/notifiers.dart';
import 'package:mentor_hub_mobile/views/pages/connections_page.dart';
import 'package:mentor_hub_mobile/views/pages/feed_page.dart';
import 'package:mentor_hub_mobile/views/pages/messages_page.dart';
import 'package:mentor_hub_mobile/views/pages/my_profile_page/my_profile_page.dart';
import 'package:mentor_hub_mobile/views/pages/notifications_page.dart';
import 'package:mentor_hub_mobile/views/pages/rooms_page.dart';
import 'package:mentor_hub_mobile/views/pages/settings_page/settings_page.dart';
import 'package:mentor_hub_mobile/views/widgets/navbar_widget.dart';
import 'package:mentor_hub_mobile/views/widgets/useravatar_widget.dart';

List<Widget> pages = [
  FeedPage(),
  ConnectionsPage(),
  RoomsPage(),
  MessagesPage(),
  SettingsPage()
];

final sampleProfile = Profile(
  id: '1',
  name: 'Felipey Mentor',
  username: 'felipey',
  email: 'felipey.mento@gmail.com',
  bio: 'Experienced software engineer passionate about mentoring.',
  image: 'assets/images/user2.jpg',
  skills: ['Flutter', 'Dart', 'Firebase', 'UI/UX'],
  mentoringPreference: 'Mentor',
  joinedAt: DateTime.now(),
);

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Felipey';

    return Scaffold(
        appBar: AppBar(
          title: TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyProfilePage(
                            profile: sampleProfile,
                          ))),
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
                            color: Theme.of(context).colorScheme.primary,
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
                side: BorderSide(color: Color.fromARGB(50, 158, 158, 158)),
                shape: CircleBorder(),
              ),
              child: Icon(
                Icons.notifications,
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
        body: SafeArea(
            child: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, activePage, child) {
            return Container(
              padding: EdgeInsets.all(8.0),
              child: pages.elementAt(activePage),
            );
          },
        )),
        bottomNavigationBar: NavbarWidget());
  }
}
