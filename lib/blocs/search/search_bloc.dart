import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps/services/services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  TrafficService trafficService;

  SearchBloc({required this.trafficService}) : super(const SearchState()) {
    on<SearchEventDisplayManualMarker>(
        (event, emit) => emit(state.copyWith(displayManualMarker: true)));

    on<SearchEventDisplaySearchBar>(
        (event, emit) => emit(state.copyWith(displayManualMarker: false)));
  }

  Future getCoorsStartToEnd(LatLng start, LatLng end) async {
    final resp = await trafficService.getCoorsStartToEnd(start, end);

    return resp;
  }
}
