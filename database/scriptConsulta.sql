use FrozenMeat;

-- comandos de seleção:
select 
id as 'ID',
registrado_em as 'Data de registro', 
nome as 'Nome', 
email as 'Email', 
cpf as 'CPF', 
telefone as 'Número de telefone'
from usuario_fisico
order by registrado_em desc;

select
registrado_em as 'Data de registro', 
nome as 'Nome', 
email as 'Email', 
telefone as 'Número de telefone'
from usuario_fisico
where telefone like '11%';
    
select id as 'ID',
registrado_em as 'Data de Registro',
nome as 'Nome',
email as 'Email',
cnpj as 'CNPJ',
telefone as 'Número de telefone'
from usuario_juridico
order by nome;

select 
registrado_em as 'Data de Registro',
nome as 'Nome',
email as 'Email',
cnpj as 'CNPJ',
telefone as 'Número de telefone'
from usuario_juridico
where email like '%gmail%'
order by email;

select 
id as 'ID',
registrado_em as 'Data de registro',
endereco as 'Endereço',
cep as 'CEP',
temperatura_ideal_minima as 'Temperatura ideal mínima',
temperatura_ideal_maxima as 'Temperatura ideal máxima'
from frigorifico
order by cep desc;

select * from historico_frigorifico
order by temperatura;
