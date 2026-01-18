
USE hospital;

INSERT INTO roles (id, role, display_name) VALUES
(1, "patient", "Patient"),
(2, "doctor", "Doctor"),
(3, "admin", "Hospital Administrator");

/* INSERT INTO users (username, full_name, role_id) VALUES
("admin", "Администратор", 3),
("vankata", "Иван Стоянов Иванов", 1),
("doctor_house", "Йордан Цончев Иванов", 2); */

/* INSERT INTO diagnostic_categories (code, name, is_top) VALUES
("J", "Заболявания на дихателната система", true);

INSERT INTO diagnostic_categories (code, name, is_top, parent_id) VALUES
("J09-J18", "Грип", false, 1);

INSERT INTO diagnostic_categories (code, name, is_top, parent_id) VALUES
("J12", "Вирусна пневмония, некласифицирана другаде", false, 2);


INSERT INTO diagnoses (code, name, category_id) VALUES
("J12.9", "Вирусна пневмония, неуточнена", 3); */

/* INSERT INTO drugs_categories (code, name, is_top, parent_id) VALUES
("N", "Нервна система", true, NULL),
("N02", "Аналгетици", false, 1),
("N02B", "Други аналгетици и антипиретици", false, 2),
("N02BE", "Анилиди", false, 3); */

/* INSERT INTO drugs (code, name, category_id) VALUES
("N02BE01", "Парацетамол", 4); */

/* INSERT INTO users_diagnoses (user_id, diagnoses_id, doctor_id) VALUES
(1, 1, 2); */

/* INSERT INTO prescriptions (user_id, related_diagnosis_id, doctor_id) VALUES
(1, 1, 2); */

/* DELETE FROM prescriptions;

DELETE FROM users_diagnoses;

DELETE FROM diagnostic_categories;

DELETE FROM diagnoses;

DELETE FROM drugs_categories;

DELETE FROM drugs;

DELETE FROM users; */


INSERT INTO users (id, username, full_name, role_id) VALUES
(1, 'ivan_petrov', 'Иван Петров Иванов', 1),
(2, 'georgi_dimitrov', 'Георги Димитров Георгиев', 2),
(3, 'maria_ivanova', 'Мария Иванова Петрова', 1),
(4, 'nikolay_stefanov', 'Николай Стефанов Колев', 2),
(5, 'elena_todorova', 'Елена Тодорова Николова', 1),
(6, 'petar_vasilev', 'Петър Василев Стоянов', 2),
(7, 'desislava_hristova', 'Десислава Христова Димитрова', 1),
(8, 'stoyan_marinov', 'Стоян Маринов Петров', 2),
(9, 'radostina_popova', 'Радостина Попова Илиева', 1),
(10, 'mihail_iliev', 'Михаил Илиев Андреев', 2),
(11, 'yoana_peneva', 'Йоана Пенева Костова', 1),
(12, 'kaloyan_nakov', 'Калоян Наков Тодоров', 2),
(13, 'borislav_genov', 'Борислав Генов Симеонов', 3),
(14, 'vesela_radeva', 'Весела Радева Михайлова', 1),
(15, 'plamen_zhivkov', 'Пламен Живков Дончев', 3);

INSERT INTO diagnostic_categories (id, code, name, is_top, parent_id) VALUES
-- Top-level ICD-10 chapters
(1, 'A-B', 'Някои инфекциозни и паразитни болести', true, NULL),
(2, 'J', 'Болести на дихателната система', true, NULL),
(3, 'I', 'Болести на кръвоносната система', true, NULL),

-- J chapter subcategories
(4, 'J00-J06', 'Остри инфекции на горните дихателни пътища', false, 2),
(5, 'J09-J18', 'Грип и пневмония', false, 2),
(6, 'J20-J22', 'Други остри инфекции на долните дихателни пътища', false, 2),

-- Pneumonia subcategories
(7, 'J12', 'Вирусна пневмония', false, 5),
(8, 'J13', 'Пневмония, причинена от Streptococcus pneumoniae', false, 5),
(9, 'J18', 'Пневмония, неуточнена', false, 5),

-- Cardiovascular subcategories
(10, 'I10-I15', 'Хипертонични болести', false, 3),
(11, 'I20-I25', 'Исхемична болест на сърцето', false, 3);

INSERT INTO diagnoses (id, code, name, category_id) VALUES
-- Upper respiratory infections (very common)
(1, 'J00', 'Остър назофарингит (хрема)', 4),
(2, 'J01.9', 'Остър синузит, неуточнен', 4),
(3, 'J02.9', 'Остър фарингит, неуточнен', 4),
(4, 'J06.9', 'Остра инфекция на горните дихателни пътища, неуточнена', 4),

-- Influenza and pneumonia (common)
(5, 'J10.1', 'Грип с други респираторни прояви', 5),
(6, 'J11.0', 'Грип, вирусът не е идентифициран, с пневмония', 5),

-- Viral pneumonia
(7, 'J12.0', 'Аденовирусна пневмония', 7),
(8, 'J12.1', 'Респираторно-синцитиална вирусна пневмония', 7),
(9, 'J12.9', 'Вирусна пневмония, неуточнена', 7),

-- Bacterial / unspecified pneumonia (very common in practice)
(10, 'J13', 'Пневмония, причинена от Streptococcus pneumoniae', 8),
(11, 'J18.0', 'Бронхопневмония, неуточнена', 9),
(12, 'J18.9', 'Пневмония, неуточнена', 9),

-- Lower respiratory infections
(13, 'J20.9', 'Остър бронхит, неуточнен', 6),
(14, 'J22', 'Остра инфекция на долните дихателни пътища, неуточнена', 6),

-- Cardiovascular (extremely common)
(15, 'I10', 'Есенциална (първична) хипертония', 10),
(16, 'I11.9', 'Хипертонична болест на сърцето без сърдечна недостатъчност', 10),
(17, 'I20.9', 'Стенокардия, неуточнена', 11),
(18, 'I25.9', 'Хронична исхемична болест на сърцето, неуточнена', 11);

INSERT INTO users_diagnoses (id, user_id, diagnoses_id, diagnose_date, doctor_id) VALUES
-- Upper respiratory infections (very common)
(1, 1, 1, '2024-11-05 10:30:00', 2),   -- J00 Остър назофарингит
(2, 3, 4, '2024-11-12 09:15:00', 4),   -- J06.9 Остра ИДП, неуточнена
(3, 5, 2, '2024-12-01 14:45:00', 6),   -- J01.9 Остър синузит
(4, 7, 3, '2024-12-10 11:00:00', 8),   -- J02.9 Остър фарингит

-- Pneumonia (common but fewer than URIs)
(5, 9, 9, '2024-12-18 16:20:00', 10),  -- J12.9 Вирусна пневмония
(6, 11, 12, '2024-12-22 13:10:00', 12),-- J18.9 Пневмония, неуточнена

-- Chronic cardiovascular conditions
(7, 1, 15, '2023-06-14 08:40:00', 4),  -- I10 Есенциална хипертония
(8, 3, 16, '2023-08-03 10:00:00', 6),  -- I11.9 Хипертонична болест на сърцето

-- Influenza
(9, 5, 6, '2024-01-25 15:30:00', 2),   -- J11.0 Грип с пневмония

-- Repeat / follow-up diagnosis (realistic scenario)
(10, 1, 4, '2025-01-04 09:20:00', 8);   -- J06.9 повторна ИДП

INSERT INTO drugs_categories (id, code, name, is_top, parent_id) VALUES
-- Top-level ATC groups
(1, 'A', 'Храносмилателна система и метаболизъм', true, NULL),
(2, 'J', 'Антиинфекциозни средства за системна употреба', true, NULL),
(3, 'R', 'Дихателна система', true, NULL),
(4, 'C', 'Сърдечно-съдова система', true, NULL),

-- R – Respiratory system
(5, 'R01', 'Назални препарати', false, 3),
(6, 'R05', 'Препарати при кашлица и простудни заболявания', false, 3),
(7, 'R03', 'Препарати за обструктивни заболявания на дихателните пътища', false, 3),

-- J – Anti-infectives
(8, 'J01', 'Антибактериални средства за системна употреба', false, 2),
(9, 'J05', 'Антивирусни средства за системна употреба', false, 2),

-- C – Cardiovascular
(10, 'C09', 'Средства, действащи върху ренин-ангиотензиновата система', false, 4),
(11, 'C07', 'Бета-блокери', false, 4),

-- A – Digestive
(12, 'A02', 'Препарати при киселинно-свързани заболявания', false, 1);

INSERT INTO drugs (id, code, name, category_id) VALUES
-- Respiratory system (very common)
(1, 'R01AA07', 'Ксилометазолин', 5),
(2, 'R01AB01', 'Оксиметазолин', 5),

(3, 'R05CB01', 'Ацетилцистеин', 6),
(4, 'R05DA09', 'Кодеин', 6),

(5, 'R03AC02', 'Салбутамол', 7),
(6, 'R03BA02', 'Будезонид', 7),

-- Anti-infectives (very common)
(7, 'J01CA04', 'Амоксицилин', 8),
(8, 'J01CR02', 'Амоксицилин с клавуланова киселина', 8),
(9, 'J01FA10', 'Азитромицин', 8),

(10, 'J05AB01', 'Ацикловир', 9),
(11, 'J05AH02', 'Оселтамивир', 9),

-- Cardiovascular (extremely common)
(12, 'C09AA02', 'Еналаприл', 10),
(13, 'C09CA01', 'Лосартан', 10),

(14, 'C07AB02', 'Метопролол', 11),
(15, 'C07AB07', 'Бисопролол', 11),

-- Digestive system
(16, 'A02BC01', 'Омепразол', 12),
(17, 'A02BC02', 'Пантопразол', 12);

INSERT INTO prescriptions (id, user_id, related_diagnosis_id, prescription_date, doctor_id) VALUES
-- Upper respiratory infections (very common)
(1, 1, 1, '2024-11-05 10:45:00', 2),
(2, 3, 2, '2024-11-12 09:30:00', 4),
(3, 5, 3, '2024-12-01 15:00:00', 6),
(4, 7, 4, '2024-12-10 11:15:00', 8),

-- Pneumonia (fewer but serious)
(5, 9, 5, '2024-12-18 16:45:00', 10),
(6, 11, 6, '2024-12-22 13:30:00', 12),

-- Chronic cardiovascular diseases
(7, 1, 7, '2023-06-14 09:00:00', 4),
(8, 3, 8, '2023-08-03 10:15:00', 6),

-- Influenza
(9, 5, 9, '2024-01-25 15:45:00', 2),

-- Follow-up prescription
(10, 1, 10, '2025-01-04 09:35:00', 8);

INSERT INTO prescriptions_drugs (prescription_id, drug_id) VALUES
-- Prescription 1: patient 1 – common URI
(1, 1),  -- Ксилометазолин
(1, 3),  -- Ацетилцистеин

-- Prescription 2: patient 3 – URI
(2, 2),  -- Оксиметазолин
(2, 4),  -- Кодеин

-- Prescription 3: patient 5 – sinusitis
(3, 1),  -- Ксилометазолин
(3, 3),  -- Ацетилцистеин

-- Prescription 4: patient 7 – pharyngitis
(4, 2),  -- Оксиметазолин
(4, 4),  -- Кодеин

-- Prescription 5: patient 9 – viral pneumonia
(5, 5),  -- Салбутамол
(5, 6),  -- Будезонид
(5, 7),  -- Амоксицилин

-- Prescription 6: patient 11 – unspecified pneumonia
(6, 7),  -- Амоксицилин
(6, 8),  -- Амоксицилин с клавуланова киселина

-- Prescription 7: patient 1 – hypertension
(7, 15), -- Еналаприл

-- Prescription 8: patient 3 – hypertensive heart disease
(8, 16), -- Лосартан

-- Prescription 9: patient 5 – influenza
(9, 9),  -- Азитромицин
(9, 10), -- Ацикловир

-- Prescription 10: patient 1 – follow-up URI
(10, 3), -- Ацетилцистеин
(10, 4); -- Кодеин

