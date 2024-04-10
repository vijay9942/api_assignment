 class LessonModel {
  String? requestId;
  List<Items>? items;
  int? count;
  String? anykey;

  LessonModel({
    this.requestId,this.items,this.count,this.anykey
 });
  LessonModel.fromjson(Map<String,dynamic> json) {
    requestId=json['requestId'];
    if (json['items'] != null){
      items = <Items>[];
      json['items'].forEach((v){
        items!.add(new Items.fromjson(v));
      });
    }
    count = json['count'];
    anykey = json['anyKey'];
  }
  Map<String,dynamic> tojson() {
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['count'] = this.count;
    data['anyKey'] = this.anykey;
    return data;
  }
 }
 class Items {
   String? createdAt;
   String? name;
   int? duration;
   String? category;
   bool? locked;
   String? id;

   Items(
   {
     this.createdAt,
     this.name,
     this.duration,
     this.category,
     this.locked,
     this.id
 }
       );

   Items.fromjson(Map<String,dynamic> json){
     createdAt= json['createdAt'];
     name= json['name'];
     duration =json ['duration'];
     category =json['category'];
     locked =json['locked'];
     id=json['id'];
   }

   Map<String,dynamic> tojson() {
     final Map<String,dynamic> data = new Map<String, dynamic>();
     data['createdAt'] = this.createdAt;
     data['name'] = this.name;
     data['duration'] = this.duration;
     data['category'] = this.category;
     data['locked'] = this.locked;
     data['id'] = this.id;
     return data;

   }
 }