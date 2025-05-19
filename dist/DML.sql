INSERT INTO users (first_name, last_name, email, password, birth_date, phone) VALUES
('João', 'Silva', 'joao@email.com', 'senha123', '1990-01-01', '11999999999'),
('Maria', 'Oliveira', 'maria@email.com', 'senha456', '1992-05-10', '11988888888'),
('goku', 'ssj', 'goku@email.com', '456', '1992-05-10', '11948868880');

INSERT INTO atracoes (nome, tempo_espera, status, area) VALUES
('Montanha Mágica', 35, 'Muito Movimentado', 'ÁREA 1'),
('Carrossel Encantado', 15, 'Normal', 'ÁREA 1'),
('Roda Gigante Celestial', 32, 'Normal', 'ÁREA 2'),
('Trem Fantasma', 20, 'Muito Movimentado', 'ÁREA 2'),
('Splash Radical', 45, 'Normal', 'ÁREA 3'),
('Torre do Terror', 50, 'Muito Movimentado', 'ÁREA 3');


INSERT INTO hopi_hari_db.users_has_atracoes (users_id, atracoes_id) VALUES
(2,7),
(3,7),
(2,8),
(3,8),
(2,9),
(3,9);

select atracoes.nome,
users.first_name,
`users_has_atracoes`.users_id,`users_has_atracoes`.atracoes_id
from users_has_atracoes
inner join atracoes
on atracoes.id = `users_has_atracoes`.atracoes_id
inner join users
on users.id = `users_has_atracoes`.users_id
