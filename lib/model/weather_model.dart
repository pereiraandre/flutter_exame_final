class WeatherModel {
  final double? temperature;
  final int? humidity;
  final int? seaLevel;
  final double? wind;
  final String? main;
  final String? name;

  WeatherModel(this.temperature, this.humidity, this.wind, this.seaLevel,
      this.main, this.name);


  WeatherModel.fromJson(Map<String, dynamic> json)
      : temperature = json['main']['temp'],
        humidity = json['main']['humidity'],
        seaLevel = json['main']['sea_level'],
        wind = json['wind']['speed'],
        main = json['weather'][0]['main'],
        name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'main': {
          'temp': temperature,
          'humidity': humidity,
          'sea_level': seaLevel
        },
        'wind': {
          'speed': wind,
        },
        'weather': {'main': main},
        'name': name
      };

  String? humidityDescription() {
    if(humidity == null){
      return null;
    }
    if (humidity! < 30) {
      return 'Low';
    } else if (humidity! < 50) {
      return 'Normal';
    } else if (humidity! < 100) {
      return 'High';
    } else {
      return null;
    }
  }

  String? seaLevelDescription() {
    if(seaLevel == null){
      return null;
    }
      if (seaLevel! < 1000) {
        return 'Low';
      } else if (seaLevel! <= 2000) {
        return 'Normal';
      } else if (seaLevel! > 2000) {
        return 'High';
    }
      return null;
  }

  String? windLevelDescription() {
    if(wind == null){
      return null;
    }
    if (wind! < 25) {
      return 'Low';
    } else if (wind! <= 50) {
      return 'Normal';
    } else if (wind! > 50) {
      return 'High';
    } else {
      return null;
    }
  }

  String? badWeather(){
    if( main == 'Rain' || main == 'Clouds'){
      return 'Humidity looks ${humidityDescription() ?? 'Like we Can\'t get the value from it'}, sea level looks '
          '${seaLevelDescription() ?? 'Like we Can\'t get the value from it'} '
          'and wind looks ${windLevelDescription() ?? 'Like we Can\'t get the value from it'}, '
          'Let\'s get the fish from the supermarket instead';}
    return
      'Humidity looks ${humidityDescription() ?? 'Like we Can\'t get the value from it'}, sea level looks '
          '${seaLevelDescription() ?? 'Like we Can\'t get the value from it'} '
          'and wind looks ${windLevelDescription() ?? 'Like we Can\'t get the value from it'}, '
          'Let\'s get that fishing starting, and catch some douradas to your friends';

    }
  }




