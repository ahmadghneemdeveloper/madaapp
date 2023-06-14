import 'dart:convert';

ReservationsPageModel welcomeFromJson(String str) => ReservationsPageModel.fromJson(json.decode(str));

String welcomeToJson(ReservationsPageModel data) => json.encode(data.toJson());

class ReservationsPageModel {
  String message;
  String exception;
  String file;
  int line;
  List<Trace> trace;

  ReservationsPageModel({
    required this.message,
    required this.exception,
    required this.file,
    required this.line,
    required this.trace,
  });

  factory ReservationsPageModel.fromJson(Map<String, dynamic> json) => ReservationsPageModel(
    message: json["message"],
    exception: json["exception"],
    file: json["file"],
    line: json["line"],
    trace: List<Trace>.from(json["trace"].map((x) => Trace.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "exception": exception,
    "file": file,
    "line": line,
    "trace": List<dynamic>.from(trace.map((x) => x.toJson())),
  };
}

class Trace {
  String file;
  int line;
  String function;
  String traceClass;
  Type type;

  Trace({
    required this.file,
    required this.line,
    required this.function,
    required this.traceClass,
    required this.type,
  });

  factory Trace.fromJson(Map<String, dynamic> json) => Trace(
    file: json["file"],
    line: json["line"],
    function: json["function"],
    traceClass: json["class"],
    type: typeValues.map[json["type"]]!,
  );

  Map<String, dynamic> toJson() => {
    "file": file,
    "line": line,
    "function": function,
    "class": traceClass,
    "type": typeValues.reverse[type],
  };
}

enum Type { EMPTY }

final typeValues = EnumValues({
  "->": Type.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
