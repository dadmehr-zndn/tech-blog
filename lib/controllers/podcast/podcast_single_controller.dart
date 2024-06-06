import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tech_blog/constants/api_constants.dart';
import 'package:tech_blog/models/models.dart';
import 'package:tech_blog/models/podcast_files_model.dart';
import 'package:tech_blog/services/dio_service.dart';

class PodcastSingleController extends GetxController {
  var id;
  late var playlist;
  final player = AudioPlayer();

  PodcastSingleController({this.id});

  Rx<PodcastModel> podcastSingleModel = PodcastModel().obs;
  RxList<PodcastFilesModel> podcastFilesList = RxList.empty();
  RxBool isLoading = false.obs;
  RxBool isPlaying = false.obs;
  RxInt currentFileIndex = 0.obs;

  getPodcastFiles() async {
    isLoading.value = true;

    var response =
        await DioService().getMethod('${ApiConstants.getPodcastFiles}$id');

    if (response.statusCode == 200) {
      podcastFilesList.clear();
      response.data['files'].forEach((element) async {
        podcastFilesList.add(PodcastFilesModel.fromJson(element));
        await playlist.add(AudioSource.uri(
            Uri.parse(PodcastFilesModel.fromJson(element).file!)));
      });

      isLoading.value = false;

      log('getPodcastFiles: ${response.data}');
      print('podcastFilesLength: ${podcastFilesList.length}');
    }
  }

  Rx<Duration> progressValue = const Duration(seconds: 0).obs;
  Rx<Duration> bufferedValue = const Duration(seconds: 0).obs;
  Timer? timer;
  startProgressing() {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds - player.position.inSeconds;

    if (timer != null && timer!.isActive) {
      timer!.cancel();
      timer = null;
    }

    timer = Timer.periodic(tick, (timer) {
      duration--;
      progressValue.value = player.position;
      bufferedValue.value = player.bufferedPosition;

      if (duration <= 0) timer.cancel();
    });
  }

  RxBool isRepeat = false.obs;
  toggleRepeatMode() {
    if (isRepeat.value) {
      isRepeat.value = !isRepeat.value;
      player.setLoopMode(LoopMode.off);
    } else {
      isRepeat.value = !isRepeat.value;
      player.setLoopMode(LoopMode.all);
    }
  }

  @override
  void onInit() async {
    super.onInit();

    playlist = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: [],
    );

    getPodcastFiles();
    await player.setAudioSource(
      playlist,
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
  }

  @override
  void onClose() {
    player.dispose();

    super.onClose();
  }
}
