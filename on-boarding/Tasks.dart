class Task {
  String _title;
  String _description;
  DateTime _dueDate;
  bool _status;
  Task(
    this._title,
    this._description,
    this._dueDate,
    this._status,
  );
  void setTitle(String title) {
    _title = title;
  }

  void setDescription(String description) {
    _description = description;
  }

  void setDueDate(DateTime dueDate) {
    _dueDate = dueDate;
  }

  void setStatus(bool status) {
    _status = status;
  }

  bool getSatus() {
    return _status;
  }

  @override
  String toString() {
    return "${_title}, ${_description}, ${_dueDate.day} - ${_dueDate.month} - ${_dueDate.year}, ${_status}";
  }
}