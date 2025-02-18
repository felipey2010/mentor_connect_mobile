// models.dart
enum PostStatus { public, private }

class User {
  final String id;
  final String name;
  final String username;
  final String image;

  User({
    required this.id,
    required this.name,
    required this.username,
    required this.image,
  });
}

class Post {
  final String id;
  final String userId;
  final String content;
  final PostStatus status;
  final DateTime createdAt;
  final DateTime? modifiedAt;
  final User user;
  final int commentsCount;

  Post({
    required this.id,
    required this.userId,
    required this.content,
    required this.status,
    required this.createdAt,
    this.modifiedAt,
    required this.user,
    required this.commentsCount,
  });
}

class Comment {
  final String id;
  final String postId;
  final String userId;
  final String content;
  final DateTime createdAt;
  final DateTime? modifiedAt;
  final User user;

  Comment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.createdAt,
    this.modifiedAt,
    required this.user,
  });
}

class Profile {
  final String id;
  final String name;
  final String username;
  final String email;
  final String bio;
  final String image;
  final List<String> skills;
  final String mentoringPreference; // e.g., "Mentor", "Mentee", "Both"
  final DateTime joinedAt;

  Profile({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.bio,
    required this.image,
    required this.skills,
    required this.mentoringPreference,
    required this.joinedAt,
  });
}

class AppNotification {
  final String id;
  final String type; // e.g., 'request', 'message', 'alert'
  final String title;
  final String body;
  final DateTime timestamp;
  final bool isRead;

  AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.timestamp,
    this.isRead = false,
  });
}
