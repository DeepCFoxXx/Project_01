DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS merchants;
DROP TABLE IF EXISTS account_holders;


CREATE TABLE merchants (
  id SERIAL8 PRIMARY KEY,
  merchant_name VARCHAR(255),
  value INT2,
  tag VARCHAR(255),
  transaction_id INT2 REFERENCES transaction(id)
);

CREATE TABLE account_holders (
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  funds INT2,
  transaction_id INT2 REFERENCES transaction(id)
);

CREATE TABLE transactions (
  id SERIAL8 PRIMARY KEY,
  account_holder_id INT2 REFERENCES account_holders(id),
  merchant_id INT2 REFERENCES merchant(id)
);
