import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  _TodoListPageState();
  final TextEditingController _textEditingController = TextEditingController();
  List<String> tarefas = [];
  int _selectedIndex = -1; // -1 significa que nenhum item está selecionado
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Container(
              color: Colors.white,
              height: 300,
              child: Container(
                child: SizedBox(
                  height: 400,
                  child: ListView.separated(
                      controller: _scrollController,
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: tarefas.length,
                      itemBuilder: (
                        contexto,
                        index,
                      ) {
                        return Container(
                          color: _selectedIndex == index ? Colors.blue : null,
                          child: ListTile(
                            title: Text(
                              tarefas[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _selectedIndex =
                                    index; // Atualiza o índice selecionado
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                tarefas.removeAt(index);
                              });
                            },
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                setState(() {
                                  tarefas.removeAt(index);
                                });
                              },
                            ),
                          ),
                        );
                      }),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        shape: const CircleBorder(),
        onPressed: () {
          if (_textEditingController.text.isNotEmpty) {
            setState(() {
              tarefas.add(_textEditingController.text);
            });
            _textEditingController.clear();
          }
          print(tarefas);
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
