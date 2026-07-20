import 'notification_campaign.dart';
import 'target_audience.dart';

void main() {
  final NotificationCampaign notificationCampaign1 = NotificationCampaign(
    campaignId: 3,
    campaignName: 'Offers',
    notificationTitle: 'There are available offer',
    notificationDescription: 'There are new offers for T-Shirt',
    targetAudience: TargetAudience(country: 'Egpt', activeUsersOnly: true),
    notificationChannels: [NotificationChannel.Push, NotificationChannel.SMS],
  );

  print(notificationCampaign1);

  final notificationCampaign2 = notificationCampaign1.clone().copyWith(
    campaignName: 'On the way',
    notificationTitle: 'Your order on the way',
    notificationDescription: 'Prepare yourself to receive the order',
  );
  print(notificationCampaign2);
}
