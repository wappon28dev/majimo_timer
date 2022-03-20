part of 'body.dart';

Widget buildHorizontal(BuildContext context) {
  const tag = 'alarm';

  return Container(
    padding: const EdgeInsets.all(20),
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(color: Color.fromRGBO(0, 163, 255, 1)),
    child: Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.alarm, color: Colors.white),
          Text(tag.tr(), style: const TextStyle(color: Colors.white)),
        ],
      ),
    ),
  );
}
