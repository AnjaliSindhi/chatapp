class Data{
  String? text;
  String? userId;
  DateTime? dateTime;
  String? name;

  Data(this.text, this.dateTime, this.name);

  Data.fromJson(Map<dynamic, dynamic> json) 
    :  dateTime = DateTime.parse(json['datetime'] as String),
    text = json['text'] as String,
    name = json['name'] as String;

    Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'datetime' : dateTime.toString(),
      'text' : text,
      'name' : name,
    } ;
}