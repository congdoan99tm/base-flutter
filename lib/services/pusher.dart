// import '../utils/extensions/obj_ext.dart';
// import '../utils/logger.dart';

// class PusherService {
//   static PusherService? _instance;

//   PusherService._();

//   static PusherService get instance => _instance ??= PusherService._();

//   final PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

//   int _id = -1;

//   Future<void> init(int? id) async {
//     if (id == null) return;
//     if (_id < 0) {
//       _id = id;
//     }
//     try {
//       await pusher.init(
//         apiKey: Strings.kPusherKey,
//         cluster: Strings.kPusherCluster,
//         onConnectionStateChange: onConnectionStateChange,
//         onError: onError,
//         onSubscriptionSucceeded: onSubscriptionSucceeded,
//         onEvent: onEvent,
//         onSubscriptionError: onSubscriptionError,
//         onDecryptionFailure: onDecryptionFailure,
//         onMemberAdded: onMemberAdded,
//         onMemberRemoved: onMemberRemoved,
//         // authEndpoint: "<Your Auth endpoint>",
//         // onAuthorizer: onAuthorizer
//       );
//       await pusher.subscribe(channelName: 'my-channel');
//       await pusher.connect();
//     } catch (e) {
//       e.logE('init pusher');
//     }
//   }

//   void onConnectionStateChange(dynamic currentState, dynamic previousState) {
//     devLog('Connection: $currentState');
//   }

//   void onError(String message, int? code, dynamic e) {
//     devLog('onError: $message code: $code exception: $e');
//   }

//   void onEvent(PusherEvent event) {
//     switch (event.eventName) {
//       case 'my-event,':
//         break;
//       default:
//     }
//     // devLog('onEvent: $event');
//   }

//   void onSubscriptionSucceeded(String channelName, dynamic data) {
//     devLog('onSubscriptionSucceeded: $channelName data: $data');
//     final me = pusher.getChannel(channelName)?.me;
//     devLog('Me: $me');
//   }

//   void onSubscriptionError(String message, dynamic e) {
//     devLog('onSubscriptionError: $message Exception: $e');
//   }

//   void onDecryptionFailure(String event, String reason) {
//     devLog('onDecryptionFailure: $event reason: $reason');
//   }

//   void onMemberAdded(String channelName, PusherMember member) {
//     devLog('onMemberAdded: $channelName user: $member');
//   }

//   void onMemberRemoved(String channelName, PusherMember member) {
//     devLog('onMemberRemoved: $channelName user: $member');
//   }

//   void onSubscriptionCount(String channelName, int subscriptionCount) {
//     devLog(
//         'onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount');
//   }
// }

// final PusherService pusherService = PusherService.instance;
