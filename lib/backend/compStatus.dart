class CompStatus {
  bool working;
  bool keyboard, mouse, internet, boot;
  String changedDate, name;
  String compId, userId;

  CompStatus(bool working, bool keyboard, bool mouse, bool internet, bool boot, String changedDate, String name, String compId,
  String userId) {
    this.working = working;
    this.keyboard = keyboard;
    this.mouse = mouse;
    this.internet = internet;
    this.boot = boot;
    this.changedDate = changedDate;
    this.name = name;
    this.compId = compId;
    this.userId = userId;
  }
}