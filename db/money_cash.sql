DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS account_holders;

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  merchant_name VARCHAR(255),
  value INT2,
  tag VARCHAR(255)
);

CREATE TABLE account_holders (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  funds INT2
);
