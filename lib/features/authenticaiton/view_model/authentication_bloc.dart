import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:housekeeping_pro/common/encryption_decryption/encryption_decryption_algo.dart';
import 'package:housekeeping_pro/features/authenticaiton/model/authentication_model_impl.dart';
import 'package:housekeeping_pro/features/authenticaiton/model/entity/auth_login_response_data_model.dart';
import 'package:housekeeping_pro/storage/local_storage.dart';
import 'package:housekeeping_pro/storage/local_storage_constants.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationModelImpl authImpl = AuthenticationModelImpl();

  AuthenticationBloc() : super(AuthenticationState()) {
    on<LoginEvent>(_onLoginEvent);
    on<SaveUserDataEvent>(_onSaveUserDataEvent);
  }

  Future<void> _onLoginEvent(
    LoginEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(loginStatus: AuthStatus.loading));
    final encryptedPassword =
        await EncryptionDecryptionAlgo().getEncryptedPassword(
      password: event.password,
    );
    try {
      final response = await authImpl.login(
        email: event.email,
        password: encryptedPassword ?? '',
        hotelName: event.hotelName,
      );
      if (response.statusCode == 200) {
        add(SaveUserDataEvent(data: response.data!));
        return;
      } else {
        log("Error: ${response.message}");
        emit(state.copyWith(
          loginStatus: AuthStatus.error,
          message: response.message ?? '',
        ));
      }
    } catch (e) {
      log("Error: $e");
      emit(state.copyWith(
        loginStatus: AuthStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onSaveUserDataEvent(
    SaveUserDataEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final localStorage = LocalStorage.getInstance();

    //save login status
    localStorage.saveBoolean(
        key: LocalStorageConstants.isUserLoggedIn, value: true);
    //save email
    localStorage.saveString(
        key: LocalStorageConstants.userEmail, value: event.data.email ?? "");

    //save token
    localStorage.saveString(
        key: LocalStorageConstants.authToken, value: event.data.token ?? "");

    //save hotel name
    localStorage.saveString(
        key: LocalStorageConstants.hotelName,
        value: event.data.hotelName ?? "");

    //save user id
    localStorage.saveInt(
        key: LocalStorageConstants.userId, value: event.data.userId ?? 0);

    //save tenant id
    localStorage.saveString(
        key: LocalStorageConstants.tenantId, value: event.data.tenantId ?? "");

    //save role
    localStorage.saveString(
        key: LocalStorageConstants.role, value: event.data.role ?? "");

    //Save User Name
    localStorage.saveString(
      key: LocalStorageConstants.userName,
      value: "${event.data.firstName ?? ""} ${event.data.lastName ?? ""}",
    );

    emit(state.copyWith(
      loginStatus: AuthStatus.success,
    ));
  }
}
