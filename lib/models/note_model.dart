class Note {
  String title;
  String description;
  String refID;
  int ts;

  Note({this.ts = 0,this.title = '', this.description = '', required this.refID});

  isNull() {
    if (title.toString().isEmpty || description.toString().isEmpty) return true;
    return false;
  }
}
