import 'dart:convert';

HomePageModel welcomeFromJson(String str) => HomePageModel.fromJson(json.decode(str));

String welcomeToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  List<Travel> travels;
  User user;

  HomePageModel({
    required this.travels,
    required this.user,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
    travels: List<Travel>.from(json["travels"].map((x) => Travel.fromJson(x))),
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "travels": List<dynamic>.from(travels.map((x) => x.toJson())),
    "user": user.toJson(),
  };
}

class Travel {
  int id;
  Destination destination;
  List<String> weekDays;
  String weight;
  String leaveTime;
  List<Economic> economic;
  List<Economic> vip;

  Travel({
    required this.id,
    required this.destination,
    required this.weekDays,
    required this.weight,
    required this.leaveTime,
    required this.economic,
    required this.vip,
  });

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
    id: json["id"],
    destination: Destination.fromJson(json["destination"]),
    weekDays: List<String>.from(json["week_days"].map((x) => x)),
    weight: json["weight"],
    leaveTime: json["leave_time"],
    economic: List<Economic>.from(json["economic"].map((x) => Economic.fromJson(x))),
    vip: List<Economic>.from(json["vip"].map((x) => Economic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "destination": destination.toJson(),
    "week_days": List<dynamic>.from(weekDays.map((x) => x)),
    "weight": weight,
    "leave_time": leaveTime,
    "economic": List<dynamic>.from(economic.map((x) => x.toJson())),
    "vip": List<dynamic>.from(vip.map((x) => x.toJson())),
  };
}

class Destination {
  int id;
  Airline airline;
  City startCity;
  City endCity;

  Destination({
    required this.id,
    required this.airline,
    required this.startCity,
    required this.endCity,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
    id: json["id"],
    airline: Airline.fromJson(json["airline"]),
    startCity: City.fromJson(json["start_city"]),
    endCity: City.fromJson(json["end_city"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "airline": airline.toJson(),
    "start_city": startCity.toJson(),
    "end_city": endCity.toJson(),
  };
}

class Airline {
  int id;
  String name;
  String image;

  Airline({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
  };
}

class City {
  int id;
  String name;
  String airportName;
  String code;

  City({
    required this.id,
    required this.name,
    required this.airportName,
    required this.code,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
    airportName: json["airport_name"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "airport_name": airportName,
    "code": code,
  };
}

class Economic {
  int id;
  int travelId;
  String type;
  String title;
  String det;
  int price;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Economic({
    required this.id,
    required this.travelId,
    required this.type,
    required this.title,
    required this.det,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Economic.fromJson(Map<String, dynamic> json) => Economic(
    id: json["id"],
    travelId: json["travel_id"],
    type: json["type"],
    title: json["title"],
    det: json["det"],
    price: json["price"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "travel_id": travelId,
    "type": type,
    "title": title,
    "det": det,
    "price": price,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class User {
  int id;
  String name;
  String phoneCode;
  String phone;
  String image;
  String password;
  int code;
  String email;
  dynamic emailVerifiedAt;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.phoneCode,
    required this.phone,
    required this.image,
    required this.password,
    required this.code,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    phoneCode: json["phone_code"],
    phone: json["phone"],
    image: json["image"],
    password: json["password"],
    code: json["code"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    role: json["role"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone_code": phoneCode,
    "phone": phone,
    "image": image,
    "password": password,
    "code": code,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "role": role,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

