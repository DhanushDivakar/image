part of 'image_bloc_bloc.dart';

abstract class ImageBlocEvent extends Equatable {
  const ImageBlocEvent();

  @override
  List<Object> get props => [];
}

class GetImages extends ImageBlocEvent{}
