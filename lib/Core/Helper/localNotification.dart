part of core;


class LocalNotificationX{

  static sendNotificationScheduled({required String title,required String body,required String summary,required String route,required Map<String, String> data,required DateTime dateTime}) async {
    data.addAll({'Route': route});
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: LocalDataX.unreadNotifications+1,
        channelKey: 'scheduled',
        title: title,
        body: body,
        wakeUpScreen: true,
        category: NotificationCategory.Reminder,
        payload: data,
        summary: summary,
        notificationLayout: NotificationLayout.BigText,
        fullScreenIntent:true,
      ),
      schedule: NotificationCalendar.fromDate(date: dateTime,allowWhileIdle: true),
    );
  }

  static sendNotification({required String title,required String body,}) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: LocalDataX.unreadNotifications+1,
          channelKey: 'basic_channel',
          title: title,
          body: body,
          actionType: ActionType.Default
      ),
    );
  }

  static Future<void> init() async {
    AwesomeNotifications().initialize(
         // set the icon to null if you want to use the default app icon
        'resource://drawable/ic_stat_android',
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'scheduled',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: ColorX.primary,
            playSound: true,
          ),
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: ColorX.primary,
            playSound: true,
          )
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group',
          )
        ],
        debug: true
    );
    // Only after at least the action method is set, the notification events are delivered
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:         _onActionReceivedMethod,
        onNotificationCreatedMethod:    _onNotificationCreatedMethod,
        onNotificationDisplayedMethod:  _onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:  _onDismissActionReceivedMethod
    );
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
  }

  /// Use this method to detect when a new notification or a schedule is created
  @pragma("vm:entry-point")
  static Future <void> _onNotificationCreatedMethod(ReceivedNotification receivedNotification) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future <void> _onNotificationDisplayedMethod(ReceivedNotification val) async {
    LocalDataX.initialize();
    LocalDataX.put(LocalNames.unreadNotifications,LocalDataX.unreadNotifications++);
    NotificationX x=NotificationX(id: val.id??0, title: val.title??'', body: val.body??'', summary: val.summary??'', payload: val.payload??{},dateTime: DateTime.now());
    LocalDataX.allNotifications.add(x);
    LocalDataX.put(LocalNames.allNotifications,LocalDataX.allNotifications.map((e) => e.toJson()).toList());
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future <void> _onDismissActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future <void> _onActionReceivedMethod(ReceivedAction receivedAction) async {
    // Your code goes here
    LocalDataX.put(LocalNames.unreadNotifications,LocalDataX.unreadNotifications--);
    if(receivedAction.payload?['Route']!=null) {
      Get.toNamed(receivedAction.payload!['Route']!,arguments: receivedAction.payload);
    }
  }
}
