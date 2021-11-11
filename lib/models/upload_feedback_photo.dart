import 'dart:convert';

List<String> uploadFeedbackPhotoFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String uploadFeedbackPhotoToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
