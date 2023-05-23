import 'dart:convert';
class Customer {
   String? name;
   String? id;
   String? phone;
   String? gender;
   String? socialNumber;
   String? dateOfBirth;
   double? balance;
   String? nationality;
  Customer({
    required this.name,
    required this.id,
    required this.phone,
    required this.gender,
    required this.socialNumber,
    required this.dateOfBirth,
    required this.balance,
    required this.nationality,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "name":name,
      'id': id,
      'phone': phone,
      'gender': gender,
      'socialNumber': socialNumber,
      'dateOfBirth': dateOfBirth,
      'balance': balance,
      'nationality': nationality,
    };

    }
    Customer.fromjson(Map <String,dynamic> map)
  {
   name=map['name'];

   id=map['id'].toString();
   phone=map['phone'].toString();
   gender=map['gender'];
   socialNumber=map['socialNumber'].toString();
   dateOfBirth=map['dateOfBirth'].toString();
   balance=double.parse(map['balance'].toString()!);
   nationality=map['nationality'];

  }


}
