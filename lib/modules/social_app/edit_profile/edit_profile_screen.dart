import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/layout/socialapp_layout/cubit/cubit.dart';
import 'package:myapp/layout/socialapp_layout/cubit/states.dart';

import '../../../shared/components/components.dart';

class SocialEditProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialAppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = SocialCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                ),
              ),
              titleSpacing: 5.0,
              title: Text(
                'Edit Profile',
              ),
              actions: [
                defaultTextButton(
                  function: () {
                    cubit.updateUser(
                        name: nameController.text,
                        phone: phoneController.text,
                        bio: bioController.text);
                  },
                  text: 'Update',
                  textstyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    if (state is SocialUserUpdateLoadingState)
                      LinearProgressIndicator(),
                    if (state is SocialUserUpdateLoadingState)
                      SizedBox(
                        height: 10.0,
                      ),
                    Container(
                      height: 190.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Align(
                            child: Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                Container(
                                  height: 140.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        4.0,
                                      ),
                                      topRight: Radius.circular(
                                        4.0,
                                      ),
                                    ),
                                    image: DecorationImage(
                                      image: cubit.coverImage == null
                                          ? NetworkImage(
                                        '${cubit.usermodel!.cover}',
                                      )
                                          : FileImage(cubit.coverImage!) as ImageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: CircleAvatar(
                                    radius: 20.0,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 16.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    SocialCubit.get(context).getCoverImage();
                                  },
                                ),
                              ],
                            ),
                            alignment: AlignmentDirectional.topCenter,
                          ),
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              CircleAvatar(
                                radius: 64.0,
                                backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundImage: cubit.profileImage == null
                                      ? NetworkImage(
                                    '${cubit.usermodel!.image}',
                                  )
                                      : FileImage(cubit.profileImage!) as ImageProvider,
                                ),
                              ),
                              IconButton(
                                icon: CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 16.0,
                                  ),
                                ),
                                onPressed: () {
                                  SocialCubit.get(context).getProfileImage();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    if (SocialCubit.get(context).profileImage != null ||
                        SocialCubit.get(context).coverImage != null)
                      Row(
                        children: [
                          if (SocialCubit.get(context).profileImage != null)
                            Expanded(
                              child: Column(
                                children: [
                                  defaultButton(
                                    function: () {
                                      SocialCubit.get(context).uploadProfileImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text,
                                      );
                                    },
                                    text: 'upload profile',
                                    textcolor: Colors.blue,
                                  ),
                                  if (state is SocialUserUpdateLoadingState)
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  if (state is SocialUserUpdateLoadingState)
                                    LinearProgressIndicator(),
                                ],
                              ),
                            ),
                          SizedBox(
                            width: 5.0,
                          ),
                          if (SocialCubit.get(context).coverImage != null)
                            Expanded(
                              child: Column(
                                children: [
                                  defaultButton(
                                    function: ()
                                    {
                                      SocialCubit.get(context).uploadCoverImage(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        bio: bioController.text,
                                      );
                                    },
                                    text: 'upload cover',
                                    textcolor: Colors.blue,
                                  ),
                                  if (state is SocialUserUpdateLoadingState)
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                  if (state is SocialUserUpdateLoadingState)
                                    LinearProgressIndicator(),
                                ],
                              ),
                            ),
                        ],
                      ),
                    if (cubit.profileImage != null ||
                        cubit.coverImage != null)
                      SizedBox(
                        height: 20.0,
                      ),
                    defaultTextFormField(
                      texttype: TextInputType.name,
                      controler: nameController,
                      validate: (value) {
                        if(value?.isEmpty == true){
                          return 'name must not be empty';
                        }
                        return null;
                      },
                      textitem: 'Name',
                      prefixicon: Icons.person,
                      onchange: (value){
                      },
                      onfieldsubmit: (value){
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultTextFormField(
                      texttype: TextInputType.text,
                      controler: bioController,
                      validate: (value) {
                        if(value?.isEmpty == true){
                          return 'bio must not be empty';
                        }
                        return null;
                      },
                      textitem: 'Bio',
                      prefixicon: Icons.info_outlined,
                      onchange: (value){
                      },
                      onfieldsubmit: (value){
                      },
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    defaultTextFormField(
                      texttype: TextInputType.phone,
                      controler: phoneController,
                      validate: (value) {
                        if(value?.isEmpty == true){
                          return 'phone must not be empty';
                        }
                        return null;
                      },
                      textitem: 'Phone',
                      prefixicon: Icons.call,
                      onchange: (value){
                      },
                      onfieldsubmit: (value){
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
}
