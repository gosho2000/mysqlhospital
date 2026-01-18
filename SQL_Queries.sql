

USE hospital;

-- SELECT "Справка потрбители" AS message;

-- Справка потребители

SELECT u.id AS "Ид. No", u.username AS "Потрб. име", u.full_name AS "Име", r.role AS "Тип роля", r.display_name AS "Роля" FROM users u
INNER JOIN roles r ON u.role_id = r.id;

-- Справка на диагнозите на всички пациенти

SELECT u.id AS "Ид. No", u.username AS "Потрб. име", u.full_name AS "Име", 
       ud.diagnose_date AS "Дата на диагност.",
			 d.code AS "Код", d.name AS "Диагноза"
FROM users u
LEFT JOIN users_diagnoses ud ON u.id = ud.user_id
LEFT JOIN	diagnoses d ON ud.diagnoses_id = d.id
LEFT JOIN roles r ON u.role_id = r.id
WHERE r.id = 1;

-- Справка изписани лекарства на всички пациенти

SELECT u.id AS "Ид. No", u.username AS "Потб. име", u.full_name AS "Име",
       p.prescription_date AS "Дата на предисване",
			 d.code AS "Код", d.name AS "Лекарство"
FROM users u
LEFT JOIN prescriptions p ON p.user_id = u.id
LEFT JOIN prescriptions_drugs pd ON pd.prescription_id = p.id
LEFT JOIN drugs d ON pd.drug_id = d.id
LEFT JOIN roles r ON u.role_id = r.id
WHERE r.id = 1;

-- Справка лекарства

SELECT d.id AS "Ид. No", d.code AS "Код", d.name AS "Наименование",
       c.code AS "Код категория", c.name AS "Категория"
FROM drugs d
LEFT JOIN drugs_categories c ON d.category_id = c.id;

-- Справка диагнози

SELECT d.id AS "Ид. No", d.code AS "Код", d.name AS "Наименование",
       c.code AS "Код категория", c.name AS "Категория"
FROM diagnoses d
LEFT JOIN diagnostic_categories c ON d.category_id = c.id;

-- Справка изписани лекарства от всички лекари

SELECT d.id AS "Ид. No", d.username AS "Потрб. име", d.full_name AS "Име",
       dr.code AS "Код", dr.name AS "Лекарство",
			 pr.prescription_date AS "Дата",
			 p.id AS "Пациент Ид. No", p.full_name AS "Име",
			 dg.name AS "Диагноза"
FROM users d
LEFT JOIN prescriptions pr ON pr.doctor_id = d.id
LEFT JOIN prescriptions_drugs pd ON pd.prescription_id = pr.id
LEFT JOIN drugs dr ON pd.drug_id = dr.id
LEFT JOIN users_diagnoses ud ON pr.related_diagnosis_id = ud.id 
LEFT JOIN diagnoses dg ON ud.diagnoses_id = dg.id
LEFT JOIN users p ON pr.user_id = p.id
LEFT JOIN roles r ON d.role_id = r.id
WHERE r.id = 2;

-- Справка за поставени диагнози на потребители

SELECT d.id AS "Ид. No", d.username AS "Потрб. име", d.full_name AS "Име",
       dg.code AS "Код", dg.name AS "Диагноза",
			 ud.diagnose_date AS "Дата",
			 p.id AS "Пациент Ид. No", p.full_name AS "Име"
FROM users d
LEFT JOIN users_diagnoses ud ON ud.doctor_id = d.id
LEFT JOIN diagnoses dg ON ud.diagnoses_id = dg.id
LEFT JOIN users p ON ud.user_id = p.id
LEFT JOIN roles r ON d.role_id = r.id
WHERE r.id = 2;


