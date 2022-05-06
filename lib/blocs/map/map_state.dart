part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool isShowRouteDrawing;

  // Polyline
  final Map<String, Polyline> polylines;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    this.isShowRouteDrawing = true,
    Map<String, Polyline>? polylines,
  }) : polylines = polylines ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    bool? isShowRouteDrawing,
    Map<String, Polyline>? polylines,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        isShowRouteDrawing: isShowRouteDrawing ?? this.isShowRouteDrawing,
        polylines: polylines ?? this.polylines,
      );

  @override
  List<Object> get props =>
      [isMapInitialized, isFollowingUser, polylines, isShowRouteDrawing];
}
