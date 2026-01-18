


USE hospital;

DELIMITER $$

-- DROP FUNCTION get_drug_category_path;
-- DROP PROCEDURE get_drug_category_path_with_codes;

CREATE FUNCTION IF NOT EXISTS get_drug_category_path(drugId INT) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE category_path VARCHAR(255);

    WITH RECURSIVE category_hierarchy AS (
        SELECT dc.id, dc.name, dc.parent_id
        FROM drugs d
        JOIN drugs_categories dc ON d.category_id = dc.id
        WHERE d.id = drugId
        UNION ALL
        SELECT parent.id, parent.name, parent.parent_id
        FROM drugs_categories parent
        JOIN category_hierarchy ch ON ch.parent_id = parent.id
    )
    SELECT GROUP_CONCAT(name ORDER BY id DESC SEPARATOR ' -> ')
    INTO category_path
    FROM category_hierarchy;

    RETURN category_path;
END$$

CREATE PROCEDURE IF NOT EXISTS get_drug_category_path_with_codes(IN drugId INT)
BEGIN
    WITH RECURSIVE category_hierarchy AS (
        -- Start with the drug's category
        SELECT 
            dc.id,
            dc.code,
            dc.name,
            dc.parent_id
        FROM drugs d
        JOIN drugs_categories dc ON d.category_id = dc.id
        WHERE d.id = drugId

        UNION ALL

        -- Climb to parent categories
        SELECT 
            parent.id,
            parent.code,
            parent.name,
            parent.parent_id
        FROM drugs_categories parent
        JOIN category_hierarchy ch ON ch.parent_id = parent.id
    )
    SELECT 
        GROUP_CONCAT(CONCAT(code, ' ', name) ORDER BY id DESC SEPARATOR ' -> ') AS "Категории на лекаството с кодове"
    FROM category_hierarchy;
END$$

SELECT get_drug_category_path(1) AS "Категории на лекаството";
CALL get_drug_category_path_with_codes(1);
