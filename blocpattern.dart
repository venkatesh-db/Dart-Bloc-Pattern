abstract class WeatherEvent {}

class GetWeather extends WeatherEvent {
  final String cityName;
  GetWeather(this.cityName);
}

abstract class WeatherState {
  const WeatherState();
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherCloud extends WeatherState {
  const WeatherCloud();
}

class Weatherveryhot extends WeatherState {
  const Weatherveryhot();
}

abstract class Bloc<T, T1> {
  Stream<dynamic> mapEventToState();
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  Stream<WeatherState> mapEventToState() {
    print(" waiting for event");
    return Stream<WeatherState>.fromIterable(
        [WeatherInitial(), Weatherveryhot()]);
  }
}

class BlocConsumer<T, T1> {
  T p;
  T1 p1;

  BlocConsumer(this.p, this.p1);
}

dynamic ui(BlocConsumer<dynamic, dynamic> obj) {
  return (state) {
    if (state is WeatherInitial) {
      print("WeatherInitial");
    } else if (state is Weatherveryhot) {
            print("Weatherveryhot");
    }
  };
}

void main() {
  var streams = WeatherBloc();

  var flow = streams.mapEventToState();

  var ret = ui(
      BlocConsumer<WeatherBloc, WeatherState>(WeatherBloc(), WeatherInitial()));

  ret(Weatherveryhot);
}