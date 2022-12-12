import 'package:flutter/material.dart';
import 'package:shared_pref_tutorial/cache_helper.dart';

import 'user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String content = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(content, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                User user = User(1, "Ahamd", 50.0);
                CacheHelper.setUser(user);

                print("Done");
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                content = CacheHelper.getString('name') ?? "";
                setState(() {});
                User? user = CacheHelper.getUser();
                if (user == null) {
                  content = "No User Data";
                } else {
                  content = user.id.toString();
                }
                // if (encodedUser == null) {
                //   content = "No User Data";
                // } else {
                //   User user = User.fromJson(json.decode(encodedUser));
                //   content = user.id.toString();
                // }
              },
              child: const Text(
                "Load",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              onPressed: () async {
                await CacheHelper.removeUser();
                print("Removed");
                setState(() {
                  content = "";
                });
              },
              child: const Text(
                "Remove",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
