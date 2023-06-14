class BaseModel<E> {
  bool? status;
  String? message;
  String? error;
  E? data;

  BaseModel({
    this.status,
    required this.message,
    this.error,
    this.data,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        status: json['status'],
        message: json['message'],
        error: json['error'],
        data: json['Data'],
      );
}
