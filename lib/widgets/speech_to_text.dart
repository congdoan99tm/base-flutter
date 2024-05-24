// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../core/export.dart';
// import '../utils/helpers/export.dart';

// class SpeechSearchScreen extends StatefulWidget {
//   const SpeechSearchScreen({required this.editingController, super.key});
//   final TextEditingController editingController;
//   @override
//   State<SpeechSearchScreen> createState() => _SpeechSearchScreenState();
// }

// class _SpeechSearchScreenState extends State<SpeechSearchScreen> {
//   final SpeechToText _speechToText = SpeechToText();
//   bool _speechEnabled = false;

//   @override
//   void initState() {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _initSpeech();
//     });
//     super.initState();
//   }

//   Future<void> _initSpeech() async {
//     final statusSpeech = await Permission.speech.request();
//     final statusMicro = await Permission.microphone.request();

//     if (statusSpeech.isGranted && statusMicro.isGranted) {
//       if (!context.mounted) return;
//       // ignore: use_build_context_synchronously
//       // context.read<SearchCubit>().changeIsListening(false);
//       _speechEnabled = await _speechToText.initialize(onStatus: statusListener);
//       if (_speechEnabled) {
//         _startListening();
//       }
//       setState(() {});
//     } else {
//       ShowManager.showActionAlertDialog(
//         actionTxt: 'Cài đặt',
//         content: 'Để tiếp tục sử dụng tính năng vui lòng bật micrô',
//         title: 'Thông báo',
//         onPressed: () async {
//           await openAppSettings();
//         },
//       );
//     }
//   }

//   Future<void> _startListening() async {
//     widget.editingController.clear();
//     await _speechToText.listen(
//       // cancelOnError: true,
//       listenOptions: SpeechListenOptions(cancelOnError: true),
//       onResult: _onSpeechResult,
//       pauseFor: const Duration(seconds: 2),
//       listenFor: const Duration(seconds: 10),
//       onSoundLevelChange: soundLevelListener,
//       localeId: 'vi_VN',
//     );
//     if (!mounted) return;
//     // context.read<SearchCubit>().changeIsListening(true);
//   }

//   Future<void> _stopListening() async {
//     context.read<SearchCubit>().changeIsListening(false);
//     await _speechToText.stop();
//   }

//   void _onSpeechResult(SpeechRecognitionResult result) {
//     context.read<SearchCubit>().search(result.recognizedWords);
//     if (result.finalResult) {
//       pop();
//     }
//   }

//   void statusListener(String status) {
//     if (status == 'done') {
//       context.read<SearchCubit>().changeIsListening(false);
//     }
//   }

//   @override
//   void dispose() {
//     context.read<SearchCubit>().changeIsListening(false);
//     _speechToText.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: SystemUiOverlayStyle.dark,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Stack(
//             alignment: Alignment.topCenter,
//             children: [
//               Positioned(
//                   top: 0,
//                   right: 0,
//                   child: InkWell(
//                       onTap: pop,
//                       child: Padding(
//                         padding: const EdgeInsets.all(26),
//                         child: SizedBox(
//                           height: 20.h,
//                           width: 20.w,
//                           child: const Icon(Icons.close),
//                         ),
//                       ))),
//               Positioned.fill(
//                 child: Container(
//                     margin: const EdgeInsets.only(top: 100),
//                     padding: const EdgeInsets.symmetric(horizontal: 26),
//                     child: TextField(
//                       enabled: false,
//                       maxLines: null,
//                       controller: widget.editingController,
//                       textInputAction: TextInputAction.search,
//                       decoration: const InputDecoration(
//                           hintText: 'Bạn cần tìm gì?',
//                           hintMaxLines: 2,
//                           border: InputBorder.none,
//                           focusedBorder: InputBorder.none),
//                     )),
//               ),
//               Positioned.fill(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       BlocBuilder<SearchCubit, SearchState>(
//                         buildWhen: (p, c) =>
//                             p.isListening != c.isListening ||
//                             p.voiceLevel != c.voiceLevel,
//                         builder: (context, state) {
//                           final isListening = state.isListening;
//                           final level =
//                               state.voiceLevel * (Platform.isIOS ? 5 : 20);
//                           return Stack(
//                             alignment: Alignment.center,
//                             children: [
//                               isListening
//                                   ? const SizedBox()
//                                   : TweenAnimationBuilder(
//                                       tween: Tween<double>(
//                                           begin: 0,
//                                           end: Platform.isIOS
//                                               ? level + 50
//                                               : level),
//                                       duration:
//                                           const Duration(milliseconds: 80),
//                                       onEnd: () => context
//                                           .read<SearchCubit>()
//                                           .changeVoiceLevel(0),
//                                       curve: Curves.easeOutExpo,
//                                       builder: (BuildContext context,
//                                           Object? value, Widget? child) {
//                                         return CircleAvatar(
//                                           backgroundColor:
//                                               Colors.blue.withOpacity(.1),
//                                           radius:
//                                               double.parse(value.toString()),
//                                         );
//                                       },
//                                     ),
//                               InkWell(
//                                   onTap: () {
//                                     if (isListening) {
//                                       _stopListening();
//                                     } else {
//                                       _startListening();
//                                     }
//                                   },
//                                   child: AnimatedContainer(
//                                     duration: const Duration(milliseconds: 100),
//                                     child: CircleAvatar(
//                                       radius: 45,
//                                       backgroundColor: isListening
//                                           ? Colors.red
//                                           : Colors.blue,
//                                       child: SizedBox(
//                                         height: 50.h,
//                                         width: 50.w,
//                                         child: Assets.svgs.icons.mic.svg(
//                                             fit: BoxFit.cover,
//                                             // ignore: deprecated_member_use_from_same_package
//                                             color: Colors.white),
//                                       ),
//                                       // child: SvgPicture.asset(SVGs.mic,
//                                       //     height: 50,
//                                       //     width: 50,
//                                       //     color: AppColors.white),
//                                     ),
//                                   )),
//                               Opacity(
//                                 opacity: isListening ? 0 : 1,
//                                 child: const Padding(
//                                   padding: EdgeInsets.only(top: 150.0),
//                                   child: Text(
//                                     'Hãy nhấn vào micro để thử lại',
//                                   ),
//                                 ),
//                               )
//                             ],
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void soundLevelListener(double level) {
//     if (Platform.isIOS) {
//       final double lv = level + 45 <= 0 ? 0 : (level + 45);
//       if (lv >= 15) {
//         context.read<SearchCubit>().changeVoiceLevel(lv);
//       } else {
//         context.read<SearchCubit>().changeVoiceLevel(0);
//       }
//     } else {
//       final double lv = level < 0 ? 0 : level;
//       context.read<SearchCubit>().changeVoiceLevel(lv);
//     }
//   }
// }
