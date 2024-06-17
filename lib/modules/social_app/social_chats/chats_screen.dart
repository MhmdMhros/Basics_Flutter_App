import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/socialapp_layout/cubit/cubit.dart';
import '../../../layout/socialapp_layout/cubit/states.dart';
import '../../../models/social_app/social-user_model.dart';
import '../../../shared/components/components.dart';
import '../chat_details/chat_details_screen.dart';

class SocialChatsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0,
          builder: (context) => Column(
            // Replace ListView.separated with a Column
            children: SocialCubit.get(context).users.map((model) {
              return Column(
                children: [
                  buildChatItem(model, context),
                  myDivider(),
                ],
              );
            }).toList(),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
  Widget buildChatItem(SocialUserModel model, context) => InkWell(
    onTap: () {
      NavigateTo(
        context,
        ChatDetailsScreen(
          userModel: model,
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage(
              '${model.image}',
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            '${model.name}',
            style: TextStyle(
              height: 1.4,
            ),
          ),
        ],
      ),
    ),
  );
}
