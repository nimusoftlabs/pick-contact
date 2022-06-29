class PhoneNumber {
  PhoneNumber({required this.number, required this.label});

  final String? number;
  final String? label;

  factory PhoneNumber.fromMap(Map<dynamic, dynamic> map) =>
      PhoneNumber(number: map['number'], label: map['label']);


}