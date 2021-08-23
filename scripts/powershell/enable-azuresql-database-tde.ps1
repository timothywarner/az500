EXECUTE sp_set_database_firewall_rule N'my_db_rule';
,'168.0.0.0'
,'168.0.0.0'

-- Enable Azure connections.
EXECUTE sp_set_database_firewall_rule N'Allow Azure', '0.0.0.0', '0.0.0.0';

-- Create database-level firewall setting for only IP 0.0.0.4
EXECUTE sp_set_database_firewall_rule N'Example DB Setting 1', '0.0.0.4', '0.0.0.4';

-- Update database-level firewall setting to create a range of allowed IP addresses
EXECUTE sp_set_database_firewall_rule N'Example DB Setting 1', '0.0.0.4', '0.0.0.6';