DELIMITER $$
drop trigger if exists after_insert_users_has_atracoes;

CREATE TRIGGER after_insert_users_has_atracoes
AFTER INSERT ON hopi_hari_db.users_has_atracoes
FOR EACH ROW
BEGIN
    DECLARE wait_time INT;
    DECLARE users_has_atracoes_count INT;
    DECLARE total_wait INT;

    -- Obter o tempo de espera da atração
    SELECT tempo_espera INTO wait_time
    FROM atracoes
    WHERE id = NEW.atracoes_id;

    -- Contar quantos usuários estão na fila dessa atração
    SELECT COUNT(id) INTO users_has_atracoes_count
    FROM hopi_hari_db.users_has_atracoes
    WHERE atracoes_id = NEW.atracoes_id;

    -- Calcular o tempo total
    SET total_wait = wait_time * users_has_atracoes_count;

    -- Inserir notificação
    INSERT INTO notifications (description, users_id, atracoes_id, status)
    VALUES (CONCAT(total_wait, " minuto(s) de espera para o brinquedo"), NEW.users_id, NEW.atracoes_id, TRUE);
END$$

DELIMITER ;    