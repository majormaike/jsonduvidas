// To parse this JSON data, do
//
//     final albums = albumsFromJson(jsonString);

import 'dart:convert';

List<Albums> albumsFromJson(String str) => List<Albums>.from(json.decode(str).map((x) => Albums.fromJson(x)));

String albumsToJson(List<Albums> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Albums {
    String nomeUrna;
    String cargo;
    String partido;
    String cnpj;
    String situacao;
    String foto;
    String nomeCompleto;
    String registro;
    String nascimento;
    String eleicoes;
    List<BensDeclarado> bensDeclarado;
    int totalDeclarado;
    List<Doadore> doadores;
    int totalDoador;
    List<Despesa> despesas;
    int totalDespesa;

    Albums({
        this.nomeUrna,
        this.cargo,
        this.partido,
        this.cnpj,
        this.situacao,
        this.foto,
        this.nomeCompleto,
        this.registro,
        this.nascimento,
        this.eleicoes,
        this.bensDeclarado,
        this.totalDeclarado,
        this.doadores,
        this.totalDoador,
        this.despesas,
        this.totalDespesa,
    });

    factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        nomeUrna: json["nome_urna"],
        cargo: json["cargo"],
        partido: json["partido"],
        cnpj: json["cnpj"],
        situacao: json["situacao"],
        foto: json["foto"],
        nomeCompleto: json["nome_completo"],
        registro: json["registro"],
        nascimento: json["nascimento"],
        eleicoes: json["eleicoes"],
        bensDeclarado: List<BensDeclarado>.from(json["bens_declarado"].map((x) => BensDeclarado.fromJson(x))),
        totalDeclarado: json["total_declarado"],
        doadores: List<Doadore>.from(json["doadores"].map((x) => Doadore.fromJson(x))),
        totalDoador: json["total_doador"],
        despesas: List<Despesa>.from(json["despesas"].map((x) => Despesa.fromJson(x))),
        totalDespesa: json["total_despesa"],
    );

    Map<String, dynamic> toJson() => {
        "nome_urna": nomeUrna,
        "cargo": cargo,
        "partido": partido,
        "cnpj": cnpj,
        "situacao": situacao,
        "foto": foto,
        "nome_completo": nomeCompleto,
        "registro": registro,
        "nascimento": nascimento,
        "eleicoes": eleicoes,
        "bens_declarado": List<dynamic>.from(bensDeclarado.map((x) => x.toJson())),
        "total_declarado": totalDeclarado,
        "doadores": List<dynamic>.from(doadores.map((x) => x.toJson())),
        "total_doador": totalDoador,
        "despesas": List<dynamic>.from(despesas.map((x) => x.toJson())),
        "total_despesa": totalDespesa,
    };
}

class BensDeclarado {
    String tipo;
    String descricao;
    int valor;

    BensDeclarado({
        this.tipo,
        this.descricao,
        this.valor,
    });

    factory BensDeclarado.fromJson(Map<String, dynamic> json) => BensDeclarado(
        tipo: json["tipo"],
        descricao: json["descricao"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "descricao": descricao,
        "valor": valor,
    };
}

class Despesa {
    String nomeDespesa;
    String cpfDespesa;
    int valorDespesa;

    Despesa({
        this.nomeDespesa,
        this.cpfDespesa,
        this.valorDespesa,
    });

    factory Despesa.fromJson(Map<String, dynamic> json) => Despesa(
        nomeDespesa: json["nome_despesa"],
        cpfDespesa: json["cpf_despesa"],
        valorDespesa: json["valor_despesa"],
    );

    Map<String, dynamic> toJson() => {
        "nome_despesa": nomeDespesa,
        "cpf_despesa": cpfDespesa,
        "valor_despesa": valorDespesa,
    };
}

class Doadore {
    String nomeDoador;
    String cpfDoador;
    int valorDoador;

    Doadore({
        this.nomeDoador,
        this.cpfDoador,
        this.valorDoador,
    });

    factory Doadore.fromJson(Map<String, dynamic> json) => Doadore(
        nomeDoador: json["nome_doador"],
        cpfDoador: json["cpf_doador"],
        valorDoador: json["valor_doador"],
    );

    Map<String, dynamic> toJson() => {
        "nome_doador": nomeDoador,
        "cpf_doador": cpfDoador,
        "valor_doador": valorDoador,
    };
}
