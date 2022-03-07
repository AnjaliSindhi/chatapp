class Data{
  String? text;
  String? userId;
  DateTime? dateTime;

  Data(this.text, this.dateTime);

  Data.fromJson(Map<dynamic, dynamic> json) 
    :  dateTime = DateTime.parse(json['datetime'] as String),
    text = json['text'] as String;

    Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
      'datetime' : dateTime.toString(),
      'text' : text,
    } ;
}