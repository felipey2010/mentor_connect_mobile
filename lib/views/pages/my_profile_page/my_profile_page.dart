import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/views/pages/my_profile_page/edit_my_profile_page.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = 'Meu Perfil';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: const Color.fromARGB(40, 158, 158, 158),
            height: 1.0,
          ),
        ),
        actions: [
          OutlinedButton(
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditMyProfilePage()))
            },
            style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade800),
                shape: CircleBorder()),
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("Página de Meu Perfil"),
      ),
      // ValueListenableBuilder(
      //   valueListenable: selectedPageNotifier,
      //   builder: (context, selectedPage, child) {
      //     return pages.elementAt(selectedPage);
      //   },
    );
  }
}
