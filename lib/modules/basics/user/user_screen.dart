import 'package:flutter/material.dart';

import '../../../models/users/user_models.dart';




class  UserScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'Mhmd Mhros', phone: '+201066102723'),
    UserModel(id: 2, name: 'Ibra Ha', phone: '+201045658565'),
    UserModel(id: 3, name: 'Abdo Ahmed', phone: '+201066102565'),
    UserModel(id: 1, name: 'Mhmd Mhros', phone: '+201066102723'),
    UserModel(id: 2, name: 'Ibra Ha', phone: '+201045658565'),
    UserModel(id: 3, name: 'Abdo Ahmed', phone: '+201066102565'),
    UserModel(id: 1, name: 'Mhmd Mhros', phone: '+201066102723'),
    UserModel(id: 2, name: 'Ibra Ha', phone: '+201045658565'),
    UserModel(id: 3, name: 'Abdo Ahmed', phone: '+201066102565'),
    UserModel(id: 1, name: 'Mhmd Mhros', phone: '+201066102723'),
    UserModel(id: 2, name: 'Ibra Ha', phone: '+201045658565'),
    UserModel(id: 3, name: 'Abdo Ahmed', phone: '+201066102565'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        title: const Text(
            'Customers',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
          ),
        ),
    ),
      body: ListView.separated(
          itemBuilder: (context, index) => builduseritem(users[index]),
          separatorBuilder: (context, index) => Container(
            color: Colors.grey,
            width: double.infinity,
            height: 1.0,
          ),
          itemCount: users.length)
    );
  }
  Widget builduseritem(UserModel user) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.limeAccent,
          radius: 30.0,
          child: Text(
            '${user.id}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 15.0,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
