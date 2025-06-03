import 'package:flutter/material.dart';
import 'package:kitten/viewmodel/kitten_viewmodel.dart';

/// A view that displays a kitten which purrs when tapped.
/// This is the UI layer in an MVVM structure.
class KittenScreen extends StatefulWidget {
  const KittenScreen({super.key});

  @override
  State<KittenScreen> createState() => _KittenScreenState();
}

class _KittenScreenState extends State<KittenScreen> {
  late final KittenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = KittenViewModel(); // Create ViewModel
  }

  /// Toggle purring and update UI state.
  void _handleTap() {
    setState(() {
      viewModel.togglePurring(); // Flips the purring state
    });
  }

  @override
  void dispose() {
    viewModel.dispose(); // Clean up audio player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height; // Gets the height of the screen for dynamic sizing

    return Scaffold(
      body: GestureDetector(
        onTap: _handleTap,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Image.asset(
              viewModel.isPurring
                  ? 'assets/images/kitten_closed.png'
                  : 'assets/images/kitten_open.png',
              key: ValueKey(
                viewModel.isPurring,
              ), // Required for animation switch
              width: screenHeight * 0.6,
              height: screenHeight * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
