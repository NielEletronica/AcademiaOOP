import Foundation

// MARK: - Tipos de valor (Enums)

enum NivelExperiencia: String {
    case iniciante = "Noob"
    case intermediario = "Pro"
    case avancado = "Hacker"
}

enum CategoriaAula: String {
    case musculacao = "Musculação"
    case spinning = "Spinning"
    case yoga = "Yoga"
    case funcional = "Funcional"
    case luta = "Luta"
}

struct Plano {
    let nome: String
    let valorMensalidade: Double
    let incluiPersonal: Bool
    let limiteAulasColetivas: Int
    let duracaoMeses: Int
}


struct CatalogoPlanos {
    static let mensal = Plano(
        nome: "Alpha",
        valorMensalidade: 120.0,
        incluiPersonal: false,
        limiteAulasColetivas: 8,
        duracaoMeses: 1
    )

    static let trimestral = Plano(
        nome: "Gamma",
        valorMensalidade: 100.0,
        incluiPersonal: false,
        limiteAulasColetivas: 20,
        duracaoMeses: 3
    )

    static let anual = Plano(
        nome: "Omega",
        valorMensalidade: 80.0,
        incluiPersonal: true,
        limiteAulasColetivas: 60,
        duracaoMeses: 12
    )

    static let todos: [Plano] = [mensal, trimestral, anual]
}


class Pessoa {
    var nome: String
    var email: String
    var funcaoDescritiva: String

    init(nome: String, email: String, funcaoDescritiva: String) {
        self.nome = nome
        self.email = email
        self.funcaoDescritiva = funcaoDescritiva
    }
}

class Aluno: Pessoa {
    let matricula: String
    private(set) var plano: Plano
    private(set) var nivel: NivelExperiencia

    init(nome: String, email: String, matricula: String, plano: Plano, nivel: NivelExperiencia) {
        self.matricula = matricula
        self.plano = plano
        self.nivel = nivel
        super.init(nome: nome, email: email, funcaoDescritiva: "Aluno")
    }

    func atualizarPlano(_ novoPlano: Plano) {
        self.plano = novoPlano
    }

    func atualizarNivel(_ novoNivel: NivelExperiencia) {
        self.nivel = novoNivel
    }
}


class Instrutor: Pessoa {
    var especialidade: CategoriaAula

    init(nome: String, email: String, especialidade: CategoriaAula) {
        self.especialidade = especialidade
        super.init(nome: nome, email: email, funcaoDescritiva: "Instrutor")
    }
}

print("=== Catálogo de Planos ===")
for plano in CatalogoPlanos.todos {
    print("\(plano.nome) - R$ \(plano.valorMensalidade)/mês")
}

print("\n=== Criando Aluno ===")
let aluno = Aluno(
    nome: "Carlos",
    email: "carlos@gmail.com",
    matricula: "A123",
    plano: CatalogoPlanos.mensal,
    nivel: .iniciante
)

print("Aluno: \(aluno.nome), Plano: \(aluno.plano.nome), Nível: \(aluno.nivel.rawValue)")

print("\n=== Atualizando dados do aluno ===")
aluno.atualizarPlano(CatalogoPlanos.anual)
aluno.atualizarNivel(.intermediario)

print("Aluno: \(aluno.nome), Plano: \(aluno.plano.nome), Nível: \(aluno.nivel.rawValue)")

print("\n=== Criando Instrutor ===")
let instrutor = Instrutor(
    nome: "Ana",
    email: "ana@lyceum.com",
    especialidade: .yoga
)

print("Instrutor: \(instrutor.nome), Especialidade: \(instrutor.especialidade.rawValue)")