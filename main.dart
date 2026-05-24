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

// CLASSE RELATÓRIO COM ENCAPSULAMENTO
class RelatorioTarefas {
  final List<Tarefa> _tarefas;

  RelatorioTarefas(List<Tarefa> tarefas) : _tarefas = tarefas;

  int get quantidadeTotal => _tarefas.length;

  void gerarRelatorio() {
    int concluidas = _tarefas.where((t) => t.status == 'concluida').length;
    int pendentes = _tarefas.where((t) => t.status == 'pendente').length;
    int emAndamento = _tarefas.where((t) => t.status == 'em andamento').length;
    int canceladas = _tarefas.where((t) => t.status == 'cancelada').length;

    double totalConcluidas = 0.0;
    for (Tarefa t in _tarefas.where((t) => t.status == 'concluida').toList()) {
      totalConcluidas += t.valor;
    }

    int horasConcluidas = 0;
    for (Tarefa t in _tarefas.where((t) => t.status == 'concluida').toList()) {
      horasConcluidas += t.horas;
    }

    print('=============================');
    print('  RELATÓRIO FINAL DE TAREFAS');
    print('=============================');
    print(' ');
    print('Total de tarefas analisadas: $quantidadeTotal');
    print('Tarefas concluídas: $concluidas');
    print('Tarefas pendentes: $pendentes');
    print('Tarefas em andamento: $emAndamento');
    print('Tarefas canceladas: $canceladas');
    print(' ');
    print('Valor total das concluídas: R\$ $totalConcluidas');
    print('Total de horas concluídas: $horasConcluidas');
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
  // FILTRAR POR STATUS
  print('=== TAREFAS CONCLUÍDAS ===');
  print(' ');
  List<Tarefa> concluidas = tarefas
      .where((t) => t.status == 'concluida')
      .toList();
  for (var tarefa in concluidas) {
    print('- ${tarefa.titulo}');
  }
  print(' ');

  print('=== TAREFAS PENDENTES ===');
  print(' ');
  List<Tarefa> pendentes = tarefas
      .where((t) => t.status == 'pendente')
      .toList();
  for (var tarefa in pendentes) {
    print('- ${tarefa.titulo}');
  }
  print(' ');

  print('=== TAREFAS EM ANDAMENTO ===');
  print(' ');
  List<Tarefa> emAndamento = tarefas
      .where((t) => t.status == 'em andamento')
      .toList();
  for (var tarefa in emAndamento) {
    print('- ${tarefa.titulo}');
  }
  print(' ');

  print('=== TAREFAS CANCELADAS ===');
  print(' ');
  List<Tarefa> canceladas = tarefas
      .where((t) => t.status == 'cancelada')
      .toList();
  for (var tarefa in canceladas) {
    print('- ${tarefa.titulo}');
  }
  print(' ');

  // SOMAR VALORES DAS CONCLUÍDAS
  double totalConcluidas = 0.0;
  for (var tarefa in concluidas) {
    totalConcluidas = totalConcluidas + tarefa.valor;
  }
  print('=== VALOR TOTAL DAS CONCLUÍDAS ===');
  print('R\$ $totalConcluidas');
  print(' ');

  // MÉDIA DE VALOR DAS PENDENTES
  print('=== MÉDIA DE VALOR DAS PENDENTES ===');
  if (pendentes.isEmpty) {
    print('Não existem tarefas pendentes para calcular média.');
  } else {
    double somaPendentes = 0.0;
    for (var tarefa in pendentes) {
      somaPendentes = somaPendentes + tarefa.valor;
    }
    double mediaPendentes = somaPendentes / pendentes.length;
    print('R\$ $mediaPendentes');
  }
  print(' ');

  // TOTAL DE HORAS POR STATUS
  Map<String, int> horasPorStatus = {};
  for (Tarefa tarefa in tarefas) {
    if (horasPorStatus.containsKey(tarefa.status)) {
      horasPorStatus[tarefa.status] =
          horasPorStatus[tarefa.status]! + tarefa.horas;
    } else {
      horasPorStatus[tarefa.status] = tarefa.horas;
    }
  }
  print('=== TOTAL DE HORAS POR STATUS ===');
  print(' ');
  for (String status in horasPorStatus.keys) {
    print('$status: ${horasPorStatus[status]} horas');
  }
  print(' ');

  // TAREFAS COM DADOS INCOMPLETOS
  print('=== TAREFAS COM DADOS INCOMPLETOS ===');
  print(' ');
  for (Map<String, dynamic> item in dadosTarefas) {
    List<String> problemas = [];
    if (item['titulo'] == null) problemas.add('título ausente');
    if (item['responsavel'] == null) problemas.add('responsável ausente');
    if (item['horas'] == null) problemas.add('horas ausentes');
    if (problemas.isNotEmpty) {
      print('- ID ${item['id']}: ${problemas.join(', ')}');
    }
  }
  print(' ');

  // STATUS ÚNICOS COM SET
  Set<String> statusUnicos = {};
  for (Tarefa tarefa in tarefas) {
    statusUnicos.add(tarefa.status);
  }
  print('=== STATUS ENCONTRADOS ===');
  print(' ');
  for (String status in statusUnicos) {
    print(status);
  }
  print(' ');

  // RELATÓRIO FINAL
  RelatorioTarefas relatorio = RelatorioTarefas(tarefas);
  relatorio.gerarRelatorio();
}
