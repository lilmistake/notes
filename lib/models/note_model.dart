class Note {
  String title;
  String description;
  int ts;

  Note({this.ts = 0, this.title = '', this.description = ''});

  isNull() {
    if (title.toString().isEmpty || description.toString().isEmpty) return true;
    return false;
  }
}
