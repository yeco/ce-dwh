DELIMITER $$

USE `kalturadw_ds`$$

DROP PROCEDURE IF EXISTS `transfer_cycle_partition`$$

CREATE DEFINER=`etl`@`localhost` PROCEDURE `transfer_cycle_partition`(p_cycle_id VARCHAR(10))
BEGIN
	DECLARE src_table VARCHAR(45);
	DECLARE tgt_table VARCHAR(45);
	DECLARE dup_clause VARCHAR(4000);
	DECLARE partition_field VARCHAR(45);
	DECLARE select_fields VARCHAR(4000);
	DECLARE post_transfer_sp_val VARCHAR(4000);
	DECLARE aggr_date VARCHAR(400);
	DECLARE aggr_hour VARCHAR(400);
	DECLARE aggr_names VARCHAR(4000);
	
	DECLARE done INT DEFAULT 0;
	DECLARE staging_areas_cursor CURSOR FOR SELECT 	source_table, target_table, IFNULL(on_duplicate_clause,''),	staging_partition_field, post_transfer_sp, aggr_date_field, hour_id_field, post_transfer_aggregations
											FROM staging_areas s, cycles c
											WHERE s.process_id=c.process_id AND c.cycle_id = p_cycle_id;
											
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
	OPEN staging_areas_cursor;
	
	read_loop: LOOP
		FETCH staging_areas_cursor INTO src_table, tgt_table, dup_clause, partition_field, post_transfer_sp_val, aggr_date, aggr_hour, aggr_names;
		IF done THEN
			LEAVE read_loop;
		END IF;
		
		IF ((LENGTH(AGGR_DATE) > 0) && (LENGTH(aggr_names) > 0)) THEN
		
			SET @s = CONCAT(
				'INSERT INTO kalturadw.aggr_managment(aggr_name, aggr_day, aggr_day_int, hour_id, is_calculated)
				SELECT aggr_name, date(aggr_date), aggr_date, aggr_hour, 0
				FROM (SELECT DISTINCT aggr_name FROM kalturadw.aggr_managment) a, 
					(select distinct ',aggr_date, ' aggr_date,' ,aggr_hour,' aggr_hour 
					 from ',src_table,
					' where ',partition_field,' = ',p_cycle_id,') ds
				WHERE aggr_name in ', aggr_names,'
				ON DUPLICATE KEY UPDATE is_calculated = 0');
			
			PREPARE stmt FROM @s;
			EXECUTE stmt;
			DEALLOCATE PREPARE stmt;
		END IF;

		SELECT 	GROUP_CONCAT(column_name ORDER BY ordinal_position)
		INTO 	select_fields
		FROM information_schema.COLUMNS
		WHERE CONCAT(table_schema,'.',table_name) = tgt_table;
			
		SET @s = CONCAT(	'insert into ',tgt_table, ' (',select_fields,') ',
						' select ',select_fields,
						' from ',src_table,
						' where ',partition_field,'  = ',p_cycle_id,
						' ',dup_clause );

		PREPARE stmt FROM @s;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
			
		IF LENGTH(POST_TRANSFER_SP_VAL)>0 THEN
				SET @s = CONCAT('call ',post_transfer_sp_val,'(',p_cycle_id,')');
				
				PREPARE stmt FROM  @s;
				EXECUTE stmt;
				DEALLOCATE PREPARE stmt;
		END IF;
	END LOOP;

	CLOSE staging_areas_cursor;
END$$

DELIMITER ;
