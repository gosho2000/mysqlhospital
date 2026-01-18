

CREATE SCHEMA IF NOT EXISTS hospital;

USE hospital;


CREATE TABLE IF NOT EXISTS roles (
	id INT AUTO_INCREMENT PRIMARY KEY,
	role VARCHAR(50) NOT NULL,
	display_name VARCHAR(50) NOT NULL DEFAULT "Role"
);

CREATE TABLE IF NOT EXISTS users (
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	full_name VARCHAR(100) NOT NULL,
	role_id INT NOT NULL DEFAULT 1,

	-- CONSTRAINT fk_roles_users
		FOREIGN KEY (role_id)
		REFERENCES roles (id)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS diagnostic_categories (
	id INT AUTO_INCREMENT PRIMARY KEY,	
	code VARCHAR(50) NOT NULL,
	name VARCHAR(255) NOT NULL DEFAULT "Неуточнена категория диагнози",
	is_top BOOLEAN NOT NULL DEFAULT false,
	parent_id INT,

	-- CONSTRAINT fk_parent
	FOREIGN KEY (parent_id)
	REFERENCES diagnostic_categories (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS diagnoses (
	id INT AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
	name VARCHAR(255) NOT NULL DEFAULT "Неуточнена диагноза",
	category_id INT,

	-- CONSTRAINT fk_diagnoses_category
		FOREIGN KEY (category_id)
		REFERENCES diagnostic_categories (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS users_diagnoses (
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	diagnoses_id INT NOT NULL,
	diagnose_date DATETIME DEFAULT NOW(),
	doctor_id INT NOT NULL,

	-- CONSTRAINT fk_users
	FOREIGN KEY (user_id)
	REFERENCES users (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,

	-- CONSTRAINT fk_diagnonses
	FOREIGN KEY (diagnoses_id)
	REFERENCES diagnoses (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,

	-- CONSTRAINT fk_doctor
	FOREIGN KEY (doctor_id)
	REFERENCES users (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS drugs_categories (
	id INT AUTO_INCREMENT PRIMARY KEY,	
	code VARCHAR(50) NOT NULL,
	name VARCHAR(255) NOT NULL DEFAULT "Неуточнена категория лекарства",
	is_top BOOLEAN NOT NULL DEFAULT false,
	parent_id INT,

	-- CONSTRAINT fk_parent
	FOREIGN KEY (parent_id)
	REFERENCES drugs_categories (id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS drugs (
	id INT AUTO_INCREMENT PRIMARY KEY,
	code VARCHAR(50) NOT NULL,
	name VARCHAR(255) NOT NULL DEFAULT "Неуточнено лекарство",
	category_id INT,

	-- CONSTRAINT fk_diagnoses_category
		FOREIGN KEY (category_id)
		REFERENCES drugs_categories (id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS prescriptions (
	id INT AUTO_INCREMENT PRIMARY KEY,
	user_id INT NOT NULL,
	related_diagnosis_id INT NOT NULL,
	prescription_date DATETIME DEFAULT NOW(),
	doctor_id INT NOT NULL,

	-- CONSTRAINT fk_users
	FOREIGN KEY (user_id)
	REFERENCES users (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,

	-- CONSTRAINT fk_diagnonsis
	FOREIGN KEY (related_diagnosis_id)
	REFERENCES users_diagnoses (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,

	-- CONSTRAINT fk_doctor
	FOREIGN KEY (doctor_id)
	REFERENCES users (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS prescriptions_drugs (
	id INT AUTO_INCREMENT PRIMARY KEY,
	prescription_id INT NOT NULL,
	drug_id INT NOT NULL,

	-- CONSTRAINT fk_prescription
	FOREIGN KEY (prescription_id)
	REFERENCES prescriptions (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,

	-- CONSTRAINT fk_drug
	FOREIGN KEY (drug_id)
	REFERENCES drugs (id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION
)

