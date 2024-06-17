import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/socialapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/socialapp_layout/cubit/states.dart';
import 'package:myapp/models/social_app/post_model.dart';

class SocialFeedsScreen extends StatelessWidget {
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialAppStates>(
        listener: (context,state){
          if(state is SocialHomeState){
            SocialCubit.get(context).getPosts();
          }
        },
        builder: (context,state){
          var cubit = SocialCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.posts.length > 0,
              builder: (context) => SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5.0,
                      margin: EdgeInsets.all(8.0,),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/person-enjoying-warm-nostalgic-sunset_52683-100695.jpg?w=996&t=st=1694781640~exp=1694782240~hmac=9e0e4f509cc7731c9b1bab486247989c5c7e6495e3d97dab21a9786b545f5a65'
                            ),
                            fit: BoxFit.cover,
                            height: 200.0,
                            width: double.infinity,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Communicate with friends',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildPostItem(cubit.posts[index],context, index),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 8.0,
                      ),
                      itemCount: cubit.posts.length,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
    );
  }

  Widget buildPostItem(PostModel model,context,index) => Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 5.0,
    margin: EdgeInsets.symmetric(horizontal: 8.0,),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          Row(
            children:
            [
              CircleAvatar(
                radius: 23.0,
                backgroundImage: NetworkImage(
                  '${model.image}',
                ),
              ),
              SizedBox(width: 17.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Row(
                      children: [
                        Text(
                          '${model.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                          ),
                        ),
                        SizedBox(width: 5.0,),
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    Text(
                      '${model.dateTime}',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 17.0,),
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.more_horiz,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Text(
            '${model.text}',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          if(model.postImage != '')
            Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 15.0,
            ),
            child: Container(
              height: 140.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0,),
                image: DecorationImage(
                  image: NetworkImage(
                      '${model.postImage}'
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding (
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.heart_broken,
                            size: 16.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${SocialCubit.get(context).likes.length > 0 ?SocialCubit.get(context).likes[index] : 0}',
                          ),
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.chat,
                            size: 16.0,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${SocialCubit.get(context).comments.length > 0 ?SocialCubit.get(context).comments[index] : 0} comment',
                          ),
                        ],
                      ),
                    ),
                    onTap: () {

                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18.0,
                        backgroundImage: NetworkImage(
                          '${SocialCubit.get(context).usermodel!.image}',
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      // Text(
                      //   'write a comment ...',
                      //   // style:
                      //   // Theme.of(context).textTheme.caption.copyWith(),
                      // ),
                      Expanded(
                        child: TextField(
                          controller: textController,
                          decoration: InputDecoration(
                            hintText: 'write a comment ...',
                          ),
                          onSubmitted: (value){
                            SocialCubit.get(context).commentPost(SocialCubit.get(context).postsId[index],textController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                  },
                ),
              ),
              InkWell(
                child: Row(
                  children: [
                    Icon(
                      Icons.heart_broken,
                      size: 16.0,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Like',
                      // style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                onTap: ()
                {
                  SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                },
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
