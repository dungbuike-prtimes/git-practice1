CREATE TABLE users (
    id bigint NOT NULL AUTO_INCREMENT,
    username varchar(50),
    email varchar(50) NOT NULL,
    password varchar(255) NOT NULL,
    phone_number varchar(13),

    PRIMARY KEY (id)
);

CREATE TABLE posts (
  id bigint NOT NULL AUTO_INCREMENT,
  owner bigint NOT NULL,
  title text NOT NULL,
  content text NOT NULL,
  thumbnail bigint,

  PRIMARY KEY (id)
);

CREATE TABLE tags (
  id bigint NOT NULL AUTO_INCREMENT,
  name varchar(30) NOT NULL ,
  description text,

  PRIMARY KEY (id),
);

CREATE TABLE images (
    id bigint NOT NULL AUTO_INCREMENT,
    post_id bigint,
    url text NOT NULL,
    description text,

    PRIMARY KEY (id)
);

CREATE TABLE post_tag (
    id bigint NOT NULL AUTO_INCREMENT,
    post_id bigint NOT NULL,
    tag_id bigint NOT NULL,

    PRIMARY KEY (id)
);

ALTER TABLE posts ADD FOREIGN KEY (thumbnail) REFERENCES images(id) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE images ADD FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE post_tag ADD FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE post_tag ADD FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE ON UPDATE CASCADE;
