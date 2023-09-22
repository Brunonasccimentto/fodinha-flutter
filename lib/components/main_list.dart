import 'package:flutter/material.dart';
import 'package:fodinha_flutter/model/player.dart';

class MainList extends StatelessWidget {
  final List<PlayerModel> data;

  const MainList({required this.data, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: data.isEmpty
          ? const Text("Nenhum jogador")
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final player = data[index];
                return Container(
                  margin: EdgeInsets.only(
                      bottom: data.length - 1 == index ? 70 : 0),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.black12, width: 1))),
                  child: Flexible(
                    child: ListTile(
                      title: Text(
                        player.name,
                        
                      ),
                      // subtitle: Text(
                      //     '${produto.quantidade} ${produto.unidade} = R\$${(produto.quantidade * produto.preco).toStringAsFixed(2)}'),
                      // onTap: () {
                      //   Navigator.pushNamed(context, '/editar item',
                      //       arguments: produto);
                      // },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
