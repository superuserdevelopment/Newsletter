class User {
  final String uid;
  List<String> subscribedTopic = [];

  User({this.uid});
  void addUserTopic(String topicId) {
    subscribedTopic.add(topicId);
  }

  void removeUserTopic(String topicId) {
    subscribedTopic.remove(topicId);
  }
}
