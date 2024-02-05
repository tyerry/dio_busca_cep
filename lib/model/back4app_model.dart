class Back4AppModel {
  List<Results> results = [];

  Back4AppModel(this.results);

  Back4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results.map((v) => v.toJsonEndpoint()).toList();
    return data;
  }
}

class Results {
  String? objectId;
  String? logradouro;
  String? localidade;
  String? uf;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId,
      this.logradouro,
      this.localidade,
      this.uf,
      this.createdAt,
      this.updatedAt});

  Results.criar(this.logradouro, this.localidade, this.uf);

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    logradouro = json['logradouro'];
    localidade = json['localidade'];
    uf = json['uf'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = objectId;
    data['logradouro'] = logradouro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logradouro'] = logradouro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    return data;
  }
}
