
/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `kalturadw_ds`;

/*Table structure for table `aggr_name_resolver` */

CREATE TABLE `aggr_name_resolver` (
  `aggr_name` varchar(100) NOT NULL DEFAULT '',
  `aggr_table` varchar(100) DEFAULT NULL,
  `aggr_id_field` varchar(100) DEFAULT NULL,
  `aggr_join_stmt` varchar(200) DEFAULT '',
  PRIMARY KEY (`aggr_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `aggr_name_resolver` */

insert  into `aggr_name_resolver`(`aggr_name`,`aggr_table`,`aggr_id_field`,`aggr_join_stmt`) 
values  ('entry','dwh_hourly_events_entry','entry_id',''),
        ('domain','dwh_hourly_events_domain','domain_id',''),
        ('country','dwh_hourly_events_country','country_id,location_id',''),
        ('partner','dwh_hourly_partner','',''),
        ('widget','dwh_hourly_events_widget','widget_id',''),
        ('uid','dwh_hourly_events_uid','kuser_id','USE INDEX (event_hour_id_event_date_id_partner_id) inner join kalturadw.dwh_dim_entries as entry on(ev.entry_id = entry.entry_id)'),
	('domain_referrer', 'dwh_hourly_events_domain_referrer', 'domain_id, referrer_id', ''),
	('devices', 'dwh_hourly_events_devices', 'country_id,location_id,os_id,browser_id,ui_conf_id, entry_id','');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
