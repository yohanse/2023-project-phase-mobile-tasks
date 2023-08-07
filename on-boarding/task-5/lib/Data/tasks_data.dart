class TaskData {
  String _title;
  String _description;
  String _dueDate;
  TaskData(
    this._title,
    this._description,
    this._dueDate,
  );
  void setTitle(String title) {
    _title = title;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setDueDate(String dueDate) {
    _dueDate = dueDate;
  }

  String getTitle() {
    return _title;
  }

  String getDate() {
    return _dueDate;
  }

  String getDescription() {
    return _description;
  }

  String firstLetter() {
    return _title[0];
  }

  @override
  String toString() {
    return "$_title, $_description, $_dueDate";
  }
}
