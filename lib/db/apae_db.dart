import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart'; // Para 'join'

class ApaeDatabase {
  static final ApaeDatabase instance = ApaeDatabase._init();

  static Database? _database;

  ApaeDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('apae.db');
    return _database!;
  }

  // Método privado para inicializar o banco de dados
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print('Caminho do banco de dados SQLite no dispositivo: $path');
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const uniqueTextType = 'TEXT NOT NULL UNIQUE';
    const timestampType = 'TEXT DEFAULT CURRENT_TIMESTAMP';
    await db.execute('''
CREATE TABLE users (
  id $idType,
  nome $textType,
  email $uniqueTextType,
  senha $textType, -- ATENÇÃO: Em produção, armazene HASHES de senhas, não texto puro!
  createdAt $timestampType
)
''');

    // Você pode adicionar mais comandos db.execute() aqui para criar outras tabelas, se necessário.
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  // ----- MÉTODOS CRUD (Create, Read, Update, Delete) para Usuários -----
  Future<int> createUser(Map<String, dynamic> user) async {
    final db = await instance.database;
    return await db.insert('users', user);
  }
}
