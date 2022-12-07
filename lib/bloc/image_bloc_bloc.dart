import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:image/data/models/image_model.dart';
import 'package:image/resources/api_provider.dart';


part 'image_bloc_event.dart';
part 'image_bloc_state.dart';

class ImageBlocBloc extends Bloc<ImageBlocEvent, ImageBlocState> {
     final ApiProvider apiList = ApiProvider(dio: Dio());

     var page =1;

  ImageBlocBloc() : super(const ImageBlocState()) {
    on<GetImages>(_onGetImages);
  }

  FutureOr<void> _onGetImages(GetImages event, Emitter<ImageBlocState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final images = await apiList.getImages(page: page);
     // print(images);
      ///await Future.delayed(Duration(seconds: 8));
      emit(state.copyWith(isLoading: false, images: [...state.images, ...images], reachMax: images.isEmpty || images.length < 100));
      page++;
    } catch (error) {
    emit(state.copyWith(isLoading: false));
    }
  }
}
