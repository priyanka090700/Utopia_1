class Subject{
  String _subjectname;
  

  Subject(this._subjectname);

  Subject.map(dynamic obj){
    this._subjectname = obj['subjectname'];
    
  }

  String get  subjectname=> _subjectname;
  

  Map<String,dynamic> toMap(){
    var map=new Map<String,dynamic>();
    map['subjectname']=_subjectname;
     
    return map;
  }

  Subject.fromMap(Map<String,dynamic> map){
    this._subjectname= map['subjectname'];
    
  }
}