CREATE TABLE human (
  id            SERIAL            NOT NULL PRIMARY KEY,
  firstname     VARCHAR(64)       NOT NULL,
  lastname      VARCHAR(64)       NOT NULL,
  age           INT               NOT NULL,
  city          VARCHAR(64)       NOT NULL,
  diamonds      INT               NOT NULL
);