import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/layout/socialapp_layout/cubit/states.dart';
import 'package:myapp/models/social_app/social-user_model.dart';
import 'package:myapp/modules/social_app/social_chats/chats_screen.dart';
import 'package:myapp/modules/social_app/social_feeds/feeds_screen.dart';
import 'package:myapp/modules/social_app/social_newpost/newpost_screen.dart';
import 'package:myapp/modules/social_app/social_notifications/notifications_screen.dart';
import 'package:myapp/modules/social_app/social_search/search_screen.dart';
import 'package:myapp/modules/social_app/social_settings/settings_screen.dart';
import 'package:myapp/modules/social_app/social_users/users_screen.dart';
import 'package:myapp/shared/components/components.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../models/social_app/message_model.dart';
import '../../../models/social_app/post_model.dart';

class SocialCubit extends Cubit<SocialAppStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];
  List<int> comments = [];

  void UserRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      UserCreate(name: name, email: email, phone: phone, uId: value.user!.uid);
      emit(SocialRegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  void UserCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    SocialUserModel model = SocialUserModel(
        name,
        email,
        phone,
        uId,
        false,
        'https://img.freepik.com/free-photo/full-shot-man-petting-dog_23-2149871786.jpg?w=996&t=st=1694802201~exp=1694802801~hmac=34ef040c2c176068e2bd2dbe6f60f9dfe21a1055a3f9531230e63e9cb613dfd0',
        'write your bio ...',
        'https://img.freepik.com/free-photo/side-view-woman-posing-sunset_23-2149871771.jpg?t=st=1694804628~exp=1694805228~hmac=2e5860c4f988c7d9aea35d2580e6c38ad6fd8e9ed9a3f9fe9faaf79e3c67d2e8');
    FirebaseFirestore.instance.collection('users').doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialCreateErrorState(error.toString()));
    });
  }

  void UserLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password).then((value) {
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
    });
  }

  SocialUserModel? usermodel;

  void GetUserData() {
    emit(SocialGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(socialTokenSave)
        .get()
        .then((value) {
      usermodel = SocialUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetUserErrorState(error));
    });
  }

  int current_index = 0;

  List<BottomNavigationBarItem> socialbottomitems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat),
      label: 'Chats',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.post_add,
      ),
      label: 'Post',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.location_history_outlined),
      label: 'Users',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> socialscreens = [
    SocialFeedsScreen(),
    SocialChatsScreen(),
    SocialChatsScreen(),
    SocialUsersScreen(),
    SocialSettingsScreen(),

  ];
  List<String> socialtitlescreens = [
    'Home',
    'Chats',
    'Post',
    'Users',
    'Settings',
  ];

  void changenavbarindex(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    }
    else {
      current_index = index;
      if (index == 0) {
        emit(SocialHomeState());
      }
      else if (index == 1) {
        getUsers();
        emit(SocialChatsState());
      }
      else if (index == 3) {
        emit(SocialUsersState());
      }
      else if (index == 4) {
        emit(SocialSettingsState());
      }
    }
  }

  File? profileImage;
  ImagePicker picker = ImagePicker();

  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  File? coverImage;

  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialCoverImagePickedErrorState());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(profileImage!.path)
        .pathSegments
        .last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          image: value,
        );
      }).catchError((error) {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit(SocialUserUpdateLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri
        .file(coverImage!.path)
        .pathSegments
        .last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadCoverImageSuccessState());
        print(value);
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          cover: value,
        );
      }).catchError((error) {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState());
    });
  }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? cover,
    String? image,
  }) {
    SocialUserModel model = SocialUserModel(
        name,
        usermodel!.email,
        phone,
        usermodel!.uId,
        false,
        image ?? usermodel!.image,
        bio,
        cover ?? usermodel!.cover);


    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel!.uId)
        .update(model.toMap())
        .then((value) {
      GetUserData();
    }).catchError((error) {
      emit(SocialUserUpdateErrorState());
    });
  }

  File? postImage;

  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePickedSuccessState());
    } else {
      print('No image selected.');
      emit(SocialPostImagePickedErrorState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(SocialRemovePostImageState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(SocialCreatePostLoadingState());

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('posts/${Uri
        .file(postImage!.path)
        .pathSegments
        .last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(
          text: text,
          dateTime: dateTime,
          postImage: value,
        );
      }).catchError((error) {
        emit(SocialCreatePostErrorState());
      });
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(SocialCreatePostLoadingState());

    PostModel model = PostModel(
      name: usermodel!.name,
      image: usermodel!.image,
      uId: usermodel!.uId,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );


    FirebaseFirestore.instance
        .collection('posts')
        .add(model.toMap())
        .then((value) {
          likePostWithoutadd(value.id);
          commentPostWithoutAdd(value.id);
          print(value.id);
      emit(SocialCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialCreatePostErrorState());
    });
  }


  void getPosts() {
    FirebaseFirestore.instance.collection('posts').get().then((value) {
      value.docs.forEach((element) {
        postsId.add(element.id);
        posts.add(PostModel.fromJson(element.data()));
        element.reference.collection('likes').get().then((value) {
          likes.add(value.docs.length);
        }).catchError((error) {});
        element.reference.collection('comments').get().then((value) {
          comments.add(value.docs.length);
        }).catchError((error) {});
      });
      emit(SocialGetPostSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetPostErrorState(error.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(usermodel!.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(SocialLikePostSuccessState());
    }).catchError((error) {
      emit(SocialLikePostErrorState(error.toString()));
    });
  }

  void likePostWithoutadd(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(usermodel!.uId).set({})
        .then((value) {
      emit(SocialLikePostSuccessState());
    }).catchError((error) {
      emit(SocialLikePostErrorState(error.toString()));
    });
  }

  void commentPost(String postId , String text) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(usermodel!.uId)
        .set({
      'comment': text,
    }).then((value) {
      emit(SocialCommentPostSuccessState());
    }).catchError((error) {
      emit(SocialCommentPostErrorState(error.toString()));
    });
  }
  void commentPostWithoutAdd(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comments')
        .doc(usermodel!.uId)
        .set({}).then((value) {
      emit(SocialCommentPostSuccessState());
    }).catchError((error) {
      emit(SocialCommentPostErrorState(error.toString()));
    });
  }

  List<SocialUserModel> users = [];
  void getUsers() {
    if (users.length == 0)
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          users.add(SocialUserModel.fromJson(element.data()));
        });

        emit(SocialGetAllUsersSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SocialGetAllUsersErrorState(error.toString()));
      });
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderId: usermodel!.uId,
      receiverId: receiverId,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(usermodel!.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialSendMessageSuccessState());
    }).catchError((error) {
      emit(SocialSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    required String receiverId,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(usermodel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];

      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(SocialGetMessagesSuccessState());
    });
  }
}