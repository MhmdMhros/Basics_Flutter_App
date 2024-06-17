abstract class NewsAppStates{}
class NewsInitialState extends NewsAppStates{}
class NewsBottomChangeState extends NewsAppStates{}

class NewsBusinessLoadingState extends NewsAppStates{}
class NewsGetBusinessSuccessState extends NewsAppStates{}
class NewsGetBusinessErrorState extends NewsAppStates{
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsScienceLoadingState extends NewsAppStates{}
class NewsGetScienceSuccessState extends NewsAppStates{}
class NewsGetScienceErrorState extends NewsAppStates{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsSportsLoadingState extends NewsAppStates{}
class NewsGetSportsSuccessState extends NewsAppStates{}
class NewsGetSportsErrorState extends NewsAppStates{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsChangeModeState extends NewsAppStates{}

class NewsSearchLoadingState extends NewsAppStates{}
class NewsGetSearchSuccessState extends NewsAppStates{}
class NewsGetSearchErrorState extends NewsAppStates{
  final String error;
  NewsGetSearchErrorState(this.error);
}