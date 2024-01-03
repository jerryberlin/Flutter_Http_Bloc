import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc_http/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  final UserModel user;
  const DetailScreen({Key? key, required this.user}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: CircleAvatar(
                  maxRadius: 60,
                  backgroundImage: NetworkImage(user.avatar),
                ),
              ),
            ),
            Text(
              '${user.firstname} ${user.lastname}',
            ),
            Text(
              user.email
            )
          ],
        ),
      ),
    );
  }
}