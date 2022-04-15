part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  Widget content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Center(
        child: Column(
          children: [
            roundedCard(
              context: context,
              ref: ref,
              body: <Widget>[
                TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusColor: ColorKey.green.value,
                    fillColor: ColorKey.green.value,
                    prefixIcon: const Icon(Icons.flag),
                    labelText: '目標を入力しよう！',
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) =>
                      ref.read(goalState.notifier).updateGoal(value: value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'が終わるまで',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: ColorKey.green.value,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: content(),
  );
}
