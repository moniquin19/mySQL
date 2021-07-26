create database amigos;
use amigos;

use amigos;

-- escribe una consulta SQL que devuelva una lista de usuarios junto con los nombres de sus amigos.
SELECT users.first_name, users.last_name, u2.first_name, u2.last_name FROM users 
LEFT JOIN friendships fs ON users.id = fs.user_id
JOIN users AS u2 ON u2.id = fs.friend_id
;

-- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
select users.first_name from users 
join friendships fs on users.id = fs.user_id
where fs.friend_id = 5;

-- Devuelve el recuento de todas las amistades.
Select *  from friendships;

Select users.first_name, users.last_name, count(friend.friend_id) as num_amigos
from users
left join friendships friend on friend.user_id=users.id group by users.id;

-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.

Select users.first_name, users.last_name, count(friend.friend_id) as num_amigos,
max(num_amigos)
from users
left join friendships friend on friend.user_id=users.id group by users.id;

-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
INSERT INTO `amigos`.`users`
(`id`,
`first_name`,
`last_name`,
`created_at`,
`updated_at`)
VALUES
("Jose",
"Rodriguez",
current_timestamp()
);


INSERT INTO `amigos`.`friendships`
(`user_id`,
`friend_id`,
`created_at`)
VALUES
(6, 2, current_timestamp() ),
(6, 4, current_timestamp()),
(6, 5, current_timestamp());

-- Devuelve a los amigos de Eli en orden alfabético.
SELECT u.first_name, u.last_name FROM users u
JOIN friendships f on u.id = f.friend_id
where f.user_id = 2 order by u.first_name ;

-- Eliminar a Marky Mark de los amigos de Eli.
DELETE FROM `amigos`.`users`
WHERE id = 5;

-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
SELECT u.first_name, u.last_name, u2.first_name, u2.last_name FROM users u
join friendships f ON u.id = f.user_id
join users u2 ON u2.id = f.friend_id;





