/* Script de inserção */

use FrozenMeat;

insert into usuario_fisico (nome, email, cpf, telefone, senha, cargo) values 
  ('David Silva', 'davidsilva@gmail.com', '50754563758', '82978653454', 'inovacaoprojetos', 'Funcionário'),
  ('Henrique Pereira', 'henriquepereira@hotmail.com', '40730568745', '11985835674', 'projectinovation3', 'Gerente'),
  ('Viviana Silveira', 'Vivianasilveira@gmail.com', '12365434589', '27912341234', 'banquinhosedadinhos', 'Funcionário'),
  ('Marcela Gonçalves', 'goncalvesmar@hotmail.com', '32123454334', '21968543485', 'programacao$poramor$', 'Funcionário'),
  ('Vitoria Milena', 'vitoriamilenar2@hotmail.com', '67865476576', '51923458545', 'iamaprogrammer12', 'Gerente');

insert into usuario_juridico (nome, email, cnpj, telefone, senha, cargo) values
  ('Carnes Congeladas', 'carnesgeladascontact@hotmail.com', '45675467865434', '119878865434', 'bistecasfrias4311', 'Gerente'),
  ('Pasture to Plate', 'contactuspastureplate@gmail.com', '23854295724509', '61345439854', '0pastureandplate0', 'Gerente'),
  ('Coração Vaqueiro', 'falecomvaqueiros@hotmail.com', '08546925759357', '47987584576', 'vaqueiroscomemcarne123', 'Gerente'),
  ('Anna Costelas', 'chama.a.anna@gmail.com', '92458649265935', '79456783469', 'boiadeiranna123', 'Gerente'),
  ('Tourinhos Gordos', 'tourosgordosonline@hotmail.com', '94614545862354', '11946248532', 't0ur0sf0rtesepesados', 'Gerente');

insert into frigorifico (endereco, cep) values
  ("Alameda Lorena, 1884 - Jardim Paulista, São Paulo - SP, 01424-006", "01424-006"),
  ("R. Oscar Freire, 470 - Cerqueira César, São Paulo - SP, 01426-000", "01426-000"),
  ("R. Pamplona, 1253 - Jardim Paulista, São Paulo - SP, 01405-200", "01405-200"),
  ("Alameda Ribeirão Preto, 580 - Bela Vista, São Paulo - SP, 01331-000", "01331-000"),
  ("Av. Brigadeiro Luís Antônio, 2013 - Bela Vista, São Paulo - SP, 01317-001", "01317-001");

insert into usuario_fisico_frigorifico (id_usuario, id_frigorifico) values
  (1, 1),
  (1, 2),
  (2, 1),
  (3, 3),
  (4, 4),
  (4, 5),
  (5, 5);

insert into usuario_juridico_frigorifico (id_usuario, id_frigorifico) values
  (1, 1),
  (1, 2),
  (2, 1),
  (3, 3),
  (4, 4),
  (4, 5),
  (5, 5);

insert into historico_frigorifico (id_frigorifico, temperatura) values
  (1, 0),
  (2, 3),
  (3, 2.5),
  (4, 1.7),
  (5, 5);
