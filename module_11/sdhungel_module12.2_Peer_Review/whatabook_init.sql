/*
    Title: whatabook.init.sql
    Sanjiv Dhungel
    12/14/2021
    Description: WhatABook database initialization script.
*/

-- drop test user if exists 
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database 
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost 
GRANT ALL PRIVILEGES ON whatabook.* TO'whatabook_user'@'localhost';

-- drop contstraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
    Create table(s)
*/
CREATE TABLE store (
    store_id    INT             NOT NULL    AUTO_INCREMENT,
    locale      VARCHAR(500)    NOT NULL,
    PRIMARY KEY(store_id)
);

CREATE TABLE book (
    book_id     INT             NOT NULL    AUTO_INCREMENT,
    book_name   VARCHAR(200)    NOT NULL,
    author      VARCHAR(200)    NOT NULL,
    details     VARCHAR(500),
    PRIMARY KEY(book_id)
);

CREATE TABLE user (
    user_id         INT         NOT NULL    AUTO_INCREMENT,
    first_name      VARCHAR(75) NOT NULL,
    last_name       VARCHAR(75) NOT NULL,
    PRIMARY KEY(user_id) 
);

CREATE TABLE wishlist (
    wishlist_id     INT         NOT NULL    AUTO_INCREMENT,
    user_id         INT         NOT NULL,
    book_id         INT         NOT NULL,
    PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
        REFERENCES book(book_id),
    CONSTRAINT fk_user
    FOREIGN KEY (user_id)
        REFERENCES user(user_Id)
);

/*
    insert store record 
*/
INSERT INTO store(locale)
    VALUES('708 N 120th St, Omaha, NE 68154');

/*
    insert book records 
*/
INSERT INTO book(book_name, author)
	VALUES('The Lauch Book', 'Sanyin Siang');
INSERT INTO book(book_name, author)
	VALUES('You Are A Badass Every Day', 'Jen Sincero');
INSERT INTO book(book_name, author, details)
	VALUES('Get It Done', 'AyeletFishbach', 'Surprising Lesons From the Science');
INSERT INTO book(book_name, author, details)
	VALUES('Tiny Habit', 'B.J Fogg', 'The small changes that changes Everything');
INSERT INTO book(book_name, author)
	VALUES('Opportunity Knocks', 'Tim Scott');
INSERT INTO book(book_name, author)
	VALUES('Keep Sharp', 'Sanjay Gupta');
INSERT INTO book(book_name, author)
	VALUES('Live Free', 'DeVon Franklin');
INSERT INTO book(book_name, author)
	VALUES('Happy This Year', 'Will Bowen');
INSERT INTO book(book_name, author)
	VALUES('Willa Cather', 'Willa Cather');

/*
    insert user
*/ 
INSERT INTO user(first_name, last_name)
VALUES('Sanjiv', 'Dhungel');
INSERT INTO user(first_name, last_name)
	VALUES('Gautam', 'Yog');
INSERT INTO user(first_name, last_name)
	VALUES('Bina', 'Dhungel');

/*
    insert wishlist records 
*/
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Sanjiv'), 
        (SELECT book_id FROM book WHERE book_name = 'Tiny Habit')
    );
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Gautam'), 
        (SELECT book_id FROM book WHERE book_name = 'Keep Sharp')
    );
INSERT INTO wishlist(user_id, book_id) 
    VALUES (
        (SELECT user_id FROM user WHERE first_name = 'Bina'), 
        (SELECT book_id FROM book WHERE book_name = 'Happy This Year')
    );

