CREATE DATABASE Exercicio11;

USE Exercicio11;

CREATE TABLE Departamento (
    idDepto INT PRIMARY KEY,
    nomeDepto VARCHAR(45),
    fkGerente INT,
    dataInicioGer DATE
);

ALTER TABLE Departamento
ADD CONSTRAINT fkGerente
FOREIGN KEY (fkGerente) REFERENCES Funcionario(idFunc);

CREATE TABLE Funcionario (
    idFunc INT PRIMARY KEY,
    nomeFunc VARCHAR(30),
    salario DECIMAL(10, 2),
    sexo CHAR(1),
    fkSupervisor INT,
    dataNasc DATE,
    fkDepto INT,
    FOREIGN KEY (fkDepto) REFERENCES Departamento(idDepto)
);

ALTER TABLE Funcionario
ADD CONSTRAINT fkSupervisor
FOREIGN KEY (fkSupervisor) REFERENCES Funcionario(idFunc);

CREATE TABLE Projeto (
    idProj INT PRIMARY KEY,
    nomeProj VARCHAR(50),
    localProj VARCHAR(50),
    fkDepto INT,
    FOREIGN KEY (fkDepto) REFERENCES Departamento(idDepto)
);

CREATE TABLE FuncProj (
    fkFunc INT,
    fkProj INT,
    horas DECIMAL(3, 1),
    PRIMARY KEY (fkFunc, fkProj),
    FOREIGN KEY (fkFunc) REFERENCES Funcionario(idFunc),
    FOREIGN KEY (fkProj) REFERENCES Projeto(idProj)
);

INSERT INTO Departamento (idDepto, nomeDepto, fkGerente, dataInicioGer) VALUES
(105, 'Pesquisa', 2, '2008-05-22'),
(104, 'Administração', 7, '2015-01-01'),
(101, 'Matriz', 8, '2001-06-19');

INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES
(1, 'Joao Silva', 3500, 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500, 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500, 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300, 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800, 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500, 'f', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', 2500, 'm', 4, '1989-03-29', 104),
(8, 'Juliano Brito', 5500, 'm', NULL, '1957-11-10', 101);

INSERT INTO Projeto (idProj, nomeProj, localProj, fkDepto) VALUES
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);

INSERT INTO FuncProj (fkFunc, fkProj, horas) VALUES
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.0),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30, 20.0),
(4, 20, 15.0),
(8, 20, NULL);

SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Projeto;
SELECT * FROM FuncProj;

INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES
(NULL, 'Cecília Ribeiro', 2800, 'f', NULL, '1980-04-05', 104);
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES
(3, 'Alice Sousa', 2800, 'f', 4, '1980-04-05', 104);
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 107);
INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES
(9, 'Cecília Ribeiro', 2800, 'f', 4, '1980-04-05', 104);

DELETE FROM FuncProj WHERE fkFunc = 3 AND fkProj = 10;
DELETE FROM Funcionario WHERE idFunc = 4;
DELETE FROM Funcionario WHERE idFunc = 2;

UPDATE Funcionario SET salario = 2800 WHERE idFunc = 3;
UPDATE Funcionario SET fkDepto = 101 WHERE idFunc = 3;
UPDATE Funcionario SET fkDepto = 107 WHERE idFunc = 3;

SELECT dataNasc, salario FROM Funcionario WHERE nomeFunc = 'Joao Silva';
SELECT salario FROM Funcionario;
SELECT DISTINCT salario FROM Funcionario;
SELECT * FROM Funcionario ORDER BY nomeFunc;
SELECT * FROM Funcionario ORDER BY salario DESC;
SELECT * FROM Funcionario ORDER BY salario DESC;
SELECT * FROM Funcionario WHERE salario BETWEEN 2000 AND 4000;
SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc LIKE 'J%';
SELECT nomeFunc, salario FROM Funcionario WHERE nomeFunc LIKE '%a';
SELECT nomeFunc FROM Funcionario WHERE SUBSTRING(nomeFunc, 3, 1) = 'n';
SELECT nomeFunc, dataNasc FROM Funcionario WHERE SUBSTRING(REVERSE(nomeFunc), 5, 1) = 'S';
SELECT * FROM Funcionario WHERE fkDepto = (SELECT idDepto FROM Departamento WHERE nomeDepto = 'Pesquisa');
SELECT * FROM Funcionario WHERE fkDepto = (SELECT idDepto FROM Departamento WHERE nomeDepto = 'Pesquisa') AND salario > 3500;
SELECT * FROM Funcionario WHERE fkDepto = (SELECT idDepto FROM Departamento WHERE nomeDepto = 'Pesquisa') AND nomeFunc LIKE 'J%';

SELECT f.idFunc AS idFuncionario, f.nomeFunc, s.idFunc AS idSupervisor, s.nomeFunc AS nomeSupervisor
FROM Funcionario f
LEFT JOIN Funcionario s ON f.fkSupervisor = s.idFunc;

SELECT p.idProj, p.fkDepto, f.nomeFunc AS gerenteNome, f.dataNasc AS gerenteDataNasc
FROM Projeto as p
JOIN Departamento as d ON p.fkDepto = d.idDepto
JOIN Funcionario as f ON d.fkGerente = f.idFunc
WHERE p.localProj = 'São Paulo';


SELECT f.idFunc, f.nomeFunc, p.idProj, p.nomeProj, fp.horas
FROM FuncProj as fp
JOIN Funcionario as f ON fp.fkFunc = f.idFunc
JOIN Projeto as p ON fp.fkProj = p.idProj;

SELECT nomeFunc FROM Funcionario WHERE dataNasc < '1980-01-01';
SELECT COUNT(DISTINCT salario) AS quantidadeSalariosDiferentes FROM Funcionario;
SELECT COUNT(DISTINCT localProj) AS quantidadeLocaisDiferentes FROM Projeto;
SELECT AVG(salario) AS salarioMedio, SUM(salario) AS somaSalarios FROM Funcionario;
SELECT MIN(salario) AS menorSalario, MAX(salario) AS maiorSalario FROM Funcionario;

SELECT fkDepto, AVG(salario) AS salarioMedio, SUM(salario) AS somaSalarios
FROM Funcionario
GROUP BY fkDepto;

INSERT INTO Funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) VALUES
(10, 'José da Silva', 1800, 'm', 3, '2000-10-12', NULL),
(11, 'Benedito Almeida', 1200, 'm', 5, '2001-09-01', NULL);
INSERT INTO Departamento (idDepto, nomeDepto, fkGerente, dataInicioGer) VALUES
(110, 'RH', 3, '2018-11-10');
