import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dio_busca_cep.dart';

void main() async {
  await dotenv.load();
  runApp(const DioBuscaCep());
}
