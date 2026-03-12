 abstract class WelcomeEvent {}

class WelcomePageChanged extends WelcomeEvent {
  final int page;
  WelcomePageChanged(this.page);
}
