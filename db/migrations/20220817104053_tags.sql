-- migrate:up
CREATE TABLE tags (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(10) NOT NULL
);

-- migrate:down
DROP TABLE tags;