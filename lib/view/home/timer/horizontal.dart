part of 'body.dart';

Widget buildHorizontal(BuildContext context) {
  const tag = 'timer';

  return Container(
    padding: const EdgeInsets.all(20),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(color: ColorKey.red.value.withOpacity(0.5)),
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
