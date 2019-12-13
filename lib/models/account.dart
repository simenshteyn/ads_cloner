class Account {
  int accountId, accountStatus;
  String accountType, accountName, accessRole;

  Account.fromJSON(Map<String, dynamic> json) {
        this.accountId = json['account_id'];
        this.accountType = json['account_type'];
        this.accountStatus = json['account_status'];
        this.accountName = json['account_name'];
        this.accessRole = json['access_role'];
  }
}
