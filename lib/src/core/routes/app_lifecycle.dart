import 'package:flutter/material.dart';
import 'package:grapcoin/src/pin/routes/passcode_page.dart';

class AppLifecyclePage extends StatefulWidget {
  const AppLifecyclePage({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  State<AppLifecyclePage> createState() => _AppLifecyclePageState();
}

class _AppLifecyclePageState extends State<AppLifecyclePage> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    // Initialize the AppLifecycleListener class and pass callbacks
    _listener = AppLifecycleListener(
      onStateChange: _onStateChanged,
    );
  }

  @override
  void dispose() {
    // Do not forget to dispose the listener
    _listener.dispose();

    super.dispose();
  }

  // Listen to the app lifecycle state changes
  void _onStateChanged(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        _onDetached();
      case AppLifecycleState.resumed:
        _onResumed();
      case AppLifecycleState.inactive:
        _onInactive();
      case AppLifecycleState.hidden:
        _onHidden();
      case AppLifecycleState.paused:
        _onPaused();
    }
  }

  void _onDetached() => print('detached');

  void _onResumed() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const PasscodePage(inApp: true),
      ),
    );
  }

  void _onInactive() => print('inactive');

  void _onHidden() => print('hidden');

  void _onPaused() => print('paused');

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
