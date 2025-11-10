import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'notifications_header.dart';
import 'notification_card.dart';

class NotificationsContent extends StatefulWidget {
  const NotificationsContent({super.key});

  @override
  State<NotificationsContent> createState() => _NotificationsContentState();
}

class _NotificationsContentState extends State<NotificationsContent> {
  // Lista de notificaciones de ejemplo
  final List<Map<String, dynamic>> _notifications = [
    {
      'icon': Iconsax.home,
      'title': '¡Tu amigo Carlos ya cotizó su vivienda!',
      'time': 'Hoy 14:30',
      'code': '#F0088F8',
      'isRead': false,
    },
    {
      'icon': Iconsax.gift,
      'title': '¡Tu amigo Carlos ya cotizó su vivienda!',
      'time': 'Hoy 14:30',
      'code': null,
      'isRead': false,
    },
    {
      'icon': Iconsax.gift,
      'title': '¡Tu amigo Carlos ya cotizó su vivienda!',
      'time': 'Hoy 14:30',
      'code': null,
      'isRead': false,
    },
    {
      'icon': Iconsax.information,
      'title': '¡Tu amigo Carlos ya cotizó su vivienda!',
      'time': 'Hoy 14:30',
      'code': null,
      'isRead': true,
    },
    {
      'icon': Iconsax.information,
      'title': '¡Tu amigo Carlos ya cotizó su vivienda!',
      'time': 'Hoy 14:35',
      'code': null,
      'isRead': false,
    },
    {
      'icon': Iconsax.gift,
      'title': '¡Tu amigo Carlos ya cotizó su vivienda!',
      'time': 'Hoy 14:35',
      'code': null,
      'isRead': true,
    },
    {
      'icon': Iconsax.home,
      'title': '¡Tu amigo Carlos ya cotizó su vivienda!',
      'time': 'Hoy 14:35',
      'code': null,
      'isRead': true,
    },
  ];

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification['isRead'] = true;
      }
    });
  }

  void _markAsRead(int index) {
    setState(() {
      _notifications[index]['isRead'] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotificationsHeader(
          onMarkAllAsRead: _markAllAsRead,
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _notifications.length,
            itemBuilder: (context, index) {
              final notification = _notifications[index];
              return NotificationCard(
                icon: notification['icon'],
                title: notification['title'],
                time: notification['time'],
                code: notification['code'],
                isRead: notification['isRead'],
                onTap: () {
                  _markAsRead(index);
                },
                onMarkAsRead: () {
                  _markAsRead(index);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
