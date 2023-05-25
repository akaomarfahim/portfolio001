import 'dart:convert';
import 'dart:developer';
import 'package:firebase_database/firebase_database.dart';

import '../backend/Firebase/firebase_backend.dart';

class ProfileModel {
  static ProfileModel? profile;

  String name;
  String imageUrl;
  String tagLine;
  String introLine;
  String username;
  String fullName;
  String animatedTexts;
  String linkdInLink;
  String github;
  String facebook;
  String instagram;
  String twitter;
  String dribble;
  String pinterest;
  String coffee;
  String downloadCv;
  String hireMe;
  String email;
  String phone;
  String website;
  String address;
  String bio;
  String languages;
  String programmingSkills;
  String otherSkills;
  String selfEvaluation;

  ProfileModel({
    required this.name,
    required this.imageUrl,
    required this.tagLine,
    required this.introLine,
    required this.username,
    required this.fullName,
    required this.animatedTexts,
    required this.linkdInLink,
    required this.github,
    required this.facebook,
    required this.instagram,
    required this.twitter,
    required this.dribble,
    required this.pinterest,
    required this.coffee,
    required this.downloadCv,
    required this.hireMe,
    required this.email,
    required this.phone,
    required this.website,
    required this.address,
    required this.bio,
    required this.languages,
    required this.programmingSkills,
    required this.otherSkills,
    required this.selfEvaluation,
  });

  static getData() async {
    try {
      DatabaseReference ref = FirebaseAPI.connect;
      final snapshot = await ref.child('profile').get();
      return profile = ProfileModel.fromMap(Map<String, dynamic>.from(snapshot.value as Map));
    } catch (e) {
      log('ERROR $e');
    }
  }

  ProfileModel copyWith({
    String? name,
    String? imageUrl,
    String? tagLine,
    String? introLine,
    String? username,
    String? fullName,
    String? animatedTexts,
    String? linkdInLink,
    String? github,
    String? facebook,
    String? instagram,
    String? twitter,
    String? dribble,
    String? pinterest,
    String? coffee,
    String? downloadCv,
    String? hireMe,
    String? email,
    String? phone,
    String? website,
    String? address,
    String? bio,
    String? languages,
    String? programmingSkills,
    String? otherSkills,
    String? selfEvaluation,
  }) {
    return ProfileModel(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      tagLine: tagLine ?? this.tagLine,
      introLine: introLine ?? this.introLine,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      animatedTexts: animatedTexts ?? this.animatedTexts,
      linkdInLink: linkdInLink ?? this.linkdInLink,
      github: github ?? this.github,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      twitter: twitter ?? this.twitter,
      dribble: dribble ?? this.dribble,
      pinterest: pinterest ?? this.pinterest,
      coffee: coffee ?? this.coffee,
      downloadCv: downloadCv ?? this.downloadCv,
      hireMe: hireMe ?? this.hireMe,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      address: address ?? this.address,
      bio: bio ?? this.bio,
      languages: languages ?? this.languages,
      programmingSkills: programmingSkills ?? this.programmingSkills,
      otherSkills: otherSkills ?? this.otherSkills,
      selfEvaluation: selfEvaluation ?? this.selfEvaluation,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
      'tagLine': tagLine,
      'introLine': introLine,
      'username': username,
      'fullName': fullName,
      'animatedTexts': animatedTexts,
      'linkdInLink': linkdInLink,
      'github': github,
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
      'dribble': dribble,
      'pinterest': pinterest,
      'coffee': coffee,
      'downloadCv': downloadCv,
      'hireMe': hireMe,
      'email': email,
      'phone': phone,
      'website': website,
      'address': address,
      'bio': bio,
      'languages': languages,
      'programmingSkills': programmingSkills,
      'otherSkills': otherSkills,
      'selfEvaluation': selfEvaluation,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      name: map['name'] != null ? map['name'] as String : '',
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : '',
      tagLine: map['tagLine'] != null ? map['tagLine'] as String : '',
      introLine: map['introLine'] != null ? map['introLine'] as String : '',
      username: map['username'] != null ? map['username'] as String : '',
      fullName: map['fullName'] != null ? map['fullName'] as String : '',
      animatedTexts: map['animatedTexts'] != null ? map['animatedTexts'] as String : '',
      linkdInLink: map['linkdInLink'] != null ? map['linkdInLink'] as String : '',
      github: map['github'] != null ? map['github'] as String : '',
      facebook: map['facebook'] != null ? map['facebook'] as String : '',
      instagram: map['instagram'] != null ? map['instagram'] as String : '',
      twitter: map['twitter'] != null ? map['twitter'] as String : '',
      dribble: map['dribble'] != null ? map['dribble'] as String : '',
      pinterest: map['pinterest'] != null ? map['pinterest'] as String : '',
      coffee: map['coffee'] != null ? map['coffee'] as String : '',
      downloadCv: map['downloadCv'] != null ? map['downloadCv'] as String : '',
      hireMe: map['hireMe'] != null ? map['hireMe'] as String : '',
      email: map['email'] != null ? map['email'] as String : '',
      phone: map['phone'] != null ? map['phone'] as String : '',
      website: map['website'] != null ? map['website'] as String : '',
      address: map['address'] != null ? map['address'] as String : '',
      bio: map['bio'] != null ? map['bio'] as String : '',
      languages: map['languages'] != null ? map['languages'] as String : '',
      programmingSkills: map['programmingSkills'] != null ? map['programmingSkills'] as String : '',
      otherSkills: map['otherSkills'] != null ? map['otherSkills'] as String : '',
      selfEvaluation: map['selfEvaluation'] != null ? map['selfEvaluation'] as String : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileModel.fromJson(String source) => ProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileModel(name: $name, imageUrl: $imageUrl, tagLine: $tagLine, introLine: $introLine, username: $username, fullName: $fullName, animatedTexts: $animatedTexts, linkdInLink: $linkdInLink, github: $github, facebook: $facebook, twitter: $twitter, dribble: $dribble, pinterest: $pinterest, coffee: $coffee, downloadCv: $downloadCv, hireMe: $hireMe, email: $email, phone: $phone, website: $website, address: $address, bio: $bio, languages: $languages, programmingSkills: $programmingSkills, otherSkills: $otherSkills, selfEvaluation: $selfEvaluation)';
  }

  @override
  bool operator ==(covariant ProfileModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.imageUrl == imageUrl &&
        other.tagLine == tagLine &&
        other.introLine == introLine &&
        other.username == username &&
        other.fullName == fullName &&
        other.animatedTexts == animatedTexts &&
        other.linkdInLink == linkdInLink &&
        other.github == github &&
        other.facebook == facebook &&
        other.twitter == twitter &&
        other.dribble == dribble &&
        other.pinterest == pinterest &&
        other.coffee == coffee &&
        other.downloadCv == downloadCv &&
        other.hireMe == hireMe &&
        other.email == email &&
        other.phone == phone &&
        other.website == website &&
        other.address == address &&
        other.bio == bio &&
        other.languages == languages &&
        other.programmingSkills == programmingSkills &&
        other.otherSkills == otherSkills &&
        other.selfEvaluation == selfEvaluation;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        tagLine.hashCode ^
        introLine.hashCode ^
        username.hashCode ^
        fullName.hashCode ^
        animatedTexts.hashCode ^
        linkdInLink.hashCode ^
        github.hashCode ^
        facebook.hashCode ^
        twitter.hashCode ^
        dribble.hashCode ^
        pinterest.hashCode ^
        coffee.hashCode ^
        downloadCv.hashCode ^
        hireMe.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        address.hashCode ^
        bio.hashCode ^
        languages.hashCode ^
        programmingSkills.hashCode ^
        otherSkills.hashCode ^
        selfEvaluation.hashCode;
  }
}
