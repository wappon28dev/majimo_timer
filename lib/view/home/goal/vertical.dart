part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final focusNode = FocusNode();

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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusColor: ColorKey.green.value,
                    fillColor: ColorKey.green.value,
                    prefixIcon: const Icon(Icons.flag),
                    labelText: t.input_goal.t,
                  ),
                  style: const TextStyle(color: Colors.black),
                  onChanged: (value) =>
                      ref.read(goalState.notifier).updateGoal(value: value),
                  autofocus: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      t.until_end.t,
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
    // onTap: () => FocusScope.of(context).unfocus(),
    child: content(),
  );
}
