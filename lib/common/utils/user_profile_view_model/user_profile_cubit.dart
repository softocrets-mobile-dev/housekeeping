import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:housekeeping_pro/storage/local_storage.dart';
import 'package:housekeeping_pro/storage/local_storage_constants.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(UserProfileState());

  Future<void> getUserProfileData() async {
    final result = await Future.wait([
      LocalStorage.getInstance().getString(key: LocalStorageConstants.userName),
      LocalStorage.getInstance()
          .getString(key: LocalStorageConstants.userEmail),
      LocalStorage.getInstance()
          .getString(key: LocalStorageConstants.hotelName),
      LocalStorage.getInstance().getString(key: LocalStorageConstants.role),
    ]);
    emit(state.copyWith(
      name: result[0],
      email: result[1],
      hotelName: result[2],
      userRole: result[3],
    ));
  }

  Future<void> updateAppTheme({
    required int themeMode,
  }) async {
    await LocalStorage.getInstance().saveInt(
      key: LocalStorageConstants.themeMode,
      value: themeMode,
    );
    emit(state.copyWith(appTheme: themeMode));
  }

  Future<void> getThemeMode() async {
    final themeMode = await LocalStorage.getInstance().getInt(
      key: LocalStorageConstants.themeMode,
    );
    emit(state.copyWith(appTheme: themeMode));
  }
}
