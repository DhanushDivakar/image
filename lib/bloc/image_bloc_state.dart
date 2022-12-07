part of 'image_bloc_bloc.dart';

// abstract
class ImageBlocState extends Equatable {
  const ImageBlocState({
    this.isLoading = false,
    this.images = const <Image>[],
    this.reachMax = false,
  });

  final List<Image> images;
  final bool isLoading;
  final bool reachMax;

  ImageBlocState copyWith({
    List<Image>? images,
    bool? isLoading,
    bool? reachMax,
  }) =>
      ImageBlocState(
        images: images ?? this.images,
        isLoading: isLoading ?? this.isLoading,
        reachMax: reachMax ?? this.reachMax,
      );

  @override
  List<Object> get props => [images, isLoading,reachMax];
}

// class ImageBlocInitial extends ImageBlocState {}

// class ImageBlocLoading extends ImageBlocState {}

// class ImageBlocLoaded extends ImageBlocState {
//   final List<Image> images;
//   const ImageBlocLoaded({this.images = const <Image>[]});
// }

// class ImageBlocError extends ImageBlocState {
//   final String? message;
//   const ImageBlocError({required this.message});
// }
