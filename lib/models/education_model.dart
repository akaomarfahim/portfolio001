// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:portfolio_final_omar/firebase_options.dart';

class EducationModel {
  static List<EducationModel> experieces = [];
  static List<EducationModel> items = [
    EducationModel(
        id: 0,
        program: 'B.Sc in CSE',
        year: '2022 - present',
        institution: 'Notre Dame University Bangladesh',
        details: 'The insitution is a great for Compuer Sciecen lol, :3 ',
        others: ''),
    EducationModel(
        id: 1,
        program: 'HSC',
        year: '2019 - 2018',
        institution: 'Motijheel Model School and College',
        details: 'The insitution is a great for Compuer Sciecen lol, :3 ',
        others: ''),
    EducationModel(
        id: 2,
        program: 'SSC',
        year: '2017 - 2011',
        institution: 'Motijheel Model School and College',
        details: 'The insitution is a great for Compuer Sciecen lol, :3 ',
        others: ''),
    EducationModel(
        id: 3,
        program: 'JSC',
        year: '2022 - 2000',
        institution: 'Motijheel Model School and College',
        details: 'The insitution is a great for Compuer Sciecen lol, :3 ',
        others: ''),
  ];

  int? id;
  String? year;
  String? program;
  String? institution;
  String? details;
  String? others;
  EducationModel({
    this.id,
    this.year,
    this.program,
    this.institution,
    this.details,
    this.others,
  });

  static getData() async {
    items.clear();
    DatabaseReference ref = FirebaseConnection.connect;
    final snapshot = await ref.child('education').get();

    for (var element in snapshot.children) {
      EducationModel item = EducationModel.fromMap(Map<String, dynamic>.from(element.value as Map));
      log(item.toString());
      items.add(item);
    }

    await getExperiencesData();
  }

  static getExperiencesData() async {
    experieces.clear();
    DatabaseReference ref = FirebaseConnection.connect;
    final snapshot = await ref.child('experiences').get();

    for (var element in snapshot.children) {
      EducationModel item = EducationModel.fromMap(Map<String, dynamic>.from(element.value as Map));
      log(item.toString());
      experieces.add(item);
    }
  }

  EducationModel copyWith({
    int? id,
    String? year,
    String? program,
    String? institution,
    String? details,
    String? others,
  }) {
    return EducationModel(
      id: id ?? this.id,
      year: year ?? this.year,
      program: program ?? this.program,
      institution: institution ?? this.institution,
      details: details ?? this.details,
      others: others ?? this.others,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'year': year,
      'program': program,
      'institution': institution,
      'details': details,
      'others': others,
    };
  }

  factory EducationModel.fromMap(Map<String, dynamic> map) {
    return EducationModel(
      id: map['id'] != null ? map['id'] as int : null,
      year: map['year'] != null ? map['year'] as String : null,
      program: map['program'] != null ? map['program'] as String : null,
      institution: map['institution'] != null ? map['institution'] as String : null,
      details: map['details'] != null ? map['details'] as String : null,
      others: map['others'] != null ? map['others'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EducationModel.fromJson(String source) => EducationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EducationModel(id: $id, year: $year, program: $program, institution: $institution, details: $details, others: $others)';
  }

  @override
  bool operator ==(covariant EducationModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.year == year && other.program == program && other.institution == institution && other.details == details && other.others == others;
  }

  @override
  int get hashCode {
    return id.hashCode ^ year.hashCode ^ program.hashCode ^ institution.hashCode ^ details.hashCode ^ others.hashCode;
  }
}
