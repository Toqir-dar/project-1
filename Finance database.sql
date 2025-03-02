CREATE DATABASE financedb;
USE financedb;

CREATE TABLE USERS (
    user_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL
);


CREATE TABLE ACCOUNTS (
    account_id VARCHAR(20) PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL,
    name VARCHAR(100) NOT NULL,
    type ENUM('Savings', 'Checking', 'Business', 'Other') NOT NULL,
    balance DECIMAL(15,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);

CREATE TABLE BUDGET (
    budget_id VARCHAR(20) PRIMARY KEY,
    account_id VARCHAR(20) NOT NULL,
    user_id VARCHAR(20) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    date_budget DATE NOT NULL,
    FOREIGN KEY (account_id) REFERENCES ACCOUNTS(account_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE
);


CREATE TABLE TRANSACTIONS (
    tran_id VARCHAR(20) PRIMARY KEY,
    account_id VARCHAR(20) NOT NULL,
    transaction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    transaction_type ENUM('Income', 'Expense') NOT NULL,
    payment_method ENUM('Cash', 'Card', 'Bank Transfer', 'Other') NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (account_id) REFERENCES ACCOUNTS(account_id) ON DELETE CASCADE
);

