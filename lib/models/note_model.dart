class Note {
  String title;
  String description;
  int sno;
  String refID;

  Note({this.sno = 0, this.title = '', this.description = '', required this.refID});

  isNull() {
    if (title.toString().isEmpty || description.toString().isEmpty) return true;
    return false;
  }
}
