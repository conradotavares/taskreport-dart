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

// BASE DE DADOS SIMULADA
final List<Map<String, dynamic>> dadosTarefas = [
  {
    'id': 1,
    'titulo': ' Corrigir bug login ',
    'responsavel': 'Ana',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 120,00',
    'horas': '2',
  },
  {
    'id': 2,
    'titulo': 'Criar tela de perfil',
    'responsavel': ' Bruno ',
    'status': 'em andamento',
    'prioridade': 'media',
    'valor': 'R\$ 250,50',
    'horas': '5',
  },
  {
    'id': 3,
    'titulo': null,
    'responsavel': 'Carla',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 'R\$ 80,00',
    'horas': null,
  },
  {
    'id': 4,
    'titulo': ' Ajustar navegação ',
    'responsavel': null,
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 150,75',
    'horas': '3',
  },
  {
    'id': 5,
    'titulo': 'Revisar regras de negócio',
    'responsavel': 'Daniel',
    'status': 'cancelada',
    'prioridade': 'media',
    'valor': 'R\$ 0,00',
    'horas': '0',
  },
  {
    'id': 6,
    'titulo': 'Implementar validação de dados',
    'responsavel': 'Eduarda',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 200,00',
    'horas': '4',
  },
  {
    'id': 7,
    'titulo': 'Organizar documentação',
    'responsavel': 'Felipe',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 'R\$ 90,00',
    'horas': '2',
  },
];

// CONVERSÕES
double converterValor(dynamic valor) {
  if (valor == null) return 0.0;
  String texto = valor.toString();
  texto = texto.replaceAll('R\$', '');
  texto = texto.replaceAll(' ', '');
  texto = texto.replaceAll(',', '.');
  return double.parse(texto);
}

int converterHoras(dynamic horas) {
  if (horas == null) return 0;
  if (horas == '') return 0;
  return int.parse(horas.toString());
}

// CONVERTER MAPA EM OBJETO
Tarefa converterMapParaTarefa(Map<String, dynamic> item) {
  return Tarefa(
    id: item['id'],
    titulo: (item['titulo'] ?? 'Sem título').toString().trim(),
    responsavel: (item['responsavel'] ?? 'Não informado').toString().trim(),
    status: (item['status'] ?? 'sem status').toString().trim(),
    prioridade: (item['prioridade'] ?? 'sem prioridade').toString().trim(),
    valor: converterValor(item['valor']),
    horas: converterHoras(item['horas']),
  );
}

void main() {
  print('TaskReport Dart iniciado!');
  print(' ');

  // CONVERTER MAPAS EM OBJETOS
  List<Tarefa> tarefas = dadosTarefas
      .map((item) => converterMapParaTarefa(item))
      .toList();

  // EXIBIR TODAS AS TAREFAS
  print('=== TODAS AS TAREFAS ===');
  print(' ');
  for (var tarefa in tarefas) {
    tarefa.exibirResumo();
  }
}
