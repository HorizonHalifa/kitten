import 'package:audioplayers/audioplayers.dart';

/// The ViewModel that holds logic for kitten behaviour. Separates state and logic for the UI.
class KittenViewModel {
  bool isPurring = false;
  final AudioPlayer _audioPlayer = AudioPlayer();

  /// Toggles purring state and triggers play or stop.
  void togglePurring() {
    isPurring = !isPurring;

    if (isPurring) {
      _startPurring();
    } else {
      _stopPurring();
    }
  }

  /// Starts the audio loop for purring. Marked as async because playing audio is an asynchronous operation.
  void _startPurring() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop); // Loop the sound
    await _audioPlayer.play(
      AssetSource('audio/purr.mp3'), // Load and play from assets
    );
  }

  /// Stops the purring audio.
  void _stopPurring() async {
    await _audioPlayer.stop();
  }

  /// Cleans up the audio player when the widget is removed.
  /// Dart has a garbage collector, but this helps release native audio resources early.
  void dispose() {
    _audioPlayer.dispose();
  }
}
