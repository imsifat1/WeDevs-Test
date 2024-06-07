class Filter {
  String title;
  bool value;

  Filter({required this.title, required this.value});

  Filter copyWith({String? title, bool? value,}) {

    return Filter(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }
}