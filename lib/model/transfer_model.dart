class Transfer{
   String? sender;
   String? reciever;
   String? ids;
   String? idr;
   double? value;
   String? time;

  Transfer( {required this.sender, required this.reciever, required this.value, required this.time,required this.ids,required this.idr});
 Map<String,dynamic> toJson()
  {
    return {
      'sender':sender,
      'reciever':reciever,
      'ids':ids,
      'idr':idr,
      'value':value.toString(),
      'time':time,
    };
  }
   Transfer.fromjson(Map<String ,dynamic>json){
   sender=json['sender'];
   reciever=json['reciever'];
   ids=json['ids'].toString();
   idr=json['idr'].toString();
   value=double.parse(json['value'].toString());
   time=json['time'].toString();
   }

}