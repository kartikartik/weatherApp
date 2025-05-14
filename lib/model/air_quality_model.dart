class AirQuality {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;

  AirQuality({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
  });

  AirQuality.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits =
        json['current_units'] != null
            ? CurrentUnits.fromJson(json['current_units'])
            : null;
    current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (currentUnits != null) {
      data['current_units'] = currentUnits!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }

    return data;
  }
}

class CurrentUnits {
  String? time;
  String? interval;
  String? grassPollen;
  String? pm25;

  CurrentUnits({this.time, this.interval, this.grassPollen, this.pm25});

  CurrentUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    grassPollen = json['grass_pollen'];
    pm25 = json['pm2_5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['grass_pollen'] = grassPollen;
    data['pm2_5'] = pm25;
    return data;
  }
}

class Current {
  String? time;
  int? interval;
  double? grassPollen;
  double? pm25;

  Current({this.time, this.interval, this.grassPollen, this.pm25});

  Current.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    grassPollen = json['grass_pollen'] ?? 0.0;
    pm25 = json['pm2_5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['grass_pollen'] = grassPollen;
    data['pm2_5'] = pm25;
    return data;
  }
}
