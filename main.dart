// CLASSE BASE
class ItemTrabalho {
  int id;
  String titulo;

  ItemTrabalho({required this.id, required this.titulo});

  void exibirResumo() {
    print('Item $id - $titulo');
  }
}

// CLASSE FILHA
class Tarefa extends ItemTrabalho {
  String responsavel;
  String status;
  String prioridade;
  double valor;
  int horas;

  Tarefa({
    required int id,
    required String titulo,
    required this.responsavel,
    required this.status,
    required this.prioridade,
    required this.valor,
    required this.horas,
  }) : super(id: id, titulo: titulo);

  @override
  void exibirResumo() {
    print('ID: $id');
    print('Título: $titulo');
    print('Responsável: $responsavel');
    print('Status: $status');
    print('Prioridade: $prioridade');
    print('Valor: R\$ $valor');
    print('Horas: $horas');
    print(' ');
  }
}

void main() {
  print('TaskReport Dart iniciado!');
}
