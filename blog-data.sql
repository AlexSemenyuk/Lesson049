use blog;
insert into user(username, password, first_name, last_name, email, is_active, is_expired, created, updated)
values
('AliCh', '5ghp8Dv2', 'Али', 'Хамит', 'ali_chamit@gmail.com', 1, 1, current_timestamp, current_timestamp),
('OlgaCh', '7ghf3Dp2', 'Ольга', 'Чунихина', 'olga_ch@gmail.com', 1, 2, current_timestamp, current_timestamp),
('AnnaPh', '9gdp8Rc3', 'Анна', 'Фетисова', 'anna_ph@gmail.com', 1, 1, current_timestamp, current_timestamp),
('VladSh', '8ujh7Sq2', 'Владимир', 'Шевченко', 'vlad_sh@gmail.com', 1, 2, current_timestamp, current_timestamp),
('MaxSh', '2nhj4Lk3', 'Максим', 'Шаповалов', 'max_sh@gmail.com', 1, 1, current_timestamp, current_timestamp),
('DimaKoch', '3asx2Fd8', 'Дмитрий', 'Кочетов', 'dima_koch@gmail.com', 1, 2, current_timestamp, current_timestamp),
('OlegSh', '4kge7Yr1', 'Олег', 'Штанько', 'oleg_sh@gmail.com', 1, 1, current_timestamp, current_timestamp),
('InnaSh', '8ksa1Ui2', 'Инна', 'Шматько', 'inna_sh@gmail.com', 1, 2, current_timestamp, current_timestamp),
('YanaSh', '9iuy5Ea2', 'Яна', 'Щербина', 'yana_sch@gmail.com', 1, 1, current_timestamp, current_timestamp),
('VasyaV', '5ijb5Qw8', 'Василий', 'Власенко', 'vasya_v@gmail.com', 1, 2, current_timestamp, current_timestamp),
('Administrator', 'Adm5lms8H4', 'Анна', 'Елизарова', 'anna_yelis@gmail.com', 1, 1, current_timestamp, current_timestamp);

insert into author (user_id, created, updated)
values (1, current_timestamp, current_timestamp),
       (2, current_timestamp, current_timestamp),
       (3, current_timestamp, current_timestamp),
       (4, current_timestamp, current_timestamp),
       (5, current_timestamp, current_timestamp),
       (6, current_timestamp, current_timestamp),
       (7, current_timestamp, current_timestamp),
       (8, current_timestamp, current_timestamp),
       (9, current_timestamp, current_timestamp),
       (10, current_timestamp, current_timestamp);

UPDATE author
SET avatar = '.images/avatar1.jpg'
WHERE user_id = 1;
UPDATE author
SET avatar = '.images/avatar6.jpg'
WHERE user_id = 6;
UPDATE author
SET avatar = '.images/avatar9.jpg'
WHERE user_id = 9;

insert into category (name)
values ('Ресторан.'), ('Личный блог. Публичная личность.'), ('Фитнес-тренер'),
       ('Товар/услуга.'),  ('Модель.'), ('Модельер.'),
       ('Сайт о доме и саде.'), ('Юморист.'), ('Сделай сам'),
       ('Моя дача');


insert into tag (name)
values ('#ресторан'), ('#блюдо'), ('#сервис'),
       ('#темадня'), ('#мнение'), ('#событие'),
       ('#упражнение'), ('#мышцы'), ('#правильноеположение'),
       ('#кросовки'), ('#спортивнаяодежда'), ('#днепр'),
       ('#фото'), ('#шоу'), ('#город'),
       ('#модель'), ('#выставка'), ('#мода'),
       ('#удобрение'), ('#отделка'), ('#инструмент'),
       ('#анекдот'), ('#шуткадня'), ('#веселыеистории'),
       ('#материал'), ('#стоимость'), ('#количестворук');

insert into blog (owner_id, name, description, created, updated)
values (1, 'Чумацкий Шлях', 'Все о ресторане', current_timestamp, current_timestamp),
       (2, 'Ольга Чунихина', 'Что, как и почему', current_timestamp, current_timestamp),
       (3, 'Как привести себя в форму', 'Все о фитнес-упражнениях', current_timestamp, current_timestamp),
       (4, 'Спортландия', 'Все для спорта', current_timestamp, current_timestamp),
       (5, 'Максим Шаповалов', 'Обо мне', current_timestamp, current_timestamp),
       (6, 'Дмитрий Кочетов', 'Мода и только', current_timestamp, current_timestamp),
       (7, 'Мой дом - моя крепость', 'Уют в доме и вокруг его', current_timestamp, current_timestamp),
       (8, 'Шутка дня', 'Все виды веселых историй', current_timestamp, current_timestamp),
       (9, 'Сделай сам', 'Все для дома и дачи своими руками', current_timestamp, current_timestamp),
       (10, 'Моя дача и не только', 'Все о даче и для дачи', current_timestamp, current_timestamp);


insert into post (title, content, created, updated, draft, category_id, blog_id)
values ('Салат оливье', 'Все об оливье', current_timestamp, current_timestamp, 1, 1, 1),
       ('Все о законе №555', 'На повестке', current_timestamp, current_timestamp, 1, 2, 2),
       ('Упражнения для пресса', 'Сколько, как и почему.', current_timestamp, current_timestamp, 1, 3, 3),
       ('Кроссовки Asics GT-2000 10 GTX', 'Скидка дня', current_timestamp, current_timestamp, 1, 4, 4),
       ('Moda in Kiev 2020', 'Мои фото', current_timestamp, current_timestamp, 1, 5, 5),
       ('Moda in Kiev 2020', 'Все про всех и про все', current_timestamp, current_timestamp, 1, 6, 6),
       ('Самшит вечнозелёный', 'Плотное, вечнозеленое растение с формированием стрижки.', current_timestamp, current_timestamp, 1, 7, 7),
       ('Анекдот про Красную шапочку', '- Красная Шапочка! — воскликнул Серый Волк. - Серая шубка! — воскликнула девочка.', current_timestamp, current_timestamp, 1, 8, 8),
       ('Как быстро и качественно поклеить обои', 'Все, что вы не знали про поклейку обоев.', current_timestamp, current_timestamp, 1, 9, 9),
       ('Самый лучший стол для дачи', 'Как сделать очень удобный стол для дачи', current_timestamp, current_timestamp, 1, 10, 10),
       ('Ветровка 4F HJL20-JKUM002', 'Скидка дня.', current_timestamp, current_timestamp, 1, 4, 4),
       ('Штаны спортивные Nike M NSW CLUB JGGR BB', 'Скидка дня.', current_timestamp, current_timestamp, 1, 4, 4);


insert into post_tag (post_id, tag_id)
values (1, 3), (1, 2),
       (2, 4), (2, 5), (2, 6),
       (3, 7), (3, 8), (3, 9),
       (4, 10), (4, 12),
       (5, 13), (5, 14), (5, 15), (5, 17), (5, 18),
       (6, 13), (6, 14), (6, 15), (6, 16), (6, 17), (6, 18),
       (7, 19), (7, 26),
       (8, 22), (8, 23), (8, 24),
       (9, 20), (9, 25), (9, 26), (9, 27),
       (10, 21), (10, 25), (10, 26), (10, 27),
       (11, 11), (11, 12),
       (12, 11), (12, 12);

insert into role (name)
values ('Пользователь'), ('Блогер'), ('Администратор');

insert into user_role (user_id, role_id)
values (1, 1), (1, 2),
       (2, 1), (2, 2),
       (3, 1), (3, 2),
       (4, 1), (4, 2),
       (5, 1), (5, 2),
       (6, 1), (6, 2),
       (7, 1), (7, 2),
       (8, 1), (8, 2),
       (9, 1), (9, 2),
       (10, 1), (10, 2),
       (11, 1), (11, 2), (11, 3);

insert into comment (text, created, post_id, updated, user_id)
values ('Очень интересно. Спасибо', current_timestamp, 1, current_timestamp, 5),
       ('Это нам не надо', current_timestamp, 2, current_timestamp, 8),
       ('Очень нужный закон', current_timestamp, 2, current_timestamp, 10),
       ('ОК, клево!!!', current_timestamp, 5, current_timestamp, 2),
       ('ОК, класс!!!', current_timestamp, 6, current_timestamp, 2),
       ('Не фонтан', current_timestamp, 8, current_timestamp, 11),
       ('Очень интересно. Спасибо', current_timestamp, 9, current_timestamp, 8),
       ('Классная идея. Спасибо', current_timestamp, 10, current_timestamp, 3),
       ('Надо попробовать посадить. Спасибо', current_timestamp, 7, current_timestamp, 2);
