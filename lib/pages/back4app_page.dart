import 'package:dio_busca_cep/custom/custom_sized_box.dart';
import 'package:dio_busca_cep/model/back4app_model.dart';
import 'package:dio_busca_cep/repositories/back4app_repository.dart';
import 'package:flutter/material.dart';

class Back4AppPage extends StatefulWidget {
  const Back4AppPage({super.key});

  @override
  State<Back4AppPage> createState() => _Back4AppPageState();
}

class _Back4AppPageState extends State<Back4AppPage> {
  late Back4AppRepository back4appRepository;
  Back4AppModel back4appModel = Back4AppModel([]);
  var carregando = false;

  @override
  void initState() {
    back4appRepository = Back4AppRepository();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    setState(() {
      carregando = true;
    });
    back4appModel = await back4appRepository.obterCeps();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Back4App")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomSizedBox(
                  widthPercentage: 0.6,
                  heightPercentage: 0.05,
                  textColor: Colors.white,
                  textWeight: FontWeight.w100,
                  text:
                      "CEPs adicionados à API do Back4App:\n(arraste para deletar)"),
              !carregando
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: back4appModel.results.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var results = back4appModel.results[index];
                        return Dismissible(
                          onDismissed:
                              (DismissDirection dismissDirection) async {
                            await back4appRepository
                                .removerCep(results.objectId!);
                            carregarDados();
                          },
                          key: Key(results.logradouro!),
                          child: ListTile(
                            title: Text(
                                "${results.logradouro},${results.localidade},${results.uf}"),
                          ),
                        );
                      },
                    )
                  : const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
