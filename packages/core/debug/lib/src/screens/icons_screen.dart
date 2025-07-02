import 'package:core_shared/shared.dart';
import 'package:flutter/material.dart';

/// {@template icons_screen}
/// Екран для відображення всіх доступних іконок додатку.
///
/// Відповідає за:
/// - Відображення списку всіх іконок SVG з assets/icons/
/// - Надання можливості перегляду іконок для розробників
/// - Демонстрація використання системи генерації ресурсів
/// {@endtemplate}
class IconsScreen extends StatelessWidget {
  /// {@macro icons_screen}
  const IconsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final iconList = Assets.icons.values
        .map((icon) => _ItemIcon(icon: icon.svg(), name: icon.path))
        .toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Іконки')),
      body: Center(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return iconList[index];
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: iconList.length,
        ),
      ),
    );
  }
}

/// {@template item_icon}
/// Віджет для відображення окремої іконки в списку.
///
/// Відображає SVG іконку разом з її назвою файлу
/// для зручності ідентифікації в процесі розробки.
/// {@endtemplate}
class _ItemIcon extends StatelessWidget {
  /// {@macro item_icon}
  const _ItemIcon({required this.icon, required this.name});

  /// SVG іконка для відображення
  final Widget icon;

  /// Назва файлу іконки для ідентифікації
  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 16),
        Text(name),
      ],
    );
  }
}
