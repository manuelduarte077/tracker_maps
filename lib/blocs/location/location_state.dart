part of 'location_bloc.dart';

// History:
class LocationState extends Equatable {
  final bool followingUser;

  const LocationState({
    this.followingUser = false,
  });

  @override
  List<Object> get props => [followingUser];
}
