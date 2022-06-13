class TourModel {
  String? continent;
  String? image;
  String? overview;
  List<String>? images;
  int? distance;
  String? weatherCondition;
  double? rating;
  int? numberOfReviews;
  String? title;
  int? startedPrice;
  int? temperature;
  int? durationDay;
  String? id;
  String? category;
  int? extraPrice;
  String? details;
  String? reviews;
  String? costs;

  TourModel({
    this.continent,
    this.image,
    this.overview,
    this.images,
    this.distance,
    this.weatherCondition,
    this.rating,
    this.numberOfReviews,
    this.title,
    this.startedPrice,
    this.temperature,
    this.durationDay,
    this.id,
    this.category,
    this.details,
    this.reviews,
    this.costs,
  });

  TourModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    continent = json['continent'];
    image = json['image'];
    extraPrice = json['extra_price'];
    overview = json['overview'];
    images = json['images'].cast<String>();
    distance = json['distance'];
    weatherCondition = json['weather_condition'];
    rating = json['rating'];
    numberOfReviews = json['number_of_reviews'];
    startedPrice = json['started_price'];
    temperature = json['temperature'];
    durationDay = json['duration_day'];
    id = json['id'];
    category = json['category'];
    details = json['details'];
    reviews = json['reviews'];
    costs = json['costs'];
  }
}
