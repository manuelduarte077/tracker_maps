part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchEventDisplayManualMarker extends SearchEvent {}

class SearchEventDisplaySearchBar extends SearchEvent {}

class OnNewPlacesFoundEvent extends SearchEvent {
  final List<Feature> places;
  const OnNewPlacesFoundEvent(this.places);
}

class AddToHistoryEvent extends SearchEvent {
  final Feature place;
  const AddToHistoryEvent(this.place);
}
