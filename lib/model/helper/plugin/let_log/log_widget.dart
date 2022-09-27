part of 'let_log.dart';

class LogWidget extends StatefulWidget {
  const LogWidget({super.key});

  @override
  _LogWidgetState createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
  bool _showSearch = false;
  String _keyword = '';
  TextEditingController? _textController;
  ScrollController? _scrollController;
  FocusNode? _focusNode;
  bool _goDown = true;

  @override
  void initState() {
    _textController = TextEditingController(text: _keyword);
    _scrollController = ScrollController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textController!.dispose();
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTools(),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: _Log.length,
              builder: (context, value, child) {
                var logs = _Log.list;
                if (_selectTypes.length < 4 || _keyword.isNotEmpty) {
                  logs = _Log.list.where((test) {
                    return _selectTypes.contains(test.type) &&
                        test.contains(_keyword);
                  }).toList();
                }

                final len = logs.length;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = Logger.config.reverse
                        ? logs[index]
                        : logs[len - index - 1];
                    final color = _getColor(item.type, context);
                    return _buildItem(item, color);
                  },
                  itemCount: len,
                  controller: _scrollController,
                  separatorBuilder: (context, index) {
                    return nil;
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'global',
        onPressed: () {
          if (_goDown) {
            _scrollController!.animateTo(
              _scrollController!.position.maxScrollExtent * 2,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else {
            _scrollController!.animateTo(
              0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
          _goDown = !_goDown;
          setState(() {});
        },
        child: Icon(
          _goDown ? Icons.arrow_downward : Icons.arrow_upward,
        ),
      ),
    );
  }

  Widget _buildItem(_Log item, Color? color) {
    return InkWell(
      onTap: () {
        final data = ClipboardData(text: item.toString());
        Clipboard.setData(data);
        showDialog<void>(
          context: context,
          builder: (context) {
            return const Center(
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'copy success!',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "[${item.start!.hour.toString().padLeft(2, "0")}:${item.start!.minute.toString().padLeft(2, "0")}:${item.start!.second.toString().padLeft(2, "0")}] ${item.typeName} \n${item.message}",
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontFamily: Platform.isAndroid ? 'monospace' : 'Menlo',
              ),
            ),
            if (item.detail != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  item.detail!,
                  style: TextStyle(fontSize: 14, color: color),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 20,
                ),
              )
          ],
        ),
      ),
    );
  }

  Color? _getColor(_Type? type, BuildContext context) {
    switch (type) {
      case _Type.info:
        return Colors.white;
      case _Type.event:
        return Colors.yellow;
      case _Type.save:
        return const Color(0xFFF57F17);
      case _Type.restore:
        return Colors.greenAccent;
      default:
        return Theme.of(context).textTheme.bodyText1!.color;
    }
  }

  final List<_Type> _selectTypes = [
    _Type.info,
    _Type.event,
    _Type.save,
    _Type.restore,
  ];

  Widget _buildTools() {
    final arr = <ChoiceChip>[];
    for (final f in _Type.values) {
      arr.add(
        ChoiceChip(
          label: Text(
            _getTabName(f.index),
            style: const TextStyle(fontSize: 12, color: Colors.black),
          ),
          selectedColor: const Color(0xFFCBE2F6),
          selected: _selectTypes.contains(f),
          onSelected: (value) {
            _selectTypes.contains(f)
                ? _selectTypes.remove(f)
                : _selectTypes.add(f);
            setState(() {});
          },
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
      child: AnimatedCrossFade(
        crossFadeState:
            _showSearch ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
        firstChild: Row(
          children: [
            Expanded(
              child: Wrap(
                spacing: 5,
                children: arr,
              ),
            ),
            IconButton(
              icon: _keyword.isEmpty
                  ? const Icon(Icons.search)
                  : const Icon(Icons.filter_1),
              onPressed: () {
                _showSearch = true;
                setState(() {});
                _focusNode!.requestFocus();
              },
            ),
          ],
        ),
        secondChild: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 36,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(6),
                  ),
                  controller: _textController,
                  focusNode: _focusNode,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _showSearch = false;
                _keyword = _textController!.text;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
