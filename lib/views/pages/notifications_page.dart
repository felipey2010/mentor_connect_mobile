import 'package:flutter/material.dart';
import 'package:mentor_hub_mobile/data/models.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<AppNotification> notifications = [
    AppNotification(
      id: '1',
      type: 'request',
      title: 'New Mentorship Request',
      body: 'John Doe has sent you a mentorship request.',
      timestamp: DateTime.now().subtract(Duration(minutes: 10)),
      isRead: false,
    ),
    AppNotification(
      id: '2',
      type: 'message',
      title: 'New Message',
      body: 'Jane Smith sent you a message.',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
      isRead: true,
    ),
    AppNotification(
      id: '3',
      type: 'alert',
      title: 'System Update',
      body: 'Your profile has been successfully updated.',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: const Color.fromARGB(40, 158, 158, 158),
            height: 1.0,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mark_as_unread),
            onPressed: _markAllAsRead,
            tooltip: 'Marcar como lidas',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationItem(
            notification: notification,
            onTap: () => _markAsRead(notification.id),
          );
        },
        padding: EdgeInsets.symmetric(vertical: 6.0),
      ),
    );
  }

  void _markAsRead(String id) {
    setState(() {
      notifications = notifications.map((notification) {
        if (notification.id == id) {
          return AppNotification(
            id: notification.id,
            type: notification.type,
            title: notification.title,
            body: notification.body,
            timestamp: notification.timestamp,
            isRead: true,
          );
        }
        return notification;
      }).toList();
    });
  }

  void _markAllAsRead() {
    setState(() {
      notifications = notifications.map((notification) {
        return AppNotification(
          id: notification.id,
          type: notification.type,
          title: notification.title,
          body: notification.body,
          timestamp: notification.timestamp,
          isRead: true,
        );
      }).toList();
    });
  }
}

class NotificationItem extends StatelessWidget {
  final AppNotification notification;
  final VoidCallback onTap;

  const NotificationItem(
      {super.key, required this.notification, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      shadowColor: Theme.of(context).colorScheme.onSurface,
      color: notification.isRead
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.tertiary,
      child: ListTile(
        leading: Icon(
          _getNotificationIcon(notification.type),
          color: _getNotificationColor(notification.type),
        ),
        title: Text(
          notification.title,
          style: TextStyle(fontSize: 15),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.body),
            SizedBox(height: 4),
            Text(
              _formatTimestamp(notification.timestamp),
              style: TextStyle(
                  fontSize: 12, color: Theme.of(context).colorScheme.outline),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  IconData _getNotificationIcon(String type) {
    switch (type) {
      case 'request':
        return Icons.people;
      case 'message':
        return Icons.message;
      case 'alert':
        return Icons.notifications;
      default:
        return Icons.notifications_none;
    }
  }

  Color _getNotificationColor(String type) {
    switch (type) {
      case 'request':
        return Colors.orange;
      case 'message':
        return Colors.blue;
      case 'alert':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays} day(s) ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour(s) ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute(s) ago';
    } else {
      return 'Just now';
    }
  }
}
