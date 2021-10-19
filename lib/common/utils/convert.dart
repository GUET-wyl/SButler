import 'dart:convert' as convert;

String mapToJson(Map json) {
  String jst = convert.jsonEncode(json);
  return jst;
}

Map jsonToMap(String jst) {
  return convert.jsonDecode(jst);
}
