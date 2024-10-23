class JobShort {
  final String profession;
  final String occupation;

  JobShort({
    required this.profession,
    required this.occupation,
  });

  factory JobShort.fromJson(Map<String, dynamic> json) {
    return JobShort(
      profession: json['profession'],
      occupation: json['occupation'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profession': profession,
      'occupation': occupation,
    };
  }
}
