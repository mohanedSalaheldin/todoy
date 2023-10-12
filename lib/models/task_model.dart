class TaskModel {
  String? taskName;
  String? taskId;
  String? taskTag;
  String? taskDesc;

  TaskModel({this.taskName, this.taskId, this.taskTag, this.taskDesc});

  TaskModel.fromJson(Map<String, dynamic> json) {
    taskName = json['taskName'];
    taskId = json['taskId'];
    taskTag = json['taskTag'];
    taskDesc = json['taskDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['taskName'] = taskName;
    data['taskId'] = taskId;
    data['taskTag'] = taskTag;
    data['taskDesc'] = taskDesc;
    return data;
  }
}