CREATE TABLE `kalturadw`.`dwh_dim_flavor_assets` (
  `flavor_asset_id` varchar(20) NOT NULL,
  `flavor_asset_int_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `tags` text,
  `created_at` datetime default NULL,
  `created_date_id` int(11),
  `created_hour_id` tinyint(4),
  `updated_at` datetime default NULL,
  `updated_date_id` int(11),
  `updated_hour_id` tinyint(4),
  `deleted_at` datetime default NULL,
  `deleted_date_id` int(11),
  `deleted_hour_id` tinyint(4),
  `entry_id` varchar(20) NOT NULL,
  `flavor_params_id` int(11) NOT NULL,
  `flavor_asset_status_id` tinyint(4) default NULL,
  `version` varchar(20) default NULL,
  `description` varchar(255) NOT NULL,
  `width` int(11) NOT NULL default '0',
  `height` int(11) NOT NULL default '0',
  `bitrate` int(11) NOT NULL default '0',
  `frame_rate` int(11) NOT NULL default '0',
  `size` int(11) NOT NULL default '0',
  `is_original` int(4) NOT NULL default '0',
  PRIMARY KEY  (`flavor_asset_int_id`),
  KEY `flavor_asset_FI_1` (`entry_id`),
  KEY `flavor_asset_FI_2` (`flavor_params_id`),
  KEY `partner_id_entry_id` (`partner_id`,`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8