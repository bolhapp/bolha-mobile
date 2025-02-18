import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lfg_mobile/modules/core/repositories/activity_types/models/activity_types.dart';

class CreateActivityState {
  const CreateActivityState(
      {required this.isOnline,
      required this.categories,
      required this.maxParticipants,
      required this.address,
      required this.description,
      required this.adictionalInformation,
      required this.requiremets,
      required this.title,
      required this.images,
      required this.usersLvl,
      required this.date});

  final bool isOnline;
  final List<ActivityType> categories;
  final int maxParticipants;
  final String address;
  final String description;
  final String adictionalInformation;
  final String requiremets;
  final String title;
  final List<XFile> images;
  final int usersLvl;
  final String date;

  CreateActivityState copyWith(
      {bool? isOnline,
      List<ActivityType>? categories,
      int? maxParticipants,
      String? address,
      String? description,
      String? adictionalInformation,
      String? requiremets,
      String? title,
      List<XFile>? images,
      int? usersLvl,
      String? date}) {
    return CreateActivityState(
        isOnline: isOnline ?? this.isOnline,
        categories: categories ?? this.categories,
        maxParticipants: maxParticipants ?? this.maxParticipants,
        address: address ?? this.address,
        description: description ?? this.description,
        adictionalInformation:
            adictionalInformation ?? this.adictionalInformation,
        requiremets: requiremets ?? this.requiremets,
        title: title ?? this.title,
        images: images ?? this.images,
        usersLvl: usersLvl ?? this.usersLvl,
        date: date ?? this.date);
  }
}

class CreateActivityStateCubit extends Cubit<CreateActivityState> {
  CreateActivityStateCubit()
      : super(CreateActivityState(
            isOnline: false,
            categories: [],
            maxParticipants: 0,
            address: '',
            description: '',
            adictionalInformation: '',
            requiremets: '',
            title: '',
            images: [],
            usersLvl: 0,
            date: DateTime.now().toString()));

  void setIsOnline(value) {
    emit(state.copyWith(
      isOnline: value
    ));
  }

  void setCategories(value) {
    emit(state.copyWith(
      categories: value
    ));
  }


  void setAddress(value) {
      emit(state.copyWith(
      address: value
    ));
  
  }

  void setDescription(value) {
       emit(state.copyWith(
      description: value
    ));
 
  }

  void setAdictionalInformation(value) {
     emit(state.copyWith(
      adictionalInformation: value
    ));
  }

  void setRequiremets(value) {
     emit(state.copyWith(
      requiremets: value
    ));
  }

  void setTitle(value) {
     emit(state.copyWith(
      title: value
    ));
  }

  void setDate(value) {
    emit(state.copyWith(
      date: value
    ));
  }

  void setImages(value) {
    emit(state.copyWith(
      images: value
    ));
  }

  void setUsersLvl(value) {
    emit(state.copyWith(
      usersLvl: value
    ));
  }

  void addCategory(String activityCategoryId) {
    List<ActivityType> listCopy = List.from(state.categories);
    listCopy.add(ActivityType(id: activityCategoryId));
    emit(state.copyWith(
      categories: listCopy
    ));
  }

  void decreaseMaxParticipantsCounter() {
    if (state.maxParticipants == 0) {
      return;
    }

    emit(state.copyWith(
      maxParticipants: state.maxParticipants - 1
    ));
  }

  void increaseMaxParticipantsCounter() {
    emit(state.copyWith(
      maxParticipants: state.maxParticipants + 1
    ));
  }

  void deleteCategory(String activityCategoryId) {
    List<ActivityType> listCopy = List.from(state.categories);
    listCopy.removeWhere((item) => item.id == activityCategoryId);
     emit(state.copyWith(
      categories: listCopy
    ));
  }

  void addImage(XFile img) {
    List<XFile> listCopy = List.from(state.images);
    listCopy.add(img);
    emit(state.copyWith(
      images: listCopy
    ));
  }

}
