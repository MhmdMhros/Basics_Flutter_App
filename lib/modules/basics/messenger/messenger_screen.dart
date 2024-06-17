import 'package:flutter/material.dart';

class  MessengerScreen extends StatelessWidget {
  var search = TextEditingController();
  // to create viewlist we
  // 1- build the item
  // 2- build list
  // 3- add item to list
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.limeAccent,
        titleSpacing: 10.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/mhmd mhros.jpg'),
            ),
            SizedBox(width: 20.0,),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
        ],),
        actions: [
          IconButton(onPressed: (){}, icon: CircleAvatar(
            foregroundColor: Colors.black87,
            backgroundColor: Colors.limeAccent,
            radius: 20.0,
            child: Icon(
              Icons.camera_alt,
            ),
          ),),
          IconButton(onPressed: (){}, icon: CircleAvatar(
            foregroundColor: Colors.black87,
            backgroundColor: Colors.limeAccent,
            radius: 20.0,
            child: Icon(
              Icons.edit,
            ),
          ),),
        ],
      ),
      body: Container(
        color: Colors.limeAccent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.grey[300],
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsets.all(5.0,),
                  child: Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.search,),),
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.black,),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 100.0,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildstoryitem(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 15.0,
                    ),
                    itemCount: 20,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemBuilder: (context, index) => buildchatitem(),
                    separatorBuilder: (context, index) => SizedBox(height: 10.0,),
                    itemCount: 20,)


              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildchatitem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 35.0,
            backgroundImage: AssetImage('assets/mhmd mhros.jpg'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 3.0,end: 3.0),
            child: CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.green,
            ),
          ),

        ],
      ),
      SizedBox(width: 10.0,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mhmd Mhros',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0,),
            Row(
              children: [
                Expanded(child: Text(
                  'hello my names mhmd mhros mhmd',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Text('03:26 AM'),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildstoryitem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: AssetImage('assets/mhmd mhros.jpg'),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(bottom: 3.0,end: 3.0),
              child: CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.green,
              ),
            ),

          ],
        ),
        Text(
          'Mhmd Mhros',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
