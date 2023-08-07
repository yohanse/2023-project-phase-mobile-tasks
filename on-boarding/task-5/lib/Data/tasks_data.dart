class TaskData {
  String _title;
  String _description;
  String _dueDate;
  TaskData(
    this._title,
    this._description,
    this._dueDate,
  );

  void update({title, description, dueDate}) {
    _title = title;
    _description = description;
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
}
