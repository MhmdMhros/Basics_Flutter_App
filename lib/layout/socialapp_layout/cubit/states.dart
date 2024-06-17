abstract class SocialAppStates{}
class SocialInitialState extends SocialAppStates{}
class SocialGetUserLoadingState extends SocialAppStates{}
class SocialGetUserSuccessState extends SocialAppStates{}
class SocialGetUserErrorState extends SocialAppStates{
  final String error;
  SocialGetUserErrorState(this.error);
}

class SocialGetAllUsersLoadingState extends SocialAppStates {}
class SocialGetAllUsersSuccessState extends SocialAppStates {}
class SocialGetAllUsersErrorState extends SocialAppStates
{
  final String error;
  SocialGetAllUsersErrorState(this.error);
}

class SocialGetPostLoadingState extends SocialAppStates{}
class SocialGetPostSuccessState extends SocialAppStates{}
class SocialGetPostErrorState extends SocialAppStates{
  final String error;
  SocialGetPostErrorState(this.error);
}

class SocialLikePostSuccessState extends SocialAppStates {}

class SocialLikePostErrorState extends SocialAppStates
{
  final String error;
  SocialLikePostErrorState(this.error);
}

class SocialCommentPostSuccessState extends SocialAppStates {}

class SocialCommentPostErrorState extends SocialAppStates
{
  final String error;
  SocialCommentPostErrorState(this.error);
}

class SocialLoginLoadingState extends SocialAppStates{}
class SocialLoginSuccessState extends SocialAppStates{
  final String uId;
  SocialLoginSuccessState(this.uId);
}
class SocialLoginErrorState extends SocialAppStates{
  final String error;
  SocialLoginErrorState(this.error);
}

class SocialRegisterLoadingState extends SocialAppStates{}
class SocialRegisterSuccessState extends SocialAppStates{
}
class SocialRegisterErrorState extends SocialAppStates{
  final String error;
  SocialRegisterErrorState(this.error);
}
class SocialCreateSuccessState extends SocialAppStates{
}
class SocialCreateErrorState extends SocialAppStates{
  final String error;
  SocialCreateErrorState(this.error);
}

// class SocialBottomNavHomeState extends SocialAppStates{}
class SocialHomeState extends SocialAppStates{}
class SocialChatsState extends SocialAppStates{}
class SocialNewPostState extends SocialAppStates{}
class SocialUsersState extends SocialAppStates{}
class SocialSettingsState extends SocialAppStates{}
class SocialAddLikesAndCommentsState extends SocialAppStates{}

class SocialProfileImagePickedSuccessState extends SocialAppStates {}
class SocialProfileImagePickedErrorState extends SocialAppStates {}
class SocialCoverImagePickedSuccessState extends SocialAppStates {}
class SocialCoverImagePickedErrorState extends SocialAppStates {}
class SocialUploadProfileImageSuccessState extends SocialAppStates {}
class SocialUploadProfileImageErrorState extends SocialAppStates {}
class SocialUploadCoverImageSuccessState extends SocialAppStates {}
class SocialUploadCoverImageErrorState extends SocialAppStates {}
class SocialUserUpdateLoadingState extends SocialAppStates {}
class SocialUserUpdateErrorState extends SocialAppStates {}

class SocialCreatePostLoadingState extends SocialAppStates {}
class SocialCreatePostSuccessState extends SocialAppStates {}
class SocialCreatePostErrorState extends SocialAppStates {}
class SocialPostImagePickedSuccessState extends SocialAppStates {}
class SocialPostImagePickedErrorState extends SocialAppStates {}
class SocialRemovePostImageState extends SocialAppStates {}

class SocialSendMessageSuccessState extends SocialAppStates {}
class SocialSendMessageErrorState extends SocialAppStates {}
class SocialGetMessagesSuccessState extends SocialAppStates {}