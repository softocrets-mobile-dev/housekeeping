part of 'user_profile_cubit.dart';

final class UserProfileState extends Equatable {
  final String name;
  final String email;
  final String hotelName;
  final String userRole;

  const UserProfileState({
    this.name = 'Not Available',
    this.email = 'Not Available',
    this.hotelName = 'Not Available',
    this.userRole = 'Not Available',
  });

  UserProfileState copyWith({
    String? name,
    String? email,
    String? hotelName,
    String? userRole,
  }) {
    return UserProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      hotelName: hotelName ?? this.hotelName,
      userRole: userRole ?? this.userRole,
    );
  }

  @override
  List<Object> get props => [
        name,
        email,
        hotelName,
        userRole,
      ];
}
