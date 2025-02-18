import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityState {
  ActivityState(this.activityTag, this.skillLvl);

  int skillLvl;
  final String activityTag;

  void increaseSkillLvl() {
    skillLvl = skillLvl >= 3 ? 3 : skillLvl + 1;
  }

  void decreaseSkillLvl() {
    skillLvl = skillLvl > 0 ? skillLvl - 1 : 0;
  }
}

class SignUpStepTwoPageFormState extends Equatable {
  final String bio;
  final List<ActivityState> activities;

  const SignUpStepTwoPageFormState(
      {required this.bio, required this.activities});

  @override
  List<Object> get props => [bio, activities];
}

class SignUpStepTwoPageFormCubit extends Cubit<SignUpStepTwoPageFormState> {
  SignUpStepTwoPageFormCubit()
      : super(const SignUpStepTwoPageFormState(bio: "", activities: []));

  void updateBio(String bio) {
    emit(SignUpStepTwoPageFormState(bio: bio, activities: state.activities));
  }

  void addActivity(String activityTag) {
    List<ActivityState> listCopy = List.from(state.activities);
    listCopy.add(ActivityState(activityTag, 0));
    emit(SignUpStepTwoPageFormState(bio: state.bio, activities: listCopy));
  }

  void deleteActivity(String activityTag) {
    List<ActivityState> listCopy = List.from(state.activities);
    listCopy.removeWhere((item) => item.activityTag == activityTag);
    emit(SignUpStepTwoPageFormState(bio: state.bio, activities: listCopy));
  }

  void increaseActivitySkillLvl(String activityTag) {
    List<ActivityState> listCopy = [];
    for (var el in state.activities) {
      ActivityState copyActivity = ActivityState(el.activityTag, el.skillLvl);

      if (el.activityTag == activityTag) {
        copyActivity.increaseSkillLvl();
      }

      listCopy.add(copyActivity);
    }
    emit(SignUpStepTwoPageFormState(
        bio: state.bio, activities: listCopy.toList()));
  }

  void decreaseActivitySkillLvl(String activityTag) {
    List<ActivityState> listCopy = [];
    for (var el in state.activities) {
      ActivityState copyActivity = ActivityState(el.activityTag, el.skillLvl);

      if (el.activityTag == activityTag) {
        copyActivity.decreaseSkillLvl();
      }

      listCopy.add(copyActivity);
    }
    emit(SignUpStepTwoPageFormState(
        bio: state.bio, activities: listCopy.toList()));
  }
}
