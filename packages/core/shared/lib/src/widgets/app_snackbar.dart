import 'dart:async';

import 'package:core_theme/theme.dart';
import 'package:flutter/material.dart';

/// Перерахування для типів снекбарів
/// Використовується для визначення кольору та призначення снекбару
enum TypeSnackBar {
  /// Снекбар з успіхом
  success,

  /// Снекбар з помилкою
  error,

  /// Снекбар з інформацією
  info,
}

/// {@template app_snackbar}
/// Менеджер для управління снекбарами
/// Використовується для показу снекбарів у верхній частині екрана
/// Має статичні методи для показу снекбарів з різними типами
/// [showError] - для показу снекбара з помилкою,
/// [showSuccess] - для показу снекбара з успіхом
/// [showInfo] - для показу снекбара з інформацією
/// {@endtemplate}
class AppSnackBar extends StatefulWidget {
  /// {@macro app_snackbar}
  const AppSnackBar._({
    required this.message,
    required this.type,
    required this.displayDuration,
    this.onDismiss,
  });

  /// Повідомлення, яке буде показано в снекбарі
  final String message;

  /// Тип снекбара, який визначає його колір та призначення
  final TypeSnackBar type;

  /// Тривалість показу снекбара
  final Duration displayDuration;

  /// Функція, яка викликається при закритті снекбара
  final VoidCallback? onDismiss;

  @override
  State<AppSnackBar> createState() => _AppSnackBarState();

  /// Показати снекбар з помилкою
  /// {@template show_snackbar}
  /// [context] - контекст, в якому буде показано снекбар
  /// [message] - повідомлення, яке буде показано в снекбарі
  /// [displayDuration] - тривалість показу снекбара
  /// По замовчуванню 3 секунди
  /// {@endtemplate}
  static void showError(
    BuildContext context, {
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: TypeSnackBar.error,
      displayDuration: displayDuration,
    );
  }

  /// Показати снекбар з інформацією
  /// {@macro show_snackbar}
  static void showInfo(
    BuildContext context, {
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: TypeSnackBar.info,
      displayDuration: displayDuration,
    );
  }

  /// Показать снекбар з успіхом
  /// {@macro show_snackbar}
  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration displayDuration = const Duration(seconds: 3),
  }) {
    _show(
      context: context,
      message: message,
      type: TypeSnackBar.success,
      displayDuration: displayDuration,
    );
  }

  /// Приватний метод для показу снекбара
  /// Використовується статичними методами:
  /// [showError], [showSuccess], [showInfo]
  static void _show({
    required BuildContext context,
    required String message,
    required TypeSnackBar type,
    required Duration displayDuration,
  }) {
    // Вилучаємо попередній снекбар
    _removeCurrentSnackBar();

    if (!context.mounted) return;

    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => AppSnackBar._(
        message: message,
        type: type,
        displayDuration: displayDuration,
        onDismiss: _removeCurrentSnackBar,
      ),
    );

    _currentSnackBar = overlayEntry;
    overlay.insert(overlayEntry);
  }

  /// Попередній снекбар
  static OverlayEntry? _currentSnackBar;

  /// Вилучення попереднього снекбара
  static void _removeCurrentSnackBar() {
    _currentSnackBar?.remove();
    _currentSnackBar = null;
  }
}

/// {@template _app_snack_bar_state}
/// Стан для віджета AppSnackBar
/// {@endtemplate}
class _AppSnackBarState extends State<AppSnackBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  Timer? _dismissTimer;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      _initAnimation();
      _startDismissTimer();
      _isInitialized = true;
    }
  }

  /// Ініціалізація анімації для снекбара
  /// Використовується для визначення початкової та кінцевої позиції снекбара
  /// Початкова позиція - за межами екрана, кінцева - 15 пікселів нижче верхнього відступу
  void _initAnimation() {
    final topPadding = MediaQuery.of(context).padding.top;
    // Початкова позиція снекбара - за межами екрана
    final startPosition = -200.0;
    // Кінцева позиція снекбара - 15 пікселів нижче верхнього відступу
    final endPosition = topPadding + 15;
    // Створення анімації з використанням Tween
    _slideAnimation =
        Tween<double>(begin: startPosition, end: endPosition).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  /// Запуск таймера для автоматичного закриття снекбара
  /// Таймер спрацьовує після закінчення [widget.displayDuration]
  /// і викликає метод [_dismiss] для закриття снекбара
  void _startDismissTimer() {
    _dismissTimer = Timer(widget.displayDuration, _dismiss);
  }

  /// Закриття снекбара
  /// Відміняє таймер, якщо він існує, і запускає зворотну анімацію
  /// Після завершення анімації викликає функцію [widget.onDismiss], якщо вона задана
  /// Якщо віджет не монтується, нічого не робить
  void _dismiss() {
    if (!mounted) return;

    _dismissTimer?.cancel();
    _animationController.reverse().then((_) {
      if (mounted) {
        widget.onDismiss?.call();
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Positioned(
          left: 0,
          right: 0,
          top: _slideAnimation.value,
          child: Material(
            child: GestureDetector(
              onTap: _dismiss,
              behavior: HitTestBehavior.opaque,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 350),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(widget.type),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                child: Row(
                  children: [
                    _Icon(type: widget.type),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        widget.message,
                        style: TextStyle(color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Отримання кольору фону снекбара в залежності від його типу
  /// Повертає [Color] в залежності від типу снекбара
  /// [TypeSnackBar.success] - колір успіху
  /// [TypeSnackBar.error] - колір помилки
  /// [TypeSnackBar.info] - колір інформації
  Color _getBackgroundColor(TypeSnackBar type) {
    return switch (type) {
      TypeSnackBar.success => context.appColors.successSnackbarBackground,
      TypeSnackBar.error => context.appColors.errorSnackbarBackground,
      TypeSnackBar.info => context.appColors.infoSnackbarBackground,
    };
  }
}

/// {@template _icon}
/// Виджет для показу іконки в снекбарі
/// Використовується для показу іконки в залежності від типу снекбара
/// {@endtemplate}
class _Icon extends StatelessWidget {
  /// {@macro _icon}
  /// Створює екземпляр іконки для снекбара
  /// Приймає:
  /// [type] - тип снекбара, який визначає іконку
  const _Icon({required this.type});

  /// Тип снекбара, який визначає іконку
  final TypeSnackBar type;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      TypeSnackBar.success => const Icon(
          Icons.check_circle,
          color: Colors.white,
          size: 32,
        ),
      TypeSnackBar.error => const Icon(
          Icons.error,
          color: Colors.white,
          size: 32,
        ),
      TypeSnackBar.info => const Icon(
          Icons.info,
          color: Colors.white,
          size: 32,
        ),
    };
  }
}
