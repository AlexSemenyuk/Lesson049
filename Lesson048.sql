/*
 Задание
 PS: при выполнении задания использовать join вместо Декартового произведения -- Заметки учтены
 */
use blog;
-- 1. Вивести username всех пользователей и их роли (таблиця Role)
-- Через Декартово произведение
select username, name
from user u, user_role ur, role r
where u.id = ur.user_id
  and r.id = ur.role_id;

-- Через join
select username, name
from user u
   inner join  user_role ur on u.id = ur.user_id
   inner join role r on ur.role_id = r.id;

-- 2. Вивести все посты, на которые отсутствуют комментарии
select * from post p
where not exists(select 1 from comment c where c.post_id = p.id);

-- 3. Вивести категории и количество постов
-- Через Декартово произведение
select name, count (category_id)
from category c, post p
where p.category_id = c.id
group by c.name;

-- Через join
select name, count (category_id)
from category c
left join post p on p.category_id = c.id
group by c.name;

-- 4. Вивести среднее количество тэгов для одного поста
select count(pt.tag_id) / (select count(p.id) from post p)
from post_tag pt;

-- 5. Найти блог з наибольшим количеством постов
select b.name, count(p.title)
from blog b
join post p on p.blog_id = b.id
group by b.name
order by count(p.title) desc
limit 1;

-- 6. Найти пользователя, который опубликовал наибольшее количество комментариев
select u.username, u.first_name, u.last_name, count(c.text)
from user u
join comment c on c.user_id = u.id
group by u.username
order by count(c.text) desc
limit 1;

-- 7. Найти 10 самых популярных тегов
select t.name, count(pt.tag_id)
from tag t
join post_tag pt on pt.tag_id = t.id
group by t.name
order by count(pt.tag_id) desc
limit 10;