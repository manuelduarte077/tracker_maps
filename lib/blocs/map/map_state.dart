part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool isShowRouteDrawing;

  // Polyline
  final Map<String, Polyline> polylines;
  // Markers
  final Map<String, Marker> markers;
  // Circles
  final Map<String, Circle> circles;

  const MapState({
    this.isMapInitialized = false,
    this.isFollowingUser = true,
    this.isShowRouteDrawing = true,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    Map<String, Circle>? circles,
  })  : polylines = polylines ?? const {},
        markers = markers ?? const {},
        circles = circles ?? const {};

  MapState copyWith({
    bool? isMapInitialized,
    bool? isFollowingUser,
    bool? isShowRouteDrawing,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    Map<String, Circle>? circles,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        isShowRouteDrawing: isShowRouteDrawing ?? this.isShowRouteDrawing,
        polylines: polylines ?? this.polylines,
        markers: markers ?? this.markers,
        circles: circles ?? this.circles,
      );

  @override
  List<Object> get props => [
        isMapInitialized,
        isFollowingUser,
        isShowRouteDrawing,
        polylines,
        markers,
        circles,
      ];
}
