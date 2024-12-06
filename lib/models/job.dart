import 'finance.dart';

class Job {
  final int id;
  final int professionId;
  final String profession;
  final int occupationId;
  final String occupation;
  final String? achievements;
  final String? companyName;
  final String? cons;
  final String? pros;
  final Finance finance;

  Job({
    required this.id,
    required this.professionId,
    required this.profession,
    required this.occupationId,
    required this.occupation,
    this.achievements,
    this.companyName,
    this.cons,
    this.pros,
    required this.finance,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      professionId: json['professionId'],
      profession: json['profession'],
      occupationId: json['occupation_id'],
      occupation: json['occupation'],
      achievements: json['achievements'],
      companyName: json['company_name'],
      cons: json['cons'],
      pros: json['pros'],
      finance: Finance.fromJson(json['finance']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'professionId': professionId,
      'profession': profession,
      'occupation_id': occupationId,
      'occupation': occupation,
      'achievements': achievements,
      'company_name': companyName,
      'cons': cons,
      'pros': pros,
      'finance': finance.toJson(),
    };
  }
}
