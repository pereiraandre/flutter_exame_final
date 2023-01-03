
class Description {

  String humidityDescription(int humidity) {
    if (humidity < 30) {
      return 'Low';
    } else if (humidity < 50) {
      return 'Normal';
    } else if (humidity < 100) {
      return 'High';
    } else {
      return 'Null';
    }
  }

  String seaLevelDescription(int seaLevel) {
    if (seaLevel < 1000) {
      return 'Low';
    } else if (seaLevel <= 2000) {
      return 'Normal';
    } else if (seaLevel > 2000) {
      return 'High';
    } else {
      return 'Null';
    }
  }

  String windLevelDescription(int windLevel) {
    if (windLevel < 25) {
      return 'Low';
    } else if (windLevel <= 50) {
      return 'Normal';
    } else if (windLevel > 50) {
      return 'High';
    } else {
      return 'Null';
    }
  }

}

