// To parse this JSON data, do
//
//     final recruiter = recruiterFromJson(jsonString);

import 'dart:convert';

Recruiter recruiterFromJson(String str) => Recruiter.fromJson(json.decode(str));

String recruiterToJson(Recruiter data) => json.encode(data.toJson());

class Recruiter {
  String? id;
  String? name;
  String? email;
  String? password;
  List<Job>? jobs;
  int? v;

  Recruiter(
      { this.id,
    this.name,
     this.email,
 this.jobs,
 this.v,
      this.password});

  factory Recruiter.fromJson(Map<String, dynamic> json) => Recruiter(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        jobs: List<Job>.from(json["jobs"].map((x) => Job.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "jobs": List<dynamic>.from(jobs!.map((x) => x.toJson())),
        "__v": v,
      };
}

class Job {
  String id;
  String title;
  String owner;
  DateTime createdAt;
  List<Applicant> applicants;
  int v;
  String? descriptionFile;

  Job({
    required this.id,
    required this.title,
    required this.owner,
    required this.createdAt,
    required this.applicants,
    required this.v,
    this.descriptionFile,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"],
        title: json["title"],
        owner: json["owner"],
        createdAt: DateTime.parse(json["createdAt"]),
        applicants: List<Applicant>.from(
            json["applicants"].map((x) => Applicant.fromJson(x))),
        v: json["__v"],
        descriptionFile: json["descriptionFile"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "owner": owner,
        "createdAt": createdAt.toIso8601String(),
        "applicants": List<dynamic>.from(applicants.map((x) => x.toJson())),
        "__v": v,
        "descriptionFile": descriptionFile,
      };
}

class Applicant {
  String applicant;
  String id;
  String? resumeFile;

  Applicant({
    required this.applicant,
    required this.id,
    this.resumeFile,
  });

  factory Applicant.fromJson(Map<String, dynamic> json) => Applicant(
        applicant: json["applicant"],
        id: json["_id"],
        resumeFile: json["resumeFile"],
      );

  Map<String, dynamic> toJson() => {
        "applicant": applicant,
        "_id": id,
        "resumeFile": resumeFile,
      };
}
