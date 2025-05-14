class Weather {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
  DailyUnits? dailyUnits;
  Daily? daily;

  Weather({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.hourlyUnits,
    this.hourly,
    this.dailyUnits,
    this.daily,
  });

  Weather.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits =
        json['current_units'] != null
            ?  CurrentUnits.fromJson(json['current_units'])
            : null;
    current =
        json['current'] != null ?  Current.fromJson(json['current']) : null;
    hourlyUnits =
        json['hourly_units'] != null
            ?  HourlyUnits.fromJson(json['hourly_units'])
            : null;
    hourly =
        json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
    dailyUnits =
        json['daily_units'] != null
            ?  DailyUnits.fromJson(json['daily_units'])
            : null;
    daily = json['daily'] != null ? Daily.fromJson(json['daily']) : null;
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
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    if (dailyUnits != null) {
      data['daily_units'] = dailyUnits!.toJson();
    }
    if (daily != null) {
      data['daily'] = daily!.toJson();
    }
    return data;
  }
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2m;
  String? isDay;
  String? rain;
  String? precipitation;
  String? windSpeed10m;
  String? relativeHumidity2m;

  CurrentUnits({
    this.time,
    this.interval,
    this.temperature2m,
    this.isDay,
    this.rain,
    this.precipitation,
    this.windSpeed10m,
    this.relativeHumidity2m,
  });

  CurrentUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    isDay = json['is_day'];
    rain = json['rain'];
    precipitation = json['precipitation'];
    windSpeed10m = json['wind_speed_10m'];
    relativeHumidity2m = json['relative_humidity_2m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['temperature_2m'] = temperature2m;
    data['is_day'] = isDay;
    data['rain'] = rain;
    data['precipitation'] = precipitation;
    data['wind_speed_10m'] = windSpeed10m;
    data['relative_humidity_2m'] = relativeHumidity2m;
    return data;
  }
}

class Current {
  String? time;
  int? interval;
  double? temperature2m;
  int? isDay;
  double? rain;
  double? precipitation;
  double? windSpeed10m;
  int? relativeHumidity2m;

  Current({
    this.time,
    this.interval,
    this.temperature2m,
    this.isDay,
    this.rain,
    this.precipitation,
    this.windSpeed10m,
    this.relativeHumidity2m,
  });

  Current.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    isDay = json['is_day'];
    rain = json['rain'];
    precipitation = json['precipitation'];
    windSpeed10m = json['wind_speed_10m'];
    relativeHumidity2m = json['relative_humidity_2m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['temperature_2m'] = temperature2m;
    data['is_day'] = isDay;
    data['rain'] = rain;
    data['precipitation'] = precipitation;
    data['wind_speed_10m'] = windSpeed10m;
    data['relative_humidity_2m'] = relativeHumidity2m;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;

  HourlyUnits({this.time, this.temperature2m});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<double>? windSpeed;
  List<int>? cloudCover;

  Hourly({this.time, this.temperature2m});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
    windSpeed = json['wind_speed_10m'].cast<double>();
    cloudCover = json['cloud_cover'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature2m;
    data['wind_speed_10m'] = windSpeed;
    data['cloud_cover'] = cloudCover;
    return data;
  }
}

class DailyUnits {
  String? time;
  String? uvIndexMax;

  DailyUnits({this.time, this.uvIndexMax});

  DailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    uvIndexMax = json['uv_index_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['uv_index_max'] = uvIndexMax;
    return data;
  }
}

class Daily {
  List<String>? time;
  List<double>? uvIndexMax;

  Daily({this.time, this.uvIndexMax});

  Daily.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    uvIndexMax = json['uv_index_max'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['time'] = time;
    data['uv_index_max'] = uvIndexMax;
    return data;
  }
}
