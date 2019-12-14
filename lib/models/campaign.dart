class Campaign {
  int id, status;
  String type, name, dayLimit, allLimit, startTime, stopTime, createTime, updateTime;

  Campaign.fromJSON(Map<String, dynamic> json) {
        this.id = json['id'];
        this.status = json['status'];
        this.type = json['type'];
        this.name = json['name'];
        this.dayLimit = json['day_limit'];
        this.allLimit = json['all_limit'];
        this.startTime = json['start_time'];
        this.stopTime = json['stop_time'];
        this.createTime = json['create_time'];
        this.updateTime = json['update_time'];
  }
}