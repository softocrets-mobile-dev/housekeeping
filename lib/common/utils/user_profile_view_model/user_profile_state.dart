part of 'user_profile_cubit.dart';

final class UserProfileState extends Equatable {
  final String name;
  final String email;
  final String hotelName;
  final String userRole;
  final int appTheme;

  const UserProfileState({
    this.name = 'Not Available',
    this.email = 'Not Available',
    this.hotelName = 'Not Available',
    this.userRole = 'Not Available',
    this.appTheme = 0,
  });

  UserProfileState copyWith({
    String? name,
    String? email,
    String? hotelName,
    String? userRole,
    int? appTheme,
  }) {
    return UserProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      hotelName: hotelName ?? this.hotelName,
      userRole: userRole ?? this.userRole,
      appTheme: appTheme ?? this.appTheme,
    );
  }

  @override
  List<Object> get props => [
        name,
        email,
        hotelName,
        userRole,
        appTheme,
      ];
}
