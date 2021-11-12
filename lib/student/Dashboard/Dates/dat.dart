class Task{
  String _taskname;
  String _taskdetails;
  String _taskdate;
  String _tasktime;
  

  Task(this._taskname,this._taskdetails,this._taskdate,this._tasktime);

  Task.map(dynamic obj){
    this._taskname = obj['taskname'];
    this._taskdetails = obj['taskdetails'];
    this._taskdate = obj['taskdate'];
    this._tasktime = obj['tasktime'];
    
  }

  String get  taskname=> _taskname;
  String get taskdetails => _taskdetails;
  String get taskdate => _taskdate;
  String get tasktime => _tasktime;
  

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['taskname']=_taskname;
     map['taskdetails'] = _taskdetails;
    map['taskdate'] = _taskdate;
    map['tasktime'] = _tasktime;
    
    return map;
  }

  Task.fromMap(Map<String,dynamic> map){
    this._taskname= map['taskname'];
    this._taskdetails = map['taskdetails'];
    this._taskdate = map['taskdate'];
    this._tasktime = map['tasktime'];
    
  }
}
