import 'package:maps/native/brackground_location.dart';
import 'package:maps/repositories/brackground_location_repository.dart';

class BackgroundLocationRepositoryImpl implements BackgroundLocationRepository {
  final BackgroundLocations _backgroundLocation;

  BackgroundLocationRepositoryImpl(this._backgroundLocation);

  @override
  Future<void> startForegroundService() {
    return _backgroundLocation.startForegroundService();
  }

  @override
  Future<void> stopForegroundService() {
    return _backgroundLocation.stopForegroundService();
  }
}
