USE kalturadw;
DROP TABLE IF EXISTS `dwh_fact_bandwidth_usage_new`;

CREATE TABLE `dwh_fact_bandwidth_usage_new` (
  `file_id` INT(11) NOT NULL,
  `line_number` INT (11),
  `partner_id` INT(11) NOT NULL DEFAULT '-1',
  `activity_date_id` INT(11) DEFAULT '-1',
  `activity_hour_id` TINYINT(4) DEFAULT '-1',
  `bandwidth_source_id` BIGINT(20) DEFAULT NULL,
  `url` VARCHAR(2000) DEFAULT NULL,
  `bandwidth_bytes` BIGINT(20) DEFAULT '0',
  `user_ip` VARCHAR(15) DEFAULT NULL,
  `user_ip_number` INT(10) UNSIGNED DEFAULT NULL,
  `country_id` INT(11) DEFAULT NULL,
  `location_id` INT(11) DEFAULT NULL
) ENGINE=INNODB DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (activity_date_id)
(PARTITION p_20080531 VALUES LESS THAN (20080601) ENGINE = InnoDB,
 PARTITION p_20080630 VALUES LESS THAN (20080701) ENGINE = InnoDB,
 PARTITION p_20080731 VALUES LESS THAN (20080801) ENGINE = InnoDB,
 PARTITION p_20080831 VALUES LESS THAN (20080901) ENGINE = InnoDB,
 PARTITION p_20080930 VALUES LESS THAN (20081001) ENGINE = InnoDB,
 PARTITION p_20081031 VALUES LESS THAN (20081101) ENGINE = InnoDB,
 PARTITION p_20081130 VALUES LESS THAN (20081201) ENGINE = InnoDB,
 PARTITION p_20081231 VALUES LESS THAN (20090101) ENGINE = InnoDB,
 PARTITION p_20090131 VALUES LESS THAN (20090201) ENGINE = InnoDB,
 PARTITION p_20090228 VALUES LESS THAN (20090301) ENGINE = InnoDB,
 PARTITION p_20090331 VALUES LESS THAN (20090401) ENGINE = InnoDB,
 PARTITION p_20090430 VALUES LESS THAN (20090501) ENGINE = InnoDB,
 PARTITION p_20090531 VALUES LESS THAN (20090601) ENGINE = InnoDB,
 PARTITION p_20090630 VALUES LESS THAN (20090701) ENGINE = InnoDB,
 PARTITION p_20090731 VALUES LESS THAN (20090801) ENGINE = InnoDB,
 PARTITION p_20090831 VALUES LESS THAN (20090901) ENGINE = InnoDB,
 PARTITION p_20090930 VALUES LESS THAN (20091001) ENGINE = InnoDB,
 PARTITION p_20091031 VALUES LESS THAN (20091101) ENGINE = InnoDB,
 PARTITION p_20091130 VALUES LESS THAN (20091201) ENGINE = InnoDB,
 PARTITION p_20091231 VALUES LESS THAN (20100101) ENGINE = InnoDB,
 PARTITION p_20100131 VALUES LESS THAN (20100201) ENGINE = InnoDB,
 PARTITION p_20100228 VALUES LESS THAN (20100301) ENGINE = InnoDB,
 PARTITION p_20100331 VALUES LESS THAN (20100401) ENGINE = InnoDB,
 PARTITION p_20100430 VALUES LESS THAN (20100501) ENGINE = InnoDB,
 PARTITION p_20100531 VALUES LESS THAN (20100601) ENGINE = InnoDB,
 PARTITION p_20100630 VALUES LESS THAN (20100701) ENGINE = InnoDB,
 PARTITION p_20100731 VALUES LESS THAN (20100801) ENGINE = InnoDB,
 PARTITION p_20100831 VALUES LESS THAN (20100901) ENGINE = InnoDB,
 PARTITION p_20100930 VALUES LESS THAN (20101001) ENGINE = InnoDB,
 PARTITION p_20101031 VALUES LESS THAN (20101101) ENGINE = InnoDB,
 PARTITION p_20101130 VALUES LESS THAN (20101201) ENGINE = InnoDB,
 PARTITION p_20101231 VALUES LESS THAN (20110101) ENGINE = InnoDB) */;

CALL kalturadw.add_daily_partition_for_table('dwh_fact_bandwidth_usage_new');
