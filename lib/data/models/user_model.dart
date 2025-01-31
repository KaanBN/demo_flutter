import '../../domain/entities/user.dart';
import 'address_model.dart';
import 'company_model.dart';

class UserModel extends User {
  UserModel({
    required int id,
    required String name,
    required String email,
    required String username,
    required AddressModel address,
    required String phone,
    required String website,
    required CompanyModel company,
  }) : super(
    id: id,
    name: name,
    email: email,
    username: username,
    address: address,
    phone: phone,
    website: website,
    company: company,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      address: AddressModel.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: CompanyModel.fromJson(json['company']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'address': (address as AddressModel).toJson(),
      'phone': phone,
      'website': website,
      'company': (company as CompanyModel).toJson(),
    };
  }
}