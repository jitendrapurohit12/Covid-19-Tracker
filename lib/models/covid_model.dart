class CovidModel {
  Global global;
  List<Countries> countries;

  CovidModel({this.global, this.countries});

  CovidModel.fromJson(Map<String, dynamic> json) {
    global = json['Global'] != null
        ? Global.fromJson(json['Global'] as Map<String, dynamic>)
        : null;
    if (json['Countries'] != null) {
      countries = <Countries>[];
      json['Countries'].forEach((v) {
        countries.add(Countries.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (global != null) {
      data['Global'] = global.toJson();
    }
    if (countries != null) {
      data['Countries'] = countries.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Global {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;

  Global(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  Global.fromJson(Map<String, dynamic> json) {
    newConfirmed = json['NewConfirmed'] as int;
    totalConfirmed = json['TotalConfirmed'] as int;
    newDeaths = json['NewDeaths'] as int;
    totalDeaths = json['TotalDeaths'] as int;
    newRecovered = json['NewRecovered'] as int;
    totalRecovered = json['TotalRecovered'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    return data;
  }
}

class Countries {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Countries(
      {this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  Countries.fromJson(Map<String, dynamic> json) {
    country = json['Country'] as String;
    countryCode = json['CountryCode'] as String;
    slug = json['Slug'] as String;
    newConfirmed = json['NewConfirmed'] as int;
    totalConfirmed = json['TotalConfirmed'] as int;
    newDeaths = json['NewDeaths'] as int;
    totalDeaths = json['TotalDeaths'] as int;
    newRecovered = json['NewRecovered'] as int;
    totalRecovered = json['TotalRecovered'] as int;
    date = json['Date'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Country'] = country;
    data['CountryCode'] = countryCode;
    data['Slug'] = slug;
    data['NewConfirmed'] = newConfirmed;
    data['TotalConfirmed'] = totalConfirmed;
    data['NewDeaths'] = newDeaths;
    data['TotalDeaths'] = totalDeaths;
    data['NewRecovered'] = newRecovered;
    data['TotalRecovered'] = totalRecovered;
    data['Date'] = date;
    return data;
  }
}
