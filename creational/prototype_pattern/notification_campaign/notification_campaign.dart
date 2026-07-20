import 'prototype.dart';
import 'target_audience.dart';

class NotificationCampaign implements Prototype<NotificationCampaign> {
  final int campaignId;
  final String campaignName;
  final String notificationTitle;
  final String notificationDescription;
  final TargetAudience targetAudience;
  final List<NotificationChannel> notificationChannels;

  NotificationCampaign({
    required this.campaignId,
    required this.campaignName,
    required this.notificationTitle,
    required this.notificationDescription,
    required this.targetAudience,
    required this.notificationChannels,
  });

  int get _generateCampaingId {
    return campaignId + 1;
  }

  @override
  NotificationCampaign clone() {
    return NotificationCampaign(
      campaignId: _generateCampaingId,
      campaignName: campaignName,
      notificationTitle: notificationTitle,
      notificationDescription: notificationDescription,
      targetAudience: targetAudience,
      notificationChannels: List.of(notificationChannels),
    );
  }

  NotificationCampaign copyWith({
    String? campaignName,
    String? notificationTitle,
    String? notificationDescription,
    TargetAudience? targetAudience,
    List<NotificationChannel>? notificationChannels,
  }) {
    return NotificationCampaign(
      campaignId: campaignId,
      campaignName: campaignName ?? this.campaignName,
      notificationTitle: notificationTitle ?? this.notificationTitle,
      notificationDescription:
          notificationDescription ?? this.notificationDescription,
      targetAudience: targetAudience ?? this.targetAudience,
      notificationChannels: notificationChannels ?? this.notificationChannels,
    );
  }

  @override
  String toString() {
    return '''
    Notification Campaign:
    Campaign ID: $campaignId
    Campaign Name: $campaignName
    Notification Title: $notificationTitle
    Notification Description: $notificationDescription
    Target Audience: $targetAudience
    Notification Channels: $notificationChannels
    ''';
  }
}

enum NotificationChannel { Push, Email, SMS }
