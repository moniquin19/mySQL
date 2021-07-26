create database amigos;
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



