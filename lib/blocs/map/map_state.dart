part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool isFollowingUser;
  final bool isShowRouteDrawing;
  final bool selectedCircleId;

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
    this.selectedCircleId = false,
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
    bool? selectedCircleId,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    Map<String, Circle>? circles,
    Map<String, Polygon>? polygons,
  }) =>
      MapState(
        isMapInitialized: isMapInitialized ?? this.isMapInitialized,
        isFollowingUser: isFollowingUser ?? this.isFollowingUser,
        isShowRouteDrawing: isShowRouteDrawing ?? this.isShowRouteDrawing,
        selectedCircleId: selectedCircleId ?? this.selectedCircleId,
        polylines: polylines ?? this.polylines,
        markers: markers ?? this.markers,
        circles: circles ?? this.circles,
      );

  @override
  List<Object> get props => [
        isMapInitialized,
        isFollowingUser,
        isShowRouteDrawing,
        selectedCircleId,
        polylines,
        markers,
        circles,
      ];
}
