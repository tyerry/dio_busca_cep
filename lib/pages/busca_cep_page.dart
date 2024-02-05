import 'package:dio_busca_cep/model/back4app_model.dart';
import 'package:dio_busca_cep/pages/back4app_page.dart';
import 'package:dio_busca_cep/repositories/back4app_repository.dart';
import 'package:dio_busca_cep/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';
import '../model/via_cep_model.dart';
import 'package:dio_busca_cep/custom/custom_sized_box.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();
  Back4AppRepository back4appRepository = Back4AppRepository();
  var back4appModel = Back4AppModel([]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              const CustomSizedBox(
                widthPercentage: 0.6,
                heightPercentage: 0.2,
                textColor: Colors.white,
                textWeight: FontWeight.bold,
                text: "DIO Busca CEP",
              ),
              const Spacer(
                flex: 1,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200.0),
                  child: TextField(
                    controller: cepController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(hintText: 'Digite o CEP'),
                    maxLength: 8,
                    textAlign: TextAlign.center,
                    onChanged: (String value) async {
                      var cep = value.trim().replaceAll(RegExp(r"[^0-9]"), "");
                      if (cep.length == 8) {
                        setState(() {
                          loading = true;
                        });
                        viaCepModel = await viaCepRepository.consultarCep(cep);
                      } else if (cep.isEmpty) {
                        setState(() {
                          loading = true;
                        });
                        viaCepModel = ViaCepModel();
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                  ),
                ),
              ),
              const Spacer(
                flex: 1,
              ),
              CustomSizedBox(
                  widthPercentage: 0.3,
                  heightPercentage: 0.03,
                  textColor: Colors.white,
                  textWeight: FontWeight.bold,
                  text: viaCepModel.logradouro ?? ""),
              CustomSizedBox(
                  widthPercentage: 0.2,
                  heightPercentage: 0.03,
                  textColor: Colors.white,
                  textWeight: FontWeight.bold,
                  text:
                      "${viaCepModel.localidade ?? ""} ${viaCepModel.uf ?? ""}"),
              Visibility(
                  visible: loading, child: const CircularProgressIndicator()),
              const Spacer(
                flex: 1,
              ),
              TextButton(
                onPressed: () async {
                  if (viaCepModel.logradouro != null &&
                      viaCepModel.localidade != null &&
                      viaCepModel.uf != null &&
                      viaCepModel.logradouro!.isNotEmpty &&
                      viaCepModel.localidade!.isNotEmpty &&
                      viaCepModel.uf!.isNotEmpty) {
                    await back4appRepository.adicionarCep(Results.criar(
                        viaCepModel.logradouro,
                        viaCepModel.localidade,
                        viaCepModel.uf));
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Back4AppPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 124, 108),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text("Adicionar em Back4App"),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }
}
