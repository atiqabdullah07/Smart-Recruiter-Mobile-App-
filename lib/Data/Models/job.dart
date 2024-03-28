

class Job1 {
  String? id;
  String? title;
  bool? isApplied;
  String? descriptionFile;
  String? jobType;
  String? experienceLevel;
  String? owner;
  String? companyName;
  List<String>? skills;
  String? createdAt;
  String? companyLogo;
  List<dynamic>? applicants;

  Job1({
    this.id,
    this.isApplied,
    this.title,
    this.descriptionFile,
    this.jobType,
    this.companyName,
    this.experienceLevel,
    this.owner,
    this.companyLogo,
    this.skills,
    this.createdAt,
    this.applicants,
  });
}
