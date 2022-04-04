part of 'body.dart';

Widget buildVertical(BuildContext context, WidgetRef ref) {
  final timerstate = ref.read(timerState);
  Widget content() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Center(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              elevation: 4,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(
                  children: [
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
              ),
            )
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
