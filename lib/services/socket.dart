// import 'package:socket_io_client/socket_io_client.dart' as io;

// class SocketService {
//   static SocketService? _instance;

//   SocketService._();

//   static SocketService get instance => _instance ??= SocketService._();
//   io.Socket? _socket;
//   bool isSendFirst = true;
//   var count = 0;
//   Future<void> init() async {
//     _socket = io.io(
//         'SOCKET_URL',
//         io.OptionBuilder()
//             .enableReconnection()
//             .setTransports(['websocket']).build());
//     _socket!.on('connect_error', (data) {});

//     _socket!.onConnect((_) async {});
//     _socket!.onDisconnect((_) {
//       isSendFirst = true;
//     });

//     _socket!.on('forceLogout', (data) async {});

//     _socket!.on('event', (data) {
//       switch (data['event']) {
//         default:
//       }
//     });
//   }

//   Future<void> message(data) async {
//     _socket!.emit('event', data);
//   }

//   Future<void> reconnect() async {
//     _socket!
//       ..disconnect()
//       ..connect();
//   }

//   void handleLiveStreamEvent(String eventName, dynamic data) {
//     switch (eventName) {
//       default:
//     }
//   }
// }

// final SocketService socket = SocketService.instance;
