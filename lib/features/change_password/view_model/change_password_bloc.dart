import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housekeeping_pro/common/encryption_decryption/encryption_decryption_algo.dart';
import 'package:housekeeping_pro/features/change_password/model/change_password_impl.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordImpl passwordImpl = ChangePasswordImpl();

  ChangePasswordBloc() : super(ChangePasswordState()) {
    on<ChangePassword>(_onChangePassword);
  }

  FutureOr<void> _onChangePassword(
    ChangePassword event,
    Emitter<ChangePasswordState> emit,
  ) async {
    emit(state.copyWith(status: ChangePasswordStatus.loading));
    try {
      final oldPassword = await EncryptionDecryptionAlgo().getEncryptedPassword(
        password: event.oldPassword,
      );
      final newPassword = await EncryptionDecryptionAlgo().getEncryptedPassword(
        password: event.newPassword,
      );
      final response = await passwordImpl.changePassword(
        oldPassword: oldPassword ?? '',
        newPassword: newPassword ?? '',
      );
      if (response.statusCode == 200) {
        emit(state.copyWith(
          status: ChangePasswordStatus.success,
          message: response.message ?? '',
        ));
        return;
      } else {
        emit(state.copyWith(
          status: ChangePasswordStatus.failure,
          message: response.message ?? '',
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ChangePasswordStatus.failure,
        message: e.toString(),
      ));
    }
  }
}
