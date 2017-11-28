DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS account_holders;
DROP TABLE IF EXISTS tags;

CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  merchant_name VARCHAR(255)
);

CREATE TABLE tags (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE account_holders (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  funds INT2
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  account_holder_id INT2 REFERENCES account_holders(id),
  merchant_id INT2 REFERENCES merchants(id),
  tag_id INT2 REFERENCES tags(id),
  value INT2
);
