/*
 Задание
 */
use blog;

-- Триггер для негативного сценария (не должно быть тэга с наименованием '#плохо')
delimiter $
create trigger tag_bad
    before insert on tag
    for each row
begin
    if NEW.name = '#плохо' then
        signal SQLSTATE '45000'
            set message_text = 'Tag mustnot be bad';
    end if;
end $;
delimiter ;


-- drop trigger tag_bad;

-- 1. Реализовать вставку нового поста вместе с тэгами в единой транзакции (дз с БД blog).

-- 1.1 Положительный сценарий
set autocommit = 0;
begin work;
insert into tag (name) values ('#цветок');
insert into post (title, content, created, updated, draft, category_id, blog_id)
    values ('Розы', 'Все о розах', current_timestamp, current_timestamp, 1, 7, 7);
insert into post_tag (post_id, tag_id)
    values ((select id from post where title = 'Розы'), 19),
        ((select id from post where title = 'Розы'), (select id from tag where name = '#цветок'));
commit;
-- rollback;

/*
delete from post_tag where post_id = 76;
delete from post where title = 'Розы';
delete from tag where name = '#цветок';
*/

-- 1.2 Отрицательный сценарий
set autocommit = 0;
begin work;
insert into tag (name) values ('#плохо');
insert into post (title, content, created, updated, draft, category_id, blog_id)
values ('Закон №678 Повышение налогов', 'Все о законе №678', current_timestamp, current_timestamp, 1, 2, 2);
insert into post_tag (post_id, tag_id)
values ((select id from post where title = 'Закон №678 Повышение налогов'), 19),
       ((select id from post where title = 'Закон №678 Повышение налогов'), (select id from tag where name = '#плохо'));
-- commit;
rollback;


-- 2. Дополнительное задание: создать procedure create_post(),
--   в которой реализовать вставку поста с тегами и автоматический откат транзакции,
--   в случае возникновения ошибок (сигнала)

delimiter $
create procedure create_post(in post_title varchar (255),
                             in post_content text,
                             in post_created TIMESTAMP,
                             in post_updated TIMESTAMP,
                             in post_draft TINYINT(1),
                             in post_category_id int,
                             in post_blog_id int,
                             in tag_name varchar (255))
begin
    declare exit handler for sqlexception
        begin
            rollback;
            resignal;
        end;
    start transaction;
    insert into post (title, content, created, updated, draft, category_id, blog_id)
        values (post_title, post_content, post_created, post_updated, post_draft, post_category_id, post_blog_id);
    insert into tag (name) values (tag_name);
    insert into post_tag (post_id, tag_id) values ((select id from post where title = post_title), (select id from tag where name = tag_name));
    commit;
end $
delimiter ;
-- 2.1 Положительный сценарий
call create_post('Ромашка', 'Все о ромашках', current_timestamp,
    current_timestamp, 1, 7, 7, '#цветы' );
-- 2.1 Отрицательный сценарий
call create_post('Закон №678 Повышение налогов', 'Все о законе №678 ', current_timestamp,
                 current_timestamp, 1, 2, 2, '#плохо' );

/*
drop procedure create_post;
delete from post_tag where post_id = 69;
delete from post where title = 'Ромашка';
delete from tag where name = '#цветы';
delete from tag where name = '#плохо';
*/

