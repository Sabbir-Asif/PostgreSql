CREATE Table "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(25) NOT NULL
)

CREATE Table post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id)
)

INSERT INTO "user"(username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi')

SELECT * from "user";

INSERT INTO post (title, user_id) VALUES
('akash - Learning PostgreSQL', 1),
('batash - Exploring Joins', 2),
('sagor - Group By Practice', 3),
('nodi - Advanced SQL Queries', 4);


SELECT * FROM post;


SELECT title, username FROM post
 JOIN "user" ON post.user_id = "user".id;