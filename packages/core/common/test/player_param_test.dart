import 'package:flutter_test/flutter_test.dart';
import 'package:core_common/common.dart';

void main() {
  group('PlayerParam', () {
    test('should create initial PlayerParam with default values', () {
      const playerParam = PlayerParam.initial();

      expect(playerParam.currentHeight, 0.0);
      expect(playerParam.minHeight, 0.0);
      expect(playerParam.maxHeight, 0.0);
      expect(playerParam.isAnimating, false);
      expect(playerParam.isExpanded, false);
      expect(playerParam.isFullScreen, false);
      expect(playerParam.isMinimal, false);
      expect(playerParam.isDragging, false);
      expect(playerParam.dragStartY, 0.0);
      expect(playerParam.dragVelocity, 0.0);
    });

    test('should copy PlayerParam with new values', () {
      const initial = PlayerParam.initial();
      final updated = initial.copyWith(
        currentHeight: 200.0,
        isDragging: true,
        dragStartY: 100.0,
        isExpanded: true,
      );

      expect(updated.currentHeight, 200.0);
      expect(updated.isDragging, true);
      expect(updated.dragStartY, 100.0);
      expect(updated.isExpanded, true);
      // Other values should remain unchanged
      expect(updated.minHeight, 0.0);
      expect(updated.maxHeight, 0.0);
      expect(updated.isAnimating, false);
    });

    test('should determine current window state correctly', () {
      final minimal = const PlayerParam.initial().copyWith(isMinimal: true);
      final expanded = const PlayerParam.initial().copyWith(isExpanded: true);
      final fullscreen = const PlayerParam.initial().copyWith(isFullScreen: true);

      expect(minimal.currentWindowState, PlayerWindowState.minimal);
      expect(expanded.currentWindowState, PlayerWindowState.expanded);
      expect(fullscreen.currentWindowState, PlayerWindowState.fullscreen);
    });

    test('should determine state by height correctly', () {
      const minHeight = 120.0;
      const maxHeight = 240.0;

      expect(
        PlayerParam.determineStateByHeight(100.0, minHeight, maxHeight),
        PlayerWindowState.minimal,
      );
      expect(
        PlayerParam.determineStateByHeight(200.0, minHeight, maxHeight),
        PlayerWindowState.expanded,
      );
      expect(
        PlayerParam.determineStateByHeight(400.0, minHeight, maxHeight),
        PlayerWindowState.fullscreen,
      );
    });

    test('should get correct height for state', () {
      const minHeight = 120.0;
      const maxHeight = 240.0;

      expect(
        PlayerParam.getHeightForState(PlayerWindowState.minimal, minHeight, maxHeight),
        minHeight,
      );
      expect(
        PlayerParam.getHeightForState(PlayerWindowState.expanded, minHeight, maxHeight),
        maxHeight,
      );
      expect(
        PlayerParam.getHeightForState(PlayerWindowState.fullscreen, minHeight, maxHeight),
        double.infinity,
      );
    });

    test('should update state by height correctly', () {
      final playerParam = const PlayerParam.initial().copyWith(
        currentHeight: 200.0,
        minHeight: 120.0,
        maxHeight: 240.0,
      );

      final updated = playerParam.updateStateByHeight();

      expect(updated.isExpanded, true);
      expect(updated.isMinimal, false);
      expect(updated.isFullScreen, false);
    });
  });
}
