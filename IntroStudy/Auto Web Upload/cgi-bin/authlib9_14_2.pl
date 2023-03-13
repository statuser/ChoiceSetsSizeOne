# ---------------------------------------------------------------------------
#     AUTHLIB.PL
#
#      Ver: 9_14_2
# ---------------------------------------------------------------------------
# Lighthouse Studio - Web Surveying System
# Copyright Sawtooth Software, Inc. 1998-2022. All rights reserved.
# Provo, UT  USA  (801) 477-4700
#
# Any modification of this script will be considered violation of
# copyright (with the exception of the first line which can be
# modified to reflect the correct path to the Perl interpreter)
#
# Any use of this script or its code for purposes outside of
# the systems created by Sawtooth Software is prohibited.
# ---------------------------------------------------------------------------
 use strict; use Symbol qw(gensym); package authlib9_14_2; eval { require 5.014002; }; if ($@) { authlib9_14_2::_zq(339, "Lighthouse Studio requires Perl version 5.14.2 or greater to run properly. This server is running Perl version " . $^V . ".", "", $@); } use constant _ANA => 0; use constant _ANB => -4; use constant _ANC => -3; use constant _AND => -2; use constant _ANE => -1; use constant _ANF => 1; use constant _ANG => 2; use constant _ANH => 3; use constant _ANI => 4; use constant _ANJ => 5; use constant _ANK => 6; use constant _ANL => 7; use constant _ANM => 8; use constant _ANN => 9; use constant _ANO => 10; use constant _ANP => 13; use constant _ANQ => 14; use constant _ANR => 15; use constant _ANS => 16; use constant _ANT => 17; use constant _ANU => 18; use constant _ANV => 19; use constant _ANW => 20; use constant _ANX => 21; use constant _ANY => 22; use constant _ANZ => 23; use constant _AOA => 24; use constant _AOB => 25; use constant _AOC => 26; use constant _AOD => 27; use constant _AOE => 28; use constant _AOF => 2; use constant _AOG => 4; use constant _AOH => 5; use constant _AOI => 1; use constant _AOJ => 2; use constant _AOK => 3; use constant _AOL => 4; use constant _AOM => 5; use constant _AON => 6; use constant _AOO => 0; use constant _AOP => 1; use constant _AOQ => 2; use constant _AOR => 3; use constant _AOS => 1; use constant _AOT => 2; use constant _AOU => 3; use constant _AOV => 1; use constant _AOW => 2; use constant _AOX => 3; use constant _AOY => 4; use constant _AOZ => 5; use constant _APA => 1; use constant _APB => 2; use constant _APC => 3; use constant _APD => 4; use constant _APE => 5; use constant _APF => 1; use constant _APG => 2; use constant _APH => 3; use constant _API => 10; use constant _APJ => 250; use constant _APK => 250; use constant _APL => 100; $authlib9_14_2::_akh = ""; $authlib9_14_2::_akj = ""; $authlib9_14_2::_ahn = {}; $authlib9_14_2::_ako = 0; %authlib9_14_2::_ahp = (); %authlib9_14_2::_akn = (); %authlib9_14_2::_ahr = (); $authlib9_14_2::_akg = {}; $authlib9_14_2::_aht = {}; $authlib9_14_2::_ahu = {}; %authlib9_14_2::_ahv = (); $authlib9_14_2::_akx = 0; $authlib9_14_2::_aku = 0; $authlib9_14_2::_akv = 0; $authlib9_14_2::_akw = 0; $authlib9_14_2::_aia = ""; $authlib9_14_2::_aib = ""; $authlib9_14_2::_aic = "1657730843"; $authlib9_14_2::_akp = 0; $authlib9_14_2::_akq = 0; %authlib9_14_2::_aif = (); %authlib9_14_2::_aig = (); $authlib9_14_2::_aih = 0; $authlib9_14_2::_aii = 0; $authlib9_14_2::_aik = 0; $authlib9_14_2::_ail = 0; $authlib9_14_2::_alk = 0; $authlib9_14_2::_ain = {}; $authlib9_14_2::_amd = 0; $authlib9_14_2::_alr = 0; $authlib9_14_2::_als = ""; $authlib9_14_2::_alt = ""; %authlib9_14_2::_ais = (); %authlib9_14_2::_ait = (); $authlib9_14_2::_amg = 0; $authlib9_14_2::_aiv = 0; $authlib9_14_2::_alc = 0; $authlib9_14_2::_aix = 0; %authlib9_14_2::_aiy = (); $authlib9_14_2::_aiz = ""; $authlib9_14_2::_aja = 0; $authlib9_14_2::_ala = 0; $authlib9_14_2::_alb = 0; $authlib9_14_2::_ajd = 0; $authlib9_14_2::_aky = 0; $authlib9_14_2::_ajf = 0; $authlib9_14_2::_ajg = 0; $authlib9_14_2::_aji = ""; $authlib9_14_2::_ajj = 1; $authlib9_14_2::_ajk = ""; $authlib9_14_2::_ald = 1; $authlib9_14_2::_ajm = 0; %authlib9_14_2::_ajn = (); $authlib9_14_2::_ale = 0; $authlib9_14_2::_alf = 0; $authlib9_14_2::_ajq = 0; $authlib9_14_2::_ajr = 0; $authlib9_14_2::_aij = 0; $authlib9_14_2::_ajs = 0; $authlib9_14_2::_ame = 0; $authlib9_14_2::_ake = 0; $authlib9_14_2::_akm = 0; $authlib9_14_2::_ajw = {}; $authlib9_14_2::_ajx = 0; $authlib9_14_2::_ajy = 0; $authlib9_14_2::_ajz = 0; $authlib9_14_2::_alh = 0; sub _wc { my ($__bbw) = @_; $authlib9_14_2::_akh = ""; $authlib9_14_2::_akj = ""; $authlib9_14_2::_ahn = {}; $authlib9_14_2::_ako = 0; %authlib9_14_2::_ahp = (); %authlib9_14_2::_akn = (); %authlib9_14_2::_ahr = (); $authlib9_14_2::_akg = {}; $authlib9_14_2::_aht = {}; $authlib9_14_2::_ahu = {}; %authlib9_14_2::_ahv = (); $authlib9_14_2::_akx = 0; $authlib9_14_2::_aku = 0; $authlib9_14_2::_akv = 0; $authlib9_14_2::_akw = 0; $authlib9_14_2::_aia = "9_14_2"; $authlib9_14_2::_aib = ".pl"; $authlib9_14_2::_aic = "1657730843"; $authlib9_14_2::_akp = 0; $authlib9_14_2::_akq = 0; %authlib9_14_2::_aif = (); %authlib9_14_2::_aig = (); $authlib9_14_2::_aih = 0; $authlib9_14_2::_aii = 0; $authlib9_14_2::_aij = 0; $authlib9_14_2::_aik = 0; $authlib9_14_2::_ail = 0; $authlib9_14_2::_alk = 0; $authlib9_14_2::_ain = {}; $authlib9_14_2::_amd = 0; $authlib9_14_2::_alr = 0; $authlib9_14_2::_als = ""; $authlib9_14_2::_alt = ""; %authlib9_14_2::_ais = (); %authlib9_14_2::_ait = (); $authlib9_14_2::_amg = 0; $authlib9_14_2::_aiv = $__bbw; $authlib9_14_2::_alc = 0; $authlib9_14_2::_aix = 0; %authlib9_14_2::_aiy = (); $authlib9_14_2::_aiz = ""; $authlib9_14_2::_aja = 0; $authlib9_14_2::_ala = 0; $authlib9_14_2::_alb = 0; $authlib9_14_2::_ajd = 0; $authlib9_14_2::_aky = 0; $authlib9_14_2::_ajf = 0; $authlib9_14_2::_ajg = 0; $authlib9_14_2::_ajh = 0; $authlib9_14_2::_aji = ""; $authlib9_14_2::_ajj = 1; $authlib9_14_2::_ajk = ""; $authlib9_14_2::_ald = 1; $authlib9_14_2::_ajm = 0; %authlib9_14_2::_ajn = (); $authlib9_14_2::_ale = 0; $authlib9_14_2::_alf = 0; $authlib9_14_2::_ajq = 0; $authlib9_14_2::_ajr = 0; $authlib9_14_2::_ajs = 0; $authlib9_14_2::_ame = 0; $authlib9_14_2::_ake = 0; $authlib9_14_2::_akm = 0; $authlib9_14_2::_ajw = {}; $authlib9_14_2::_ajx = 0; $authlib9_14_2::_ajy = 0; $authlib9_14_2::_ajz = 0; $authlib9_14_2::_alh = 0; } sub _wd { my ($__bch) = @_; my $__bbx = 0; my $__bby = 0; my $__bbz = ""; my $__bca = ""; my $__bcb = ""; eval { require DBI; $authlib9_14_2::_ahn->{'_amh'} = 300; if (uc($__bch->{"database_type"}) eq uc("mysql")) { $__bcb = "dbi:" . $__bch->{"database_type"} . ":" . $__bch->{"database_name"} . ":" . $__bch->{"database_address"}; if ($__bch->{"database_port"}) { $__bcb .= ":" . $__bch->{"database_port"}; } $__bcb .= ";mysql_connect_timeout=20;mysql_read_timeout=20;mysql_write_timeout=20"; $authlib9_14_2::_ake = DBI->connect($__bcb, $__bch->{"database_username"}, $__bch->{"database_password"},{RaiseError => 1, PrintError => 0, AutoCommit => 0}); $authlib9_14_2::_ahn->{'_ami'} = "ENGINE = INNODB CHARACTER SET utf8 COLLATE utf8_unicode_ci ROW_FORMAT=DYNAMIC"; $authlib9_14_2::_ahn->{'_amj'} = "AUTO_INCREMENT"; $authlib9_14_2::_ahn->{'_amk'} = $__bch->{"database_name"}; } elsif (uc($__bch->{"database_type"}) eq uc("SQLite")) { my $__bcc = $authlib9_14_2::_ahn->{'_pj'}; my $__bcd = "dbi:" . $__bch->{"database_type"} . ":dbname=" . $authlib9_14_2::_ahv{'_aml'} . $authlib9_14_2::_akj . ".sqlite"; $authlib9_14_2::_ake = DBI->connect($__bcd, undef, undef, {RaiseError => 1, PrintError => 0, AutoCommit => 0, "sqlite_use_immediate_transaction" => 1}); $authlib9_14_2::_ahn->{'_amj'} = "AUTOINCREMENT"; } elsif (uc($__bch->{"database_type"}) eq uc("ODBC")) { my $__bce = $__bch->{"database_address"}; my $__bcf = "{SQL Server}"; if (exists $__bch->{"database_driver"} && $__bch->{"database_driver"} ne "") { $__bcf = $__bch->{"database_driver"}; } $__bcb = "DBI:" . $__bch->{"database_type"} . ":" . "Driver=" . $__bcf . ";Server=" . $__bce . ";" . "Database=" . $__bch->{"database_name"} . ";" . "uid=" . $__bch->{"database_username"} . ";" . "pwd=" . $__bch->{"database_password"} . ";" . "port=" . $__bch->{"database_port"}; $authlib9_14_2::_ake = DBI->connect($__bcb, undef, undef, {RaiseError => 1, PrintError => 0, AutoCommit => 0, odbc_query_timeout => 20}); my $__bcg = 1; if (exists $authlib9_14_2::_ajw->{"respnum_start"}) { $__bcg = $authlib9_14_2::_ajw->{"respnum_start"}; } $authlib9_14_2::_ahn->{'_amj'} = "IDENTITY(" . $__bcg . ", 1)"; $authlib9_14_2::_ake->{"LongReadLen"} = 131070; $authlib9_14_2::_ahn->{'_amh'} = 1000; $authlib9_14_2::_ahn->{'_amk'} = $__bch->{"database_name"}; } else { $__bby = 1; $__bca = "Failed to connect to the database."; $__bbz = "Cannot find database for " . $__bch->{"database_type"} . "."; } if (uc($__bch->{"database_type"}) ne uc("SQLite")) { if (exists $__bch->{"database_max_fields_table"}) { $authlib9_14_2::_ahn->{'_amh'} = $__bch->{"database_max_fields_table"}; } } }; if ($@) { $__bca = "Failed to connect to the database."; $__bbz = $@; if ($__bbz =~ m/Unknown database/i || $__bbz =~ m/Cannot open database/i) { $__bca .= " Cannot find the \"" . $__bch->{"database_name"} . "\" database. Make sure that this database has been created and that you have access to it."; } elsif ($__bbz =~ m/Access denied for user/i || $__bbz =~ m/Login failed for user/i) { $__bca .= " Access denied for database user \"" . $__bch->{"database_username"} . "\". Check the database user name and password. Also verify that you have the database name (" . $__bch->{"database_name"} . ") correct."; } elsif ($__bbz =~ m/install_driver(.*?)failed/i) { $__bca .= " Cannot find database driver " . $__bch->{"database_type"} . "."; } } elsif (!$authlib9_14_2::_ake) { ($__bbx, $__bca, $__bbz) = _wk($__bch->{"database_type"}); $__bby = 1; $__bca = "Failed to connect to the database."; } elsif (!$__bby) { ($__bbx, $__bca, $__bbz) = _wk($__bch->{"database_type"}); $authlib9_14_2::_ahn->{'_pj'} = lc($__bch->{"database_type"}); } else { $__bbx = 1; } if ($__bbz ne "") { $__bbz = "The system error message has been removed for security reasons. Consider using db_test.pl for debugging purposes. Contact Sawtooth Software for more information."; } return ($__bbx, $__bca, $__bbz); } sub _we { if ($authlib9_14_2::_ake) { $authlib9_14_2::_ake->commit(); $authlib9_14_2::_ake->disconnect; $authlib9_14_2::_ake = 0; } } sub _wf { my ($__bck) = @_; my $__bci = ""; if (uc($authlib9_14_2::_ajw->{"database_type"}) eq uc("mysql")) { $__bci = "LOCK TABLES `" . $__bck . "` WRITE"; } elsif (uc($authlib9_14_2::_ajw->{"database_type"}) eq uc("ODBC")) { $__bci = "SET TRANSACTION ISOLATION LEVEL SERIALIZABLE"; } if ($__bci) { eval { my $__bcj = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bci, 0)); $__bcj->execute(); $authlib9_14_2::_ake->commit(); }; if ($@) { authlib9_14_2::_zq(360, "", "Error locking the " . $__bck . " table.", $@); } } } sub _wg { my $__bcl = ""; if (uc($authlib9_14_2::_ajw->{"database_type"}) eq uc("mysql")) { $__bcl = "UNLOCK TABLES"; } elsif (uc($authlib9_14_2::_ajw->{"database_type"}) eq uc("ODBC")) { $__bcl = "SET TRANSACTION ISOLATION LEVEL READ COMMITTED"; } if ($__bcl) { eval { my $__bcm = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bcl, 0)); $__bcm->execute(); $authlib9_14_2::_ake->commit(); }; if ($@) { authlib9_14_2::_zq(361, "", "Error unlocking table.", $@); } } } sub _wh { my ($__bcn) = @_; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc" && defined($__bcn)) { $__bcn = pack("U0C*", unpack("C*", $__bcn)); } return $__bcn; } sub _wi { my ($__bco) = @_; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc" && defined($__bco)) { $__bco = pack("C*", unpack("U0C*", $__bco)); } return $__bco; } sub _wj { my ($__bcp) = @_; $__bcp =~ s{([\x00-\x29\x2C\x3A-\x40\x5B-\x5E\x60\x7B-\x7F])} {'%' . uc(unpack('H2', $1))}eg; return $__bcp; } sub _wk { my ($__bcr) = @_; if ($authlib9_14_2::_aib eq ".pl") { my @__bcq = DBI->available_drivers(); unless (grep(/$__bcr/i, @__bcq)) { return (0, "", "A " . $__bcr . " driver is not installed for Perl. Please make sure that the CPAN module DBD::" . $__bcr . " is installed and reachable from Perl."); } } return (1, "", ""); } sub _wl { my ($__bct) = @_; my $__bcs = ""; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc") { $__bcs .= "IF OBJECT_ID('" . $__bct . "') IS NOT NULL DROP TABLE \"" . $__bct . "\""; } else { $__bcs .= "DROP TABLE IF EXISTS `" . $__bct . "`"; } return $__bcs; } sub _wm { my ($__bcz) = @_; my $__bcu = ""; my $__bcv = 0; my $__bcw = 0; my $__bcx = ""; my $__bcy = ""; if ($authlib9_14_2::_ahn->{'_pj'} eq "sqlite") { $__bcu = "PRAGMA table_info(`" . $__bcz . "`)"; $__bcv = 1; $__bcw = 2; $__bcx = "name"; $__bcy = "type"; } elsif ($authlib9_14_2::_ahn->{'_pj'} eq "odbc") { $__bcu = "SELECT COLUMN_NAME 'Field', DATA_TYPE 'Type' FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '" . $__bcz . "'"; $__bcv = 0; $__bcw = 1; $__bcx = "Field"; $__bcy = "Type"; } else { $__bcu = "DESCRIBE `" . $__bcz . "`"; $__bcv = 0; $__bcw = 1; $__bcx = "Field"; $__bcy = "Type"; } return ($__bcu, $__bcv, $__bcw, $__bcx, $__bcy); } sub _wn { my ($__bda, $__bdb) = @_; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc") { $__bda =~ s/`/\"/g; if ($__bdb) { $__bda =~ s/\s+TINYINT\(\d+\)([,\s\)])/ TINYINT$1/ig; $__bda =~ s/\s+INTEGER([,\s\)])/ INT$1/ig; $__bda =~ s/\s+LONGTEXT([,\s\)])/ nvarchar\(max\)$1/ig; $__bda =~ s/\s+TEXT([,\s\)])/ nvarchar\(max\)$1/ig; $__bda =~ s/\s+VARCHAR\s*\((\d+)\)([,\s\)])/ nvarchar\($1\)$2/ig; $__bda =~ s/\s+DOUBLE([,\s\)])/ decimal\(38, 16\)$1/ig; $__bda =~ s/CREATE\s+INDEX/CREATE NONCLUSTERED INDEX/ig; } } elsif ($authlib9_14_2::_ahn->{'_pj'} eq "sqlite") { if ($__bdb) { $__bda =~ s/\s+INT([,\s\)])/ INTEGER$1/ig; $__bda =~ s/\s+TEXT/ TEXT COLLATE NOCASE/ig; $__bda =~ s/\s+VARCHAR\s*(?:\(\d+\))?/ TEXT COLLATE NOCASE/ig; $__bda =~ s/^double$/TEXT COLLATE BINARY/ig; } } return $__bda; } sub _wo { my ($__bdg, $__bdh) = @_; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc") { $authlib9_14_2::_ake->do('IF EXISTS (SELECT name FROM sys.indexes WHERE name=\''. $__bdh ."')\n\tDROP INDEX \"" . $__bdh .'" ON "'. $__bdg .'"'); } elsif ($authlib9_14_2::_ahn->{'_pj'} eq "mysql") { my $__bdc = $authlib9_14_2::_ake->selectrow_arrayref("SHOW TABLES LIKE '". $__bdg ."'"); if ($__bdc) { my $__bdd = $authlib9_14_2::_ake->selectall_arrayref("SHOW INDEX FROM `". $__bdg ."`", {Slice=>{}}); my %__bde = ("PRIMARY" => 1); foreach my $__bdf (@{$__bdd}) { if (not exists $__bde{$__bdf->{"Key_name"}}) { $__bde{$__bdf->{"Key_name"}} = 1; $authlib9_14_2::_ake->do('DROP INDEX `' . $__bdf->{"Key_name"} . '` ON `'. $__bdg .'`'); } } } } elsif ($authlib9_14_2::_ahn->{'_pj'} eq "sqlite") { $authlib9_14_2::_ake->do('DROP INDEX IF EXISTS `'. $__bdh .'`'); } } sub _wp { my ($__bdi) = @_; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc") { $__bdi =~ s/^bool$/tinyint/ig; $__bdi =~ s/^INTEGER$/int/ig; $__bdi =~ s/^LONGTEXT$/nvarchar\(max\)/ig; $__bdi =~ s/^TEXT$/nvarchar\(max\)/ig; $__bdi =~ s/^VARCHAR$/nvarchar\(max\)/ig; $__bdi =~ s/^DOUBLE$/decimal\(38, 16\)/ig; } elsif ($authlib9_14_2::_ahn->{'_pj'} eq "sqlite") { $__bdi =~ s/^bool$/tinyint\(1\)/ig; $__bdi =~ s/^int$/INTEGER/ig; $__bdi =~ s/^double$/text/ig; } else { $__bdi =~ s/^bool$/tinyint\(1\)/ig; } return $__bdi; } sub _wq { my ($__bdk) = @_; my $__bdj = 0; if ($__bdk =~ m/text/i || $__bdk =~ m/varchar/i) { $__bdj = 1; } return $__bdj; } sub _wr { my ($__bdo, $__bdp) = @_; my $__bdl = $authlib9_14_2::_ake->last_insert_id(undef, undef, "`" . $__bdo . "`", $__bdp); if (!$__bdl) { my $__bdm = ""; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc") { $__bdm = "SELECT \@\@IDENTITY FROM `" . $__bdo . "`"; } else { $__bdm = "SELECT LAST_INSERT_ID() FROM `" . $__bdo . "`"; } my $__bdn = $authlib9_14_2::_ake->selectrow_arrayref(authlib9_14_2::_wn($__bdm, 0)); $__bdl = $__bdn->[0]; if (!$__bdl) { authlib9_14_2::_zq(267, "Database error.", "Database error. Cannot get last_insert_id for " . $__bdo, $@); } } return $__bdl; } sub _ws { my ($__beg, $__beh, $__bei) = @_; my $__bdq = ""; my $__bdr = ciwlib9_14_2::_rj(); if ($__bdr > 0) { my $__bds = 0; my $__bdt = ""; my $__bdu = ""; my $__bdv = 0; if (keys %{$authlib9_14_2::_akg} == 0 && !$authlib9_14_2::_amg) { _wu($__bdr); } if (exists $authlib9_14_2::_aht->{$__beg}) { $__bdq = ""; $__bds = 1; } elsif (exists $authlib9_14_2::_akg->{$__beg}) { $__bdq = $authlib9_14_2::_akg->{$__beg}; $__bds = 1; } elsif (_aet()) { my ($__bej, $__bek) = _xk($__beg); if ($__bej) { $__bds = 1; my $__bdw = "SELECT " . $__bek . " FROM `" . $authlib9_14_2::_akj . "_data" . $__bej . "` WHERE `sys_RespNum` = " . $__bdr; my $__bdx = 0; my $__bdy = ""; eval { $__bdx = $authlib9_14_2::_ake->selectrow_hashref(authlib9_14_2::_wn($__bdw, 0)); }; if ($@ || $__bdx == 0) { } else { foreach $__bdy (keys %{$__bdx}) { $authlib9_14_2::_akg->{$__bdy} = _wi($__bdx->{$__bdy}); } if (exists $authlib9_14_2::_akg->{$__beg}) { $__bdq = $authlib9_14_2::_akg->{$__beg}; $__bds = 1; } } } if (!$__bds) { $__bdv = _adq($__bdr); if (exists $authlib9_14_2::_akg->{$__beg}) { $__bdq = $authlib9_14_2::_akg->{$__beg}; $__bds = 1; } } if (!$__bds) { if (exists $authlib9_14_2::_akn{"hid_loops"}) { if ($__beh) { if ($__beg =~ m/(.*?)\.\d+$/o) { $__bdq = _ws($1, 1); } } else { my $__bdz = 0; my $__bea = _xl($__beg); if ($__bea) { $__bdz = 1; } elsif ($__bdv) { foreach my $__beb (keys %{$__bdv}) { if ($__beb =~ m/(.*?)\./o) { if ($__beg eq $1) { $__bdz = 1; last; } } } } if ($__bdz) { my $__bec = 0; my ($__bdt, $__bdu, $__bel) = authlib9_14_2::_abt($__beg); if (exists $authlib9_14_2::_ahp{$__bdt}) { my $__bed = $authlib9_14_2::_ahp{$__bdt}; $__bec = $__bed->{'_ji'}; } else { $__bec = _aad(); } my $__bee = $authlib9_14_2::_ako->[$__bec - 1]; my $__bef = ciwlib9_14_2::_qz($authlib9_14_2::_akn{"hid_loops"}); my ($__bem, $__ben) = ciwlib9_14_2::_rb($__bee, $__bef, $__bei); if ($__bem) { $__bdq = _ws($__beg . $__bem, 1); } } } if ($__bdq) { $authlib9_14_2::_akg->{$__beg} = $__bdq; $__bds = 1; } } } } } return $__bdq; } sub _wt { my ($__beo, $__bep) = @_; delete $authlib9_14_2::_aht->{$__beo}; $authlib9_14_2::_akg->{$__beo} = $__bep; } sub _wu { my ($__bet) = @_; my @__beq = ("`sys_RespNum`", "`sys_CheckSum`", "`sys_StartTimeStamp`", "`sys_EndTimeStamp`", "`sys_RespStatus`", "`sys_DispositionCode`", "`sys_LastQuestion`", "`sys_UserJavaScript`"); my $__ber = "SELECT " . join(",", @__beq) . " FROM `" . $authlib9_14_2::_akj . "_data1` WHERE `sys_RespNum` = " . $__bet; eval { $authlib9_14_2::_akg = $authlib9_14_2::_ake->selectrow_hashref(authlib9_14_2::_wn($__ber, 0)); }; if ($@ || $authlib9_14_2::_akg == 0) { authlib9_14_2::_zq(207, "Database error.", "Database error. Initial data read failed.", $@); } my $__bes = authlib9_14_2::_aad(); if ($__bes > 1) { _ads(); } } sub _wv { my $__beu = _aab(); if ($__beu =~ m/Googlebot|Baiduspider|msnbot|bingbot|spider|robot|crawler|crawling|slurp/i) { authlib9_14_2::_act(); } } sub _ww { my ($__bex, $__bey) = @_; my $__bev = 0; if ($__bex) { my $__bew = Time::HiRes::tv_interval($__bex); $__bev = ($__bew < $__bey) ? 0 : 1; } return $__bev; } sub _wx { my ($__bfc) = @_; my $__bez = 0; my $__bfa = "SELECT `sys_RespNum` FROM `" . $authlib9_14_2::_akj . "_data1` WHERE `sys_RespNum` = " . $__bfc; my $__bfb = 0; eval { $__bfb = $authlib9_14_2::_ake->selectrow_hashref(authlib9_14_2::_wn($__bfa, 0)); }; if ($@) { authlib9_14_2::_zq(277, "Database error.", "Database error. Error checking if record exists.", $@); } if ($__bfb) { if (exists $__bfb->{"sys_RespNum"}) { if ($__bfb->{"sys_RespNum"} == $__bfc) { $__bez = 1; } } } return $__bez; } sub _wy { my ($__bfd) = @_; $authlib9_14_2::_akh = $__bfd; $authlib9_14_2::_akj = $authlib9_14_2::_akh; if (exists $authlib9_14_2::_akn{"hid_test_db"}) { $authlib9_14_2::_akj = authlib9_14_2::_aem(); } } sub _wz { my ($__bfh) = @_; my $__bfe = ""; my $__bff = ref $__bfh; if ($__bff eq "ARRAY") { $__bfe .= "["; my $__bfg = 0; foreach $__bfg (@{$__bfh}) { $__bff = ref $__bfg; if ($__bff eq "ARRAY") { $__bfe .= "["; $__bfe .= join(",", @{$__bfg}); $__bfe .= "],"; } else { $__bfe .= $__bfg . ","; } } $__bfe =~ s/,$//; $__bfe .= "]"; } return $__bfe; } sub _xa { my ($__bfn, $__bfo, $__bfp, $__bfq) = @_; my $__bfi = 0; eval { require "Digest.pm"; $__bfi = Digest->new("MD5"); }; if ($@) { authlib9_14_2::_zq(0, "Unable to load Digest.pm<br/><br/>", $@, ""); } my $__bfj = 0; if (exists $authlib9_14_2::_akn{"hid_test_db"}) { $__bfj = 1; } $__bfi->add(0xFF02); $__bfi->add($__bfp); $__bfi->add($__bfo); $__bfi->add($__bfn); $__bfi->add($__bfq); $__bfi->add($authlib9_14_2::_akn{"hid_respnum"}); $__bfi->add($authlib9_14_2::_ajq); $__bfi->add($authlib9_14_2::_akh); $__bfi->add($__bfj); my $__bfk = $__bfi->digest(); my $__bfl = join(",", ($__bfp, $__bfo, $__bfn, $__bfq, $authlib9_14_2::_akn{"hid_respnum"}, $authlib9_14_2::_ajq, $authlib9_14_2::_akh, $__bfj)); my $__bfm = pack("V", 0xFF02) . $__bfk; $__bfm .= pack("V", length($__bfl)) . _xb($__bfl, $__bfk); return _xe($__bfm); } sub _xb { my ($__bfz, $__bga) = @_; my $__bfr = length($__bfz); my $__bfs = ""; my $__bft = 0; my $__bfu = length($__bga); for (; $__bft < $__bfr - $__bfu; $__bft += $__bfu) { $__bfs .= $__bga ^ substr($__bfz, $__bft, $__bfu); } my %__bfv = (0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F'); my $__bfw = ""; my $__bfx = 0; my @__bfy = (); if ($__bfr % $__bfu) { $__bfx = $__bfu - ($__bfr % $__bfu); @__bfy = ($__bfv{$__bfx}) x ($__bfx * 2); $__bfw = pack("H*", join("", @__bfy)); } $__bfs .= $__bga ^ ($__bfw . substr($__bfz, $__bft)); return $__bfs; } sub _xc { my ($__bgs) = @_; if ($__bgs !~ m/^(?:(?:[A-Z0-9_-]{4})*(?:[A-Z0-9_-]{2,3})?){1}$/io) { authlib9_14_2::_zq(304, "Page link is invalid.", "Page link is invalid: " . $__bgs, ""); } my $__bgb = _xf($__bgs); my $__bgc = unpack("V", $__bgb); my $__bgd = 0; my $__bge = 0; my $__bgf = 0; my $__bgg = 0; my $__bgh = 0; my $__bgi = ""; my $__bgj = 0; my $__bgk = 0; if ($__bgc == 0xFF01) { my $__bgl = substr($__bgb, 4, 16); my $__bgm = unpack("V", substr($__bgb, 20, 4)); my $__bgn = substr($__bgb, 24); my $__bgo = _xd($__bgn, $__bgm, $__bgl); ($__bgf, $__bge, $__bgd, $__bgg, $__bgh, $__bgj, $__bgi) = split(',', $__bgo); my $__bgp = 0; eval { require "Digest.pm"; $__bgp = Digest->new("MD5"); }; if ($@) { authlib9_14_2::_zq(0, "Unable to load Digest.pm<br/><br/>", $@, ""); } $__bgp->add(0xFF01); $__bgp->add($__bgf); $__bgp->add($__bge); $__bgp->add($__bgd); $__bgp->add($__bgg); $__bgp->add($__bgh); $__bgp->add($__bgj); $__bgp->add($__bgi); my $__bgq = $__bgp->digest; if ($__bgl != $__bgq) { my $__bgr = "Expected_digest=" . unpack('H*', $__bgl) . ", actual_digest=" . unpack("H*", $__bgq); $__bgr .= ", version=$__bgc, id=$__bgd, checksum=$__bge, timestamp=$__bgg, respnum=$__bgh, studyname=$__bgi, istestmode=$__bgf, previous=$__bgj"; authlib9_14_2::_zq(309, "URL values do not match expected values.", $__bgr, ""); } } elsif ($__bgc == 0xFF02) { my $__bgl = substr($__bgb, 4, 16); my $__bgm = unpack("V", substr($__bgb, 20, 4)); my $__bgn = substr($__bgb, 24); my $__bgo = _xd($__bgn, $__bgm, $__bgl); ($__bgf, $__bge, $__bgd, $__bgg, $__bgh, $__bgj, $__bgi, $__bgk) = split(',', $__bgo); my $__bgp = 0; eval { require "Digest.pm"; $__bgp = Digest->new("MD5"); }; if ($@) { authlib9_14_2::_zq(0, "Unable to load Digest.pm<br/><br/>", $@, ""); } $__bgp->add(0xFF02); $__bgp->add($__bgf); $__bgp->add($__bge); $__bgp->add($__bgd); $__bgp->add($__bgg); $__bgp->add($__bgh); $__bgp->add($__bgj); $__bgp->add($__bgi); $__bgp->add($__bgk); my $__bgq = $__bgp->digest; if ($__bgl != $__bgq) { my $__bgr = "Expected_digest=" . unpack('H*', $__bgl) . ", actual_digest=" . unpack("H*", $__bgq); $__bgr .= ", version=$__bgc, id=$__bgd, checksum=$__bge, timestamp=$__bgg, respnum=$__bgh, studyname=$__bgi, istestmode=$__bgf, previous=$__bgj, test_db=$__bgk"; authlib9_14_2::_zq(325, "URL values do not match expected values.", $__bgr, ""); } } else { authlib9_14_2::_zq(341, "Page link is invalid.", "Page link is invalid: " . $__bgs, ""); } return ($__bgc, $__bgd, $__bgi, $__bge, $__bgf, $__bgg, $__bgh, $__bgj, $__bgk); } sub _xd { my ($__bha, $__bhb, $__bhc) = @_; my $__bgt = length($__bhc); my $__bgu = 0; my $__bgv = ""; my $__bgw = $__bhb - $__bgt; if (!$__bha || $__bgw > 1000) { authlib9_14_2::_zq(342, "Page link is invalid.", "Page link is invalid.", ""); } for ($__bgu = 0; $__bgu < $__bgw; $__bgu += $__bgt) { $__bgv .= $__bhc ^ substr($__bha, $__bgu, $__bgt); } my %__bgx = (0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 'a' => 10, 'b' => 11, 'c' => 12, 'd' => 13, 'e' => 14, 'f' => 15, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15); my $__bgy = $__bhc ^ substr($__bha, $__bgu); if ($__bhb % $__bgt) { my $__bgz = unpack("H", substr($__bgy, 0, 1)); $__bgv .= substr($__bgy, $__bgx{$__bgz}); } else { $__bgv .= $__bgy; } return $__bgv; } sub _xe { require "MIME/Base64.pm"; return MIME::Base64::encode_base64url(shift, ""); } sub _xf { require "MIME/Base64.pm"; return MIME::Base64::decode_base64url(shift); } sub _xg { my $__bhd = @{$_[0]} - 1; my $__bhe = 0; if ($__bhd == 1) { if (rand() > 0.5) { ($_[0]->[0], $_[0]->[1]) = ($_[0]->[1], $_[0]->[0]); } } else { for (; $__bhd > 0; $__bhd--) { $__bhe = int(rand($__bhd + 1)); ($_[0]->[$__bhd], $_[0]->[$__bhe]) = ($_[0]->[$__bhe], $_[0]->[$__bhd]); } } } sub _xh { my ($__bhg) = @_; my $__bhf = ""; $__bhf .= "<script type=\"text/javascript\">\n"; $__bhf .= $__bhg; $__bhf .= "\n</script>\n"; return $__bhf; } sub _xi { my ($__bhr) = @_; my $__bhh = ""; my $__bhi = ""; my $__bhj = 0; my $__bhk = ""; foreach $__bhh (sort keys(%authlib9_14_2::_akn)) { $__bhi = $authlib9_14_2::_akn{$__bhh}; if (!$__bhr) { $__bhi =~ s/</ < /g; $__bhi =~ s/>/ > /g; } $__bhi =~ s/onbegin/on begin/ig; $__bhi =~ s/<(\s*)script/<$1 s c r i p t/ig; $__bhi =~ s/javascript/j a v a _ s c r i p t/ig; $__bhi =~ s/\[%/\[ %/ig; $authlib9_14_2::_akn{$__bhh} = $__bhi; if (!$__bhr && ref($__bhi) eq "ARRAY") { $__bhj = $__bhi; $__bhi = $__bhj->[0]; $authlib9_14_2::_akn{$__bhh} = $__bhi; my $__bhl = @{$__bhj}; my $__bhm = 0; my $__bhn = $__bhj->[0]; my $__bho = 0; for ($__bhm = 1; $__bhm < $__bhl; $__bhm++) { if ($__bhn ne $__bhj->[$__bhm]) { $__bho = 1; last; } } if ($__bho) { $__bhk .= "Found Null character in the %in hash. Key: " . $__bhh . " Value: " . join(" | ", @{$__bhj}); } } elsif (!$__bhr && $__bhi =~ m/\0/o) { my @__bhp = split("\0", $__bhi); my $__bhq = $__bhi; $__bhi = $__bhp[0]; $authlib9_14_2::_akn{$__bhh} = $__bhi; $__bhk .= "Found Null character in the %in hash (null in string). Key: " . $__bhh . " Value: " . $__bhq; } if ($__bhh eq "hid_respnum") { if ($__bhi !~ m/^\w{0,100},?\w{0,100}$/o) { authlib9_14_2::_zq(103, "", "Malformed respondent number input.", ""); } } elsif ($__bhh eq "hid_studyname") { if ($__bhi !~ m/^\w{0,50}$/o) { authlib9_14_2::_zq(104, "", "Malformed studyname input.", ""); } } elsif ($__bhh eq "hid_pagenum") { if ($__bhi !~ m/^\d{0,10}$/o) { authlib9_14_2::_zq(105, "", "Malformed page number input.", ""); } } elsif ($__bhh eq "hid_javascript") { if ($__bhi !~ m/^[0-1]$/o) { authlib9_14_2::_zq(106, "", "Malformed JavaScript flag input.", ""); } } elsif ($__bhh eq "hid_backup") { if ($__bhi !~ m/^[\w,]{0,100}$/o) { authlib9_14_2::_zq(107, "", "Malformed backup input.", ""); } } } return $__bhk; } sub _xj { my ($__bio, $__bip, $__biq, $__bir) = @_; my $__bhs = $authlib9_14_2::_akm->{"num_data_tables"}; my @__bht = (); my @__bhu = (); my $__bhv = 0; for ($__bhv = 0; $__bhv < $__bhs; $__bhv++) { push @__bht, []; push @__bhu, []; } my $__bhw = 0; my $__bhx = ""; my $__bhy = ""; my $__bhz = 0; my $__bia = 0; my $__bib = ""; my $__bic = ""; if (@{$__bio} > 0) { my @__bid = (); my @__bie = (); my @__bif = (); my @__big = (); my @__bih = (); my $__bii = ""; my %__bij = (); if (!$__biq) { my $__bik = time(); my $__bil = $__bik - authlib9_14_2::_ws("sys_StartTimeStamp"); push @{$__bio}, ["sys_EndTimeStamp", $__bik]; push @{$__bio}, ["sys_ElapsedTime", $__bil]; my $__bim = _aer(); if ($__bim > 0) { push @{$__bio}, ["sys_ScreenWidth", $__bim]; } } foreach $__bhz (@{$__bio}) { $__bhx = $__bhz->[0]; $__bhy = authlib9_14_2::_zo($__bhz->[1]); $__bib = ""; $__bij{$__bhx} = 1; if (exists $authlib9_14_2::_akn{"hid_loops"}) { $__bib = $__bhx; $__bib =~ s/(\.\d+)+//; } if ($__bhy eq "") { delete $authlib9_14_2::_akg->{$__bhx}; $__bhy = undef; if ($__bib) { delete $authlib9_14_2::_akg->{$__bib}; } } else { authlib9_14_2::_wt($__bhx, $__bhy); if ($__bib) { authlib9_14_2::_wt($__bib, $__bhy); } } ($__bia, $__bic) = _xk($__bhx); if ($__bia) { if (_xu($__bhx)) { push @{$__bhu[$__bia - 1]}, "`$__bhx`= coalesce(`$__bhx`, 0) + ?"; } else { push @{$__bhu[$__bia - 1]}, "`$__bhx`=?"; } push @{$__bht[$__bia - 1]}, _wh($__bhy); } else { authlib9_14_2::_zq(331, "Database error.", "Database error. Cannot find the field '" . $__bhx . "' in the map table.", $@); } } for ($__bhv = 0; $__bhv < $__bhs; $__bhv++) { @__big = @{$__bhu[$__bhv]}; @__bif = @{$__bht[$__bhv]}; if (@__bif) { if ($__bir) { my @__bin = @{$__bip}; eval { $__bii = "UPDATE `" . $authlib9_14_2::_akj . "_data" . ($__bhv + 1) . "` SET " . join(",", @__big) . " WHERE `sys_RespNum` IN (" . join(",", ("?") x scalar @__bin) . ");"; my $__bhw = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bii, 0)); $__bhw->execute(@__bif, @__bin); }; } else { eval { $__bii = "UPDATE `" . $authlib9_14_2::_akj . "_data" . ($__bhv + 1) . "` SET " . join(",", @__big) . " WHERE `sys_RespNum` = " . $__bip; my $__bhw = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bii, 0)); $__bhw->execute(@__bif); }; } if ($@) { authlib9_14_2::_zq(240, "Database error.", "Database error. Cannot update data row.", $@); } } } $authlib9_14_2::_ake->commit(); } } sub _xk { my ($__bja) = @_; my $__bis = 0; my $__bit = ""; my @__biu = (); my $__biv = ""; if (exists $authlib9_14_2::_ahu->{$__bja}) { $__bis = $authlib9_14_2::_ahu->{$__bja}; push @__biu, $__bja; } else { my $__biw = ""; if ($__bja eq "sys_RespNum") { $__bis = 1; } else { $__biw = "SELECT * FROM `" . $authlib9_14_2::_akj . "_map` WHERE `name` = '" . $__bja . "'"; eval { my @__bix = $authlib9_14_2::_ake->selectrow_array(authlib9_14_2::_wn($__biw, 0)); if (@__bix) { $__bis = $__bix[0]; $__bit = $__bix[2]; } }; if ($@) { authlib9_14_2::_zq(261, "Database error.", "Database error. Cannot select map row.", $@); } } if ($__bis) { if ($__bit) { $__biw = "SELECT * FROM `" . $authlib9_14_2::_akj . "_map` WHERE `base_name` = '" . $__bit. "' AND `table` = " . $__bis; eval { my $__biy = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__biw, 0)); my $__biz = 0; foreach $__biz (@{$__biy}) { $__bis = $__biz->[0]; $__bja = $__biz->[1]; $authlib9_14_2::_ahu->{$__bja} = $__bis; push @__biu, $__bja; } }; if ($@) { authlib9_14_2::_zq(340, "Database error.", "Database error. Cannot select map row.", $@); } } else { push @__biu, $__bja; $authlib9_14_2::_ahu->{$__bja} = $__bis; } } else { $authlib9_14_2::_ahu->{$__bja} = 0; } } $__biv = "`" . join("`,`", @__biu) . "`"; return ($__bis, $__biv); } sub _xl { my ($__bjf) = @_; my $__bjb = 0; my $__bjc = "SELECT * FROM `" . $authlib9_14_2::_akj . "_map` WHERE `name` LIKE '" . $__bjf . ".%'"; my $__bjd = 0; eval { my @__bje = $authlib9_14_2::_ake->selectrow_array(authlib9_14_2::_wn($__bjc, 0)); if (@__bje) { $__bjb = 1; } }; if ($@) { authlib9_14_2::_zq(347, "Database error.", "Database error. Cannot select map row.", $@); } return $__bjb; } sub _xm { my ($__bjm, $__bjn) = @_; my $__bjg = 0; my $__bjh = ""; my $__bji = ""; my @__bjj = (); my $__bjk = ""; my $__bjl = 0; eval { $__bjk = "INSERT INTO `" . $authlib9_14_2::_akj . "_clists` (`sys_RespNum`,`list_name`,`value`) VALUES (?, ?, ?)"; $__bjl = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bjk, 0)); }; if ($@) { authlib9_14_2::_zq(253, "Database error.", "Database error. Cannot prepare SQL for inserting clist row.", $@); } foreach $__bjg (@{$__bjm}) { $__bjh = $__bjg->[0]; $__bji = $__bjg->[1]; authlib9_14_2::_wt($__bjh, $__bji); eval { $__bjl->execute($__bjn, $__bjh, authlib9_14_2::_wh($__bji)); }; if ($@) { push @__bjj, $__bjg; } } if (@__bjj) { eval { $__bjk = "UPDATE `" . $authlib9_14_2::_akj . "_clists` SET `value` = ? WHERE `sys_RespNum` = ? AND `list_name` = ?"; $__bjl = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bjk, 0)); }; if ($@) { authlib9_14_2::_zq(315, "Database error.", "Database error. Cannot prepare SQL for updating clist row.", $@); } } foreach $__bjg (@__bjj) { $__bjh = $__bjg->[0]; $__bji = $__bjg->[1]; authlib9_14_2::_wt($__bjh, $__bji); eval { $__bjl->execute(authlib9_14_2::_wh($__bji), $__bjn, $__bjh); }; if ($@) { authlib9_14_2::_zq(316, "Database error.", "Database error. Cannot update clist row.", $@); } } eval { $authlib9_14_2::_ake->commit(); }; if ($@) { authlib9_14_2::_zq(317, "Database error.", "Database error. Cannot insert clist row.", $@); } } sub _xn { my ($__bjx, $__bjy) = @_; my @__bjo = (); my @__bjp = (); my @__bjq = reverse @{authlib9_14_2::_xy($__bjx, {'limbo' => 0})}; my @__bjr = sort {$__bjy->{$a} <=> $__bjy->{$b}} keys %{$__bjy}; my $__bjs = shift(@__bjr); my $__bjt = 0; my $__bju = 0; my $__bjv = 0; my $__bjw = 1; while ($__bjw && $__bjs) { $__bjw = 0; for ($__bjt = 0; $__bjt < @__bjq; $__bjt++) { if (&authlib9_14_2::_ANA) { next if ($__bjq[$__bjt]->{"quest_name"} eq "hid_page_vars_history" || $__bjq[$__bjt]->{"page_num"} == 1); } else { next if ($__bjq[$__bjt]->{"quest_name"} eq "hid_page_vars_history"); } last if ($__bjq[$__bjt]->{"quest_name"} eq $__bjs || exists $__bjq[$__bjt]->{"data"}->{$__bjs}); } $__bjv = $__bjt; $__bju = 0; for ($__bjt++; $__bjt < @__bjq; $__bjt++) { if (&authlib9_14_2::_ANA) { next if ($__bjq[$__bjt]->{"quest_name"} eq "hid_page_vars_history" || $__bjq[$__bjt]->{"page_num"} == 1); } else { next if ($__bjq[$__bjt]->{"quest_name"} eq "hid_page_vars_history"); } if ($__bjq[$__bjt]->{"quest_name"} eq $__bjs || exists $__bjq[$__bjt]->{"data"}->{$__bjs}) { $__bju = _xo($__bjq[$__bjv]->{"data"}, $__bjq[$__bjt]->{"data"}); if ($__bju) { eval { $__bjw = 1; do { $authlib9_14_2::_ake->do(authlib9_14_2::_wn("UPDATE `" . $authlib9_14_2::_akj . "_history` SET `limbo`=1 WHERE `sys_RespNum`=" . $__bjx . " AND `hop`=" . $__bjq[$__bjv]->{"hop"}, 0)); $__bjs = shift(@__bjr); splice(@__bjq, $__bjv, 1); $__bjv--; } while ($__bjs =~ m/^(?>sys|hid)_/io && $__bjv >= 0); $authlib9_14_2::_ake->commit(); last; }; if ($@) { authlib9_14_2::_zq(311, "Unable to update history row", $@, ""); } } else { @__bjp = (($__bjv + 1)..$__bjt); } last; } } if (@__bjp) { _xp($__bjx, \@__bjq, \@__bjp); last; } } } sub _xo { my ($__bkf, $__bkg) = @_; my $__bjz = 1; my @__bka = keys %{$__bkf}; my @__bkb = keys %{$__bkg}; my $__bkc = ""; my $__bkd = ""; my $__bke = ""; if (@__bka == @__bkb) { foreach $__bke (@__bka) { if ($__bkf->{$__bke} ne $__bkg->{$__bke}) { $__bjz = 0; last; } } } else { $__bjz = 0; } return $__bjz; } sub _xp { my ($__bkz, $__bla, $__blb) = @_; my @__bkh = @{$__bla}; my @__bki = @{$__blb}; my @__bkj = (); my $__bkk = $authlib9_14_2::_akm->{"num_data_tables"}; my $__bkl = 0; my $__bkm = 0; my $__bkn = ""; my $__bko = ""; my %__bkp = (); _acw(); if ($authlib9_14_2::_alk && @__bki > 0) { while (my ($__bkq, $__blc) = each %{$authlib9_14_2::_alk}) { if (ref($__blc) eq "CList") { $__bkp{$__bkq} = 1; $__bkp{$__bkq . "_others"} = 1; } } $__bkm = 0; while ($__bkm < @__bki) { my $__bkq = $__bkh[$__bki[$__bkm]]->{"quest_name"}; $__bkq =~ s/^(\w+)(?:\.\d+)*$/$1/o; if (exists $__bkp{$__bkq}) { push(@__bkj, $__bki[$__bkm]); splice(@__bki, $__bkm, 1); } else { $__bkm++; } } } if (@__bki > 0) { my @__bkr = (); my @__bks = (); my @__bkt = (); for ($__bkm = 0; $__bkm < $__bkk; $__bkm++) { push @__bkr, []; push @__bkt, {}; } foreach my $__bku (@__bki) { my $__bkv = $__bkh[$__bku]; if (&authlib9_14_2::_ANA) { next if ($__bkv->{"quest_name"} eq "hid_page_vars_history" || _xu($__bkv->{"quest_name"}) || $__bkv->{"page_num"} == 1); } else { next if ($__bkv->{"quest_name"} eq "hid_page_vars_history" || _xu($__bkv->{"quest_name"})); } foreach my $__bkw (sort keys %{$__bkv->{"data"}}) { ($__bkl, $__bkn) = _xk($__bkw); if ($__bkl == 0 || exists $__bkt[$__bkl - 1]->{$__bkw}) { next; } $__bkt[$__bkl - 1]->{$__bkw} = 1; $authlib9_14_2::_aht->{$__bkw} = 1; push @{$__bkr[$__bkl - 1]}, "`" . $__bkw . "`=null"; } } foreach my $__bku (@__bki) { my $__bkv = $__bkh[$__bku]; push (@__bks, "UPDATE `" . $authlib9_14_2::_akj . "_history` SET `limbo`=1 WHERE `sys_RespNum`=" . $__bkz . " AND `hop`=" . $__bkv->{"hop"}); } for ($__bkm = 0; $__bkm < $__bkk; $__bkm++) { my @__bkx = @{$__bkr[$__bkm]}; if (@__bkx) { eval { $__bko = "UPDATE `" . $authlib9_14_2::_akj . "_data" . ($__bkm + 1) . "` SET " . join(",", @__bkx) . " WHERE `sys_RespNum` = " . $__bkz; $authlib9_14_2::_ake->do(authlib9_14_2::_wn($__bko, 0)); }; if ($@) { authlib9_14_2::_zq(203, "Database error.", "Database error. Cannot update data row. SQL: " . $__bko, $@); } } } eval { foreach $__bko (@__bks) { $authlib9_14_2::_ake->do(authlib9_14_2::_wn($__bko, 0)); } }; if ($@) { authlib9_14_2::_zq(272, "Database error.", "Database error. Cannot update history row.", $@); } } foreach my $__bky (@__bkj) { my $__bkv = $__bkh[$__bky]; $__bko = "UPDATE `" . $authlib9_14_2::_akj . "_history` SET `limbo`=1 WHERE `sys_RespNum`=" . $__bkz . " AND `hop`=" . $__bkv->{"hop"}; $authlib9_14_2::_ake->do(authlib9_14_2::_wn($__bko, 0)); $__bko = "DELETE FROM `" . $authlib9_14_2::_akj . "_clists` WHERE `sys_RespNum`=" . $__bkz . " AND `list_name`='" . $__bkv->{"quest_name"}. "'"; $authlib9_14_2::_ake->do(authlib9_14_2::_wn($__bko, 0)); $authlib9_14_2::_aht->{$__bkv->{"quest_name"}} = 1; } $authlib9_14_2::_ake->commit(); } sub _xq { my ($__bln) = @_; my $__bld = 0; my $__ble = ""; my $__blf = ""; my $__blg = 0; my $__blh = ""; eval { my $__bli = 1; my $__blj = $authlib9_14_2::_akj . "_info"; if ($authlib9_14_2::_ahn->{'_pj'} eq "odbc") { $__blh = "SELECT OBJECT_ID('" . $__blj . "')"; my $__blk = $authlib9_14_2::_ake->selectrow_arrayref(authlib9_14_2::_wn($__blh, 0)); if (!$__blk->[0]) { $__bli = 0; } } $authlib9_14_2::_akm = 0; if ($__bli) { $__blh = "SELECT * FROM `" . $__blj . "`"; $authlib9_14_2::_akm = $authlib9_14_2::_ake->selectrow_hashref(authlib9_14_2::_wn($__blh, 0)); $authlib9_14_2::_akm->{"study_path"} = authlib9_14_2::_wi($authlib9_14_2::_akm->{"study_path"}); $authlib9_14_2::_akm->{"close_survey_msg"} = authlib9_14_2::_wi($authlib9_14_2::_akm->{"close_survey_msg"}); } }; if ($@ || $authlib9_14_2::_akm == 0) { $__blf = "Cannot read database info table."; $__ble = $@; } else { if (exists($ENV{'SSI_NO_PATH_CHECK'}) || (defined ($ENV{'SSI_NO_PATH_CHECK'}))) { $__bld = 1; } elsif (exists $authlib9_14_2::_akm->{"study_path"}) { my $__bll = $authlib9_14_2::_akm->{"study_path"}; my $__blm = $authlib9_14_2::_ahv{'_aml'}; if (authlib9_14_2::_zc()) { $__bll = uc($__bll); $__blm = uc($__blm); } if (!$__bln && ($__bll eq $__blm)) { $__bld = 1; } else { if ($__bln) { $__blf .= "Error reading QST file. Entering setup mode...\n\n"; } $__blf .= "There are already database tables setup for \"" . $authlib9_14_2::_akj . "\" in this database."; $__blf .= " Either remove the \"" . $authlib9_14_2::_akj . "\" tables in this database or create a new database for this study."; $__blf .= "\n\n(Note: Another possibility is that the original path to the admin directory has changed. See the \"study_path\" column in the \"" . $authlib9_14_2::_akj . "_info\" table.)"; $__blg = 1; } } } return ($__bld, $__blf, $__ble, $__blg); } sub _xr { eval { my $__blo = "UPDATE `" . $authlib9_14_2::_akj . "_info` SET `close_survey` = 1"; $authlib9_14_2::_ake->do(authlib9_14_2::_wn($__blo, 0)); $authlib9_14_2::_ake->commit(); $authlib9_14_2::_akm->{"close_survey"} = 1; }; if ($@) { authlib9_14_2::_zq(219, "Database error.", "Database error. Error closing survey.", $@); } } sub _xs { my $__blp = {}; if (exists($ENV{'SSI_DATABASE_PASSWORD'})) { my @__blq = ("database_password", "database_username", "database_type", "database_address", "database_name", "database_port", "database_driver", "database_max_fields_table", "respnum_start"); $__blp->{"database_username"} = ""; $__blp->{"database_password"} = ""; $__blp->{"database_type"} = "mysql"; $__blp->{"database_address"} = "localhost"; $__blp->{"database_name"} = ""; $__blp->{"database_port"} = ""; foreach my $__blr (@__blq) { my $__bls = "SSI_" . uc($__blr); if (exists($ENV{$__bls})) { $__blp->{$__blr} = $ENV{$__bls}; } } } else { $__blp = _xt(); } return $__blp; } sub _xt { my %__blt = (); my $__blu = $authlib9_14_2::_ahv{'_aml'} . $authlib9_14_2::_akh . "_config.cgi"; my $__blv = ""; my $__blw = ""; my ($__bma, $__bmb) = authlib9_14_2::_yg($__blu, "read", 0, 1); my $__blx = _yb($__bma); close $__bma; my $__bly = ""; my $__blz = ""; while ($__blx =~ m/^(.*?):(.*?)$/mg) { $__bly = authlib9_14_2::_zo($1); $__blz = authlib9_14_2::_zo($2); $__blt{$__bly} = $__blz; } return \%__blt; } sub _xu { my ($__bmc) = @_; return ($__bmc eq "sys_SumPageTimes" || $__bmc =~ m/^sys_pagetime_\d+/i); } sub _xv { my ($__bnf, $__bng, $__bnh, $__bni) = @_; my $__bmd = ""; my $__bme = 0; eval { $__bmd = "SELECT MAX(hop) FROM `" . $authlib9_14_2::_akj . "_history` WHERE `sys_RespNum`=" . $__bng; ($__bme) = $authlib9_14_2::_ake->selectrow_array(authlib9_14_2::_wn($__bmd, 0)); }; if ($@) { authlib9_14_2::_zq(273, "Database error.", "Database error. Cannot get history row.", $@); } $__bme++; $__bmd = "INSERT INTO `" . $authlib9_14_2::_akj . "_history` (`ipaddress`,`user_agent`,`timestamp`,`qst_version`,`quest_name`,`quest_version`,`page_num`,`limbo`,`data`,`sys_RespNum`,`hop`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; my $__bmf = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bmd, 0)); $__bmd = "UPDATE `". $authlib9_14_2::_akj ."_history` SET `ipaddress`=?,`user_agent`=?,`timestamp`=?,`qst_version`=?,`quest_name`=?,`quest_version`=?,`page_num`=?,`limbo`=?,`data`=? WHERE `sys_RespNum`=? AND `hop`=?"; my $__bmg = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bmd, 0)); my @__bmh = (); my $__bmi = ""; my $__bmj = ""; my @__bmk = @{$__bnf}; my $__bml = time(); my $__bmm = $authlib9_14_2::_akm->{"qst_version"}; my $__bmn = ""; my %__bmo = (); my $__bmp = 0; my $__bmq = ""; if (exists $authlib9_14_2::_akp->{'_gh'}) { $__bmn = _aac(); } my $__bmr = ""; if (exists $authlib9_14_2::_akp->{'_pr'}) { $__bmr = _wh(_aab()); } foreach my $__bms (grep(/hid_prev_/, sort keys %authlib9_14_2::_akn)) { my ($__bnj, $__bnk, $__bmt, $__bnl) = split(",", $authlib9_14_2::_akn{$__bms}); push(@__bmh, {hop => $__bnj, quest_name => $__bnk, quest_version => $__bnl, page_num => $__bmt}); } my $__bmt = 0; my $__bmu = ""; my $__bmv = ""; my $__bmw = ""; if (not $__bnh) { foreach my $__bmx (sort {$a->{"hop"} <=> $b->{"hop"}} @__bmh) { $__bmj = ""; ($__bmi, $__bmv, $__bmw) = _abt($__bmx->{"quest_name"}); for (my $__bmy = 0; $__bmy < @__bmk; $__bmy++) { ($__bmu, $__bmv, $__bmw) = _abt($__bmk[$__bmy]->[0]); if ($__bmu eq $__bmi) { $__bmj .= "'" . $__bmk[$__bmy]->[0] . "' => "; my $__bmz = ""; if (exists $authlib9_14_2::_akn{$__bmu . "_" . $__bmv}) { $__bmz = $authlib9_14_2::_akn{$__bmu . "_" . $__bmv}; } elsif (exists $authlib9_14_2::_akn{$__bmi}) { $__bmz = $authlib9_14_2::_akn{$__bmi}; } else { $__bmz = $__bmk[$__bmy]->[1]; } $__bmz = _xx($__bmz); $__bmj .= $__bmz . ","; splice(@__bmk, $__bmy, 1); $__bmy--; } } chop($__bmj); $__bmt = $__bmx->{"page_num"}; if (not exists $__bmo{$__bmx->{"quest_name"}} && !_xu($__bmx->{"quest_name"}) ) { $__bmo{$__bmx->{"quest_name"}} = $__bmp++; } eval { $__bmf->execute($__bmn, $__bmr, $__bml, $__bmm, $__bmx->{"quest_name"}, $__bmx->{"quest_version"}, $__bmx->{"page_num"}, 0, _wh("{" . $__bmj . "}"), $__bng, $__bme); $__bme++; }; if ($@) { my $__bna = @_; eval { $__bmg->execute($__bmn, $__bmr, $__bml, $__bmm, $__bmx->{"quest_name"}, $__bmx->{"quest_version"}, $__bmx->{"page_num"}, 0, _wh("{" . $__bmj . "}"), $__bng, $__bme); }; if ($@) { $__bmf->finish; $__bmg->finish; authlib9_14_2::_zq(274, "Database error.", "Database error. Cannot insert or update history row.", $__bna ."\t". $@); } } } } if ($__bmt == 0) { foreach my $__bnb (@__bmk) { my ($__bmu, $__bmv, $__bmw) = _abt($__bnb->[0]); my $__bnc = $authlib9_14_2::_ahp{$__bmu}; if ($__bnc) { $__bmt = $__bnc->{'_ji'}; last; } } if ($__bmt == 0) { $__bmt = $authlib9_14_2::_akn{"hid_pagenum"}; } } foreach my $__bnb (@__bmk) { my $__bmz = $__bnb->[1]; $__bmz = _xx($__bmz); $__bmj = "'" . $__bnb->[0] . "' => " . $__bmz; if (!exists $__bmo{$__bnb->[0]} && !_xu($__bnb->[0])) { $__bmo{$__bnb->[0]} = $__bmp++; } eval { $__bmf->execute($__bmn, $__bmr, $__bml, $__bmm, $__bnb->[0], "0", $__bmt, 0, _wh("{" . $__bmj . "}"), $__bng, $__bme); $__bme++; }; if ($@) { my $__bna = $@; eval { $__bmg->execute($__bmn, $__bmr, $__bml, $__bmm, $__bnb->[0], "0", $__bmt, 0, _wh("{" . $__bmj . "}"), $__bng, $__bme); }; if ($@) { $__bmf->finish; $__bmg->finish; authlib9_14_2::_zq(274, "Database error.", "Database error. Cannot insert or update history row.", $__bna ."\t". $@); } } } if (exists $authlib9_14_2::_akn{"hid_page_vars"}) { $__bmj = ""; my @__bnd = split(/,/, $authlib9_14_2::_akn{"hid_page_vars"}); foreach my $__bne (@__bnd) { $__bmj .= "'" . $__bne . "' => "; my $__bmz = ""; if (exists $authlib9_14_2::_akn{$__bne}) { $__bmz = $authlib9_14_2::_akn{$__bne}; } $__bmz = _xx($__bmz); $__bmj .= $__bmz . ","; } chop($__bmj); eval { $__bmf->execute($__bmn, $__bmr, $__bml, $__bmm, "hid_page_vars_history", "0", $__bmt, 0, _wh("{" . $__bmj . "}"), $__bng, $__bme); $__bme++; }; if ($@) { my $__bna = $@; eval { $__bmg->execute($__bmn, $__bmr, $__bml, $__bmm, "hid_page_vars_history", "0", $__bmt, 0, _wh("{" . $__bmj . "}"), $__bng, $__bme); }; if ($@) { $__bmf->finish; $__bmg->finish; authlib9_14_2::_zq(274, "Database error.", "Database error. Cannot insert or update history row.", $__bna ."\t". $@); } } } $__bmf->finish; $__bmg->finish; unless ($__bni) { _xn($__bng, \%__bmo); } $authlib9_14_2::_ake->commit(); $authlib9_14_2::_akn{"sys_next_hop"} = $__bme; } sub _xw { my ($__bnv, $__bnw) = @_; my @__bnm = @{$__bnv}; my $__bnn = 0; my $__bno = 0; while ($__bno < @__bnm) { my $__bnp = $__bnm[$__bno]->[0]; my $__bnq = $__bnm[$__bno]->[1]; my @__bnr = (); eval { my $__bns = "SELECT * FROM `" . $authlib9_14_2::_akj . "_history` WHERE `sys_RespNum`=" . $__bnw . " AND `quest_name`='" . $__bnp . "' AND `quest_version`!='0' AND `limbo`=0 ORDER BY `hop` DESC"; @__bnr = @{$authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__bns, 0), { Slice => {} })}; }; if ($@) { authlib9_14_2::_zq(282, "Database error.", "Database error. Cannot retrieve history row.", $@); } if (@__bnr) { $__bnn = 1; my $__bnt = authlib9_14_2::_xx($__bnq); eval { my $__bns = "UPDATE `" . $authlib9_14_2::_akj . "_history` SET `data`=? WHERE `sys_RespNum`=" . $__bnw . " AND `hop`=" . $__bnr[0]->{"hop"}; my $__bnu = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__bns, 0)); $__bnu->execute(_wh("{'" . $__bnp. "' => " . $__bnt . "}")); splice(@__bnm, $__bno, 1); }; if ($@) { authlib9_14_2::_zq(283, "Database error.", "Database error. Cannot update history row.", $@); } } else { $__bno++; } } if ($__bnn) { $authlib9_14_2::_ake->commit(); } if (@__bnm) { authlib9_14_2::_xv(\@__bnm, $__bnw, 1, 0); } } sub _xx { my ($__bnx) = @_; $__bnx =~ s/\\/\\\\/go; $__bnx =~ s/'/\\'/go; if ($__bnx eq "") { $__bnx = "''"; } else { $__bnx = "'" . $__bnx . "'"; } return $__bnx; } sub _xy { my ($__bof, $__bog) = @_; my %__bny = $__bog ? %{$__bog} : (); my $__bnz = delete $__bny{"data"}; my $__boa = "SELECT * FROM `" . $authlib9_14_2::_akj . "_history` WHERE `sys_RespNum`=" . $__bof; if (keys %__bny) { while (my ($__boh, $__boi) = each %__bny) { $__boa .= " AND "; $__boa .= "`" . $__boh . "`="; $__boa .= $authlib9_14_2::_ake->quote($__boi); } } $__boa .= " ORDER BY `hop` ASC"; my $__bob = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__boa, 0)); my @__boc = (); eval { $__bob->execute(); }; if ($@ && !$authlib9_14_2::_amg) { authlib9_14_2::_zq(206, "Database error while retrieving history.", $authlib9_14_2::_ake->errstr, $@); } my @__bod = @{$__bob->fetchall_arrayref({})}; foreach my $__boe (@__bod) { next if (keys %{$__boe} == 1); eval { $__boe->{"data"} = eval(_wi($__boe->{"data"})); }; if ($@) { authlib9_14_2::_zq(278, "Database error while retrieving history.", "Database error while evaling history.", $@); } if ($__bnz) { push(@__boc, $__boe) if (exists $__boe->{"data"}->{$__bnz}); } else { push(@__boc, $__boe); } } return \@__boc; } sub _xz { my $__boj = $authlib9_14_2::_akn{"hid_respnum"}; my $__bok = 0; my $__bol = 0; if (exists $authlib9_14_2::_akn{"sys_next_hop"} && $authlib9_14_2::_akn{"sys_next_hop"} > 0) { $__bol = $authlib9_14_2::_akn{"sys_next_hop"}; } elsif (exists $authlib9_14_2::_akn{"sys_prev_low_hop"} && $authlib9_14_2::_akn{"sys_prev_low_hop"} > 0) { $__bol = $authlib9_14_2::_akn{"sys_prev_low_hop"}; } else { my @__bom = (); foreach my $__bon (grep(/hid_prev_/, (sort keys %authlib9_14_2::_akn))) { my ($__boq,$__bor, $__bos, $__bot) = split(",", $authlib9_14_2::_akn{$__bon}); push(@__bom, [ $__bor, $__boq ]); } @__bom = sort {$a->[1] <=> $b->[1]} @__bom; $__bol = $__bom[0]->[1]; } my $__boo = "SELECT COUNT(*) FROM `" . $authlib9_14_2::_akj . "_history` WHERE `sys_RespNum`=" . $__boj . " AND `limbo` = 0 AND `quest_version` != '0' AND `hop` <= " . $__bol; eval { my $__bop = $authlib9_14_2::_ake->selectrow_arrayref(authlib9_14_2::_wn($__boo, 0)); $__bok = $__bop->[0]; }; if ($@ && !$authlib9_14_2::_amg) { authlib9_14_2::_zq(252, "Database error while retrieving history.", $authlib9_14_2::_ake->errstr, $@); } return $__bok; } sub _ya { my ($__bow) = @_; my $__bou = 0; if ($authlib9_14_2::_amg) { if (!$authlib9_14_2::_ajf) { $__bou = $authlib9_14_2::_akp->{'_kc'}; } } elsif ($__bow == 2) { if (!exists $authlib9_14_2::_akp->{'_nt'}) { my $__bov = _ws("sys_ShowPrev"); if (exists $authlib9_14_2::_akn{"hid_test_mode_settings"} || exists $authlib9_14_2::_akn{"hid_show_prev"} || $__bov) { $__bou = $authlib9_14_2::_akp->{'_kc'}; } } } elsif ($__bow > 2) { $__bou = $authlib9_14_2::_akp->{'_kc'}; } return $__bou; } sub _yb { my ($__bpb) = @_; binmode $__bpb; my $__box = -s $__bpb; my $__boy = tell $__bpb; my $__boz = ""; my $__bpa = read($__bpb, $__boz, $__box); if ($__bpa != ($__box - $__boy)) { authlib9_14_2::_zq(270, "File read error.", "File read error.", ""); } return $__boz; } sub _yc { my ($__bpc, $__bpd) = @_; return do { local $/ = $__bpd; <$__bpc> }; } sub _yd { my ($__bpe) = @_; return do {local $/; <$__bpe> }; } sub _ye { my ($__bpg) = @_; my $__bpf = 0; if (&authlib9_14_2::_ANL <= $__bpg && $__bpg <= &authlib9_14_2::_ANO) { $__bpf = 1; } return $__bpf; } sub _yf { my ($__bpi) = @_; my $__bph = 0; if (&authlib9_14_2::_ANY <= $__bpi && $__bpi <= &authlib9_14_2::_AOD) { $__bph = 1; } return $__bph; } sub _yg { my ($__bpp, $__bpq, $__bpr, $__bps) = @_; my $__bpj = Symbol::gensym(); my $__bpk = ""; my $__bpl = ""; my $__bpm = ""; if ($__bpq eq "write") { $__bpk = ">"; } elsif ($__bpq eq "read") { $__bpk = "<"; } elsif ($__bpq eq "update") { $__bpk = "+<"; } elsif ($__bpq eq "create_update") { $__bpk = "+>"; } elsif ($__bpq eq "append") { $__bpk = ">>"; } else { die("Unrecognized parameter in OpenFile() with: " . $__bpp); } my $__bpn = 0; my $__bpo = 0; open $__bpj, $__bpk . $__bpp or eval{$__bpn = 1}; if ($__bpn) { $__bpl = "Can't open file " . $__bpp . "."; $__bpm = $!; if ($__bps) { authlib9_14_2::_zq(117, "File open error.", $__bpl, $__bpm); } else { $__bpo = {}; $__bpo->{'_amm'} = $__bpl; $__bpo->{'_amn'} = $__bpm; } } return ($__bpj, $__bpo); } sub _yh { my ($__bpu) = @_; if (!exists $authlib9_14_2::_aiy{$__bpu}) { my $__bpt = ""; if (!(-e $authlib9_14_2::_aiz . "/" . $__bpu)) { $__bpt = "Cannot find library in " . $authlib9_14_2::_aiz; } eval { require $__bpu; if ($__bpu eq "acalib9_14_2.pl") { acalib9_14_2::_arh(); } elsif ($__bpu eq "acbclib9_14_2.pl") { acbclib9_14_2::_bhi(); } }; if ($@) { $__bpt = $@; } if ($__bpt ne "") { print "Content-type: text/html\r\n\r\n"; print "<html><body><br><span style=\"color: red;\"><u>Error:</u> &nbsp;</span> "; print "Cannot load library: <span style=\"color: blue;\">" . $__bpu . "</span> <br><br>" . $__bpt; print "</body></html>"; exit(); } else { $authlib9_14_2::_aiy{$__bpu} = 1; } } } sub _yi { my ($__bpx) = @_; my $__bpv = ""; if ($authlib9_14_2::_akp && exists $authlib9_14_2::_akp->{'_dn'}) { $__bpv .= $authlib9_14_2::_akp->{'_dn'}; } else { $__bpv .= "<!DOCTYPE html>"; } $__bpv .= "\n<html"; if (exists($authlib9_14_2::_akn{"hid_test_mode"})) { $__bpv .= " class=\"test_mode"; if (exists($authlib9_14_2::_akn{"hid_test_frame"})) { $__bpv .= " test_frame"; } $__bpv .= "\""; } $__bpv .= ">\n"; $__bpv .= "<head>\n\n"; $__bpv .= "<!-- Sawtooth Software Web Interviewing System - Lighthouse Studio " . $authlib9_14_2::_aia . " -->\n"; $__bpv .= "<!-- Copyright Sawtooth Software, Inc. 1998-2022 - www.sawtoothsoftware.com - USA - (801) 477-4700 -->\n\n"; my $__bpw = $authlib9_14_2::_ahv{'_ur'} . "system/"; if ($__bpx) { $__bpw .= "ssi.ico"; } else { $__bpw .= "survey.ico"; } $__bpv .= "<link rel=\"shortcut icon\" href=\"" . $__bpw . "\" type=\"image/x-icon\">\n"; if ($authlib9_14_2::_akp && exists $authlib9_14_2::_akp->{'_mg'}) { } else { $__bpv .= "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"; $__bpv .= "<meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\">\n"; $__bpv .= "<meta name=\"robots\" content=\"noindex, nofollow\">\n\n"; $__bpv .= "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"; if ($authlib9_14_2::_amg || exists $authlib9_14_2::_akn{"hid_test_mode"}) { $__bpv .= "<meta http-equiv=\"Cache-Control\" content=\"no-cache, no-store, must-revalidate\"/>\n"; $__bpv .= "<meta http-equiv=\"Pragma\" content=\"no-cache\" />\n"; $__bpv .= "<meta http-equiv=\"Expires\" content=\"0\" />\n"; } } return $__bpv; } sub _yj { my $__bpy = ""; my $__bpz = ""; $__bpy .= "<div id=\"demo_header\">"; $__bpy .= "<div id=\"demo_title\">Sawtooth Software - Demo Version</div>"; $__bpy .= "<div id=\"demo_warning\">NOTE: The demo version is limited to 10 respondent data records</div>"; $__bpy .= "</div>"; return $__bpy; } sub _yk { my $__bqa = lite::new(); %authlib9_14_2::_akn = $__bqa->parse_new_form_data(); if ($authlib9_14_2::_akn{'hid_studyname'} =~ m/\W/g) { authlib9_14_2::_zq(327, "Access error.", "The studyname passed in contains invalid characters.", "", 0); } } sub _yl { my ($__bqi, $__bqj, $__bqk, $__bql) = @_; my $__bqb = 0; my $__bqc = ""; my $__bqd = ""; my $__bqe = ""; my $__bqf = ""; if ($__bqk) { no strict; open($authlib9_14_2::_ajm, '<', \$__bqk); } elsif ($__bql) { ($authlib9_14_2::_ajm, $__bqb) = authlib9_14_2::_yg($__bql, "read", 1, $__bqj); } else { my $__bqg = $authlib9_14_2::_ahv{'_aml'} . $authlib9_14_2::_akh . "_qst.cgi"; ($authlib9_14_2::_ajm, $__bqb) = authlib9_14_2::_yg($__bqg, "read", 1, $__bqj); } if (!$__bqb) { binmode $authlib9_14_2::_ajm; seek $authlib9_14_2::_ajm, 0, 0; ($__bqc, $__bqd, $__bqe, $__bqb) = _ym($authlib9_14_2::_ajm, $__bqj, 0); if (!$authlib9_14_2::_amg && $authlib9_14_2::_akm) { $authlib9_14_2::_akm->{"qst_version"} = $__bqc; } if (!$__bqb) { ($authlib9_14_2::_aik, $authlib9_14_2::_aih, $authlib9_14_2::_aja, $authlib9_14_2::_ajd, $authlib9_14_2::_aii, $authlib9_14_2::_aij, $authlib9_14_2::_ail) = _yn($authlib9_14_2::_ajm); if ($__bqi) { return ($__bqc, $__bqd, $__bqb); } $authlib9_14_2::_ako = authlib9_14_2::_zi(0); $authlib9_14_2::_akp = authlib9_14_2::_zi(0); my %__bqh = (); $authlib9_14_2::_akq = authlib9_14_2::_zi(0); } } return ($__bqc, $__bqd, $__bqe, $__bqb); } sub _ym { my ($__bqy, $__bqz, $__bra) = @_; my $__bqm = ""; my $__bqn = <$__bqy>; $__bqn = authlib9_14_2::_zo($__bqn); my @__bqo = split(",", $__bqn); my $__bqp = authlib9_14_2::_zo($__bqo[0]); if (($authlib9_14_2::_akh ne $__bqp) && !$authlib9_14_2::_amg) { authlib9_14_2::_zq(118, "Study name error.", "The study name passed in (" . $authlib9_14_2::_akh . ") does not match the study name in the STUDYNAME_qst.cgi file (" . $__bqp . "). The study name is case-sensitive." . "Make sure that the study name that you are passing in matches the name " . "of your study and try again.", ""); } my $__bqq = authlib9_14_2::_zo($__bqo[2]); if ($__bqq ne $authlib9_14_2::_aia) { $__bqm = "The Lighthouse Studio version number from STUDYNAME_qst.cgi (" . $__bqq . ") does not match the version number in the Perl files (" . $authlib9_14_2::_aia . ")."; if ($__bqz) { authlib9_14_2::_zq(119, "Version number does not match.", $__bqm); } } my $__bqr = authlib9_14_2::_zo($__bqo[3]); my $__bqs = authlib9_14_2::_zo($__bqo[4]); my $__bqt = authlib9_14_2::_zo($__bqo[5]); my $__bqu = authlib9_14_2::_zo($__bqo[6]); if ($__bqu ne $authlib9_14_2::_aic) { $__bqm = "The Build ID in the QST (" . $__bqu . ") does not match the Build ID in the Perl files (" . $authlib9_14_2::_aic . "). Make sure you are using the Perl files that installed with Lighthouse Studio."; if ($__bqz) { authlib9_14_2::_zq(120, "Build ID error.", $__bqm); } } if (!$__bra) { my $__bqv = authlib9_14_2::_zo($__bqo[7]); if ($__bqv == 1) { $authlib9_14_2::_aku = 1; } elsif ($__bqv == 2) { $authlib9_14_2::_akv = 1; } elsif ($__bqv == 3) { $authlib9_14_2::_akw = 1; } else { $authlib9_14_2::_aku = 0; $authlib9_14_2::_akv = 0; $authlib9_14_2::_akw = 0; } $authlib9_14_2::_akx = authlib9_14_2::_zo($__bqo[8]); if (exists $authlib9_14_2::_akn{"hid_test_mode"}) { my $__bqw = $authlib9_14_2::_akn{"hid_test_mode"}; if ($__bqw ne $authlib9_14_2::_akx) { authlib9_14_2::_zq(324, "Invalid test ID.", "The test ID passed in the URL does not match the test ID in the QST."); } } } my $__bqx = 0; if ($__bqm) { $__bqx = {}; $__bqx->{'_amm'} = "Error reading QST file."; $__bqx->{'_amn'} = $__bqm; } return($__bqr, $__bqs, $__bqt, $__bqx); } sub _yn { my ($__brk) = @_; my $__brb = <$__brk>; $__brb = authlib9_14_2::_zo($__brb); my @__brc = split(",", $__brb); my $__brd = authlib9_14_2::_zo($__brc[0]); my $__bre = authlib9_14_2::_zo($__brc[1]); my $__brf = authlib9_14_2::_zo($__brc[2]); my $__brg = authlib9_14_2::_zo($__brc[3]); my $__brh = authlib9_14_2::_zo($__brc[4]); my $__bri = authlib9_14_2::_zo($__brc[5]); my $__brj = authlib9_14_2::_zo($__brc[6]); return ($__brd, $__bre, $__brf, $__brg, $__brh, $__bri, $__brj); } sub _yo { if (!$authlib9_14_2::_aky) { if ($authlib9_14_2::_ajd > 0) { seek $authlib9_14_2::_ajm, $authlib9_14_2::_ajd, 0; $authlib9_14_2::_aky = _zi(1); } } } sub _yp { my ($__brq, $__brr) = @_; my @__brl = split("", $__brq); my $__brm = ""; my $__brn = ""; my $__bro = @__brl; my $__brp = 0; for ($__brp = 0; $__brp < $__bro; $__brp++) { $__brn .= sprintf "%lx", ord($__brl[$__brp]); } if (length($__brn) > $__brr) { if ($__brn =~ m/(.{$__brr})/) { $__brn = $1; } } return $__brn; } sub _yq { my $__brs = "<!--INPUT-->"; authlib9_14_2::_yo(); if (exists $authlib9_14_2::_aky->{'_ju'}) { my $__brt = $authlib9_14_2::_aky->{'_ju'}->{'_jt'}; my $__bru = 0; foreach $__bru (@{$__brt}) { $__brs .= "&" . $__bru->{'_if'} . "=VALUE"; } } if (exists $authlib9_14_2::_aky->{'_jr'}) { my $__brt = $authlib9_14_2::_aky->{'_jr'}; my $__bru = 0; foreach $__bru (@{$__brt}) { $__brs .= "&" . $__bru->{'_if'} . "=VALUE"; } } $__brs .= "<!--END INPUT-->"; return $__brs; } sub _yr { my ($__bsy, $__bsz) = @_; my $__brv = ""; my $__brw = 0; my @__brx = (); my @__bry = (); foreach $__brw (@{$__bsy}) { my $__brz = $__brw->{'_uf'}; my $__bsa = $__brz->{'_lf'}; my $__bsb = @{$__bsa}; my $__bsc = $__brz->{'_bx'}; my $__bsd = 0; my $__bse = 0; my $__bsf = 0; my $__bsg = 0; my $__bsh = 0; my $__bsi = 0; my $__bsj = 0; my $__bsk = $__brw->{'_if'}; my $__bsl = 7919 + ($__bsz - 1) * 100000 + _acs($__bsk); if ($__bsc == &authlib9_14_2::_APA) { my @__bsm = (0..($__bsb - 1)); $__bsi = \@__bsm; } elsif ($__bsc == &authlib9_14_2::_APB || $__bsc == &authlib9_14_2::_APC) { my $__bsn = _acn($__bsz, $__bsb, $__bsl); my $__bso = 0; my @__bsp = (); my $__bsq = 0; my $__bsr = _yv($__brw->{'_if'}, 0); my $__bss = 0; my $__bst = 0; foreach $__bso (@{$__bsn}) { $__bss = 0; $__bse = $__bsa->[$__bso]; $__bst = $__bsr->{$__bse->{'_pt'}}; if ($__bst->{'_hi'} > 0) { if ($__bsc == &authlib9_14_2::_APB) { $__bss = ($__bst->{'_amo'} / $__bst->{'_hi'}); } else { $__bss = $__bst->{'_amo'}; } } push @__bsp, {'_fz' => $__bso, '_nv' => $__bss}; } @__bsp = sort{$a->{'_nv'} <=> $b->{'_nv'}} @__bsp; $__bsi = (); foreach $__bsq (@__bsp) { push @{$__bsi}, $__bsq->{'_fz'}; } } elsif ($__bsc == &authlib9_14_2::_APD || $__bsc == &authlib9_14_2::_APE) { my $__bsu = 1; my $__bsv = $__bsb; if ($__bsc == &authlib9_14_2::_APE && exists $__brz->{'_lp'}) { $__bsu = $__brz->{'_lp'}->[0]; $__bsv = $__brz->{'_lp'}->[1]; } $__bsi = authlib9_14_2::_acm($__bsz, $__bsb, $__bsl, $__bsu, $__bsv); } else { authlib9_14_2::_zq(364, "Quota error.", "Quota check for cell membership method not defined.", ""); } for ($__bsd = 0; $__bsd < $__bsb; $__bsd++) { $__bse = $__bsa->[$__bsi->[$__bsd]]; if (_yt($__brw, $__bse->{'_pt'})) { $__bsf = _zx($__bse->{'_hk'}, "quota control"); if ($__bsf) { $__bsh = 1; $__bsj = $__bse->{'_pt'}; last; } else { $__bsj = -1; } } elsif ($__bsj == 0) { $__bsj = -2; } } push @__brx, {'_if'=> $__brw->{'_if'}, '_pt'=> $__bsj}; if (!$__bsh && $__brv eq "") { $__brv = $__brz->{'_dy'}; } } my @__bsw = (); my $__bsx = 0; foreach $__bsx (@__brx) { push @__bsw, [$__bsx->{'_if'}, $__bsx->{'_pt'}]; } authlib9_14_2::_xw(\@__bsw, $__bsz); authlib9_14_2::_xj(\@__bsw, $__bsz, 0); return $__brv; } sub _ys { if ($authlib9_14_2::_ala == 0) { if ($authlib9_14_2::_aja) { my $__bta = tell $authlib9_14_2::_ajm; if ($__bta < 0) { authlib9_14_2::_yl(1, 1, ""); } seek $authlib9_14_2::_ajm, ($authlib9_14_2::_aja), 0; $authlib9_14_2::_ala = _zi(0); if ($__bta < 0) { close $authlib9_14_2::_ajm; } else { seek $authlib9_14_2::_ajm, $__bta, 0; } } else { authlib9_14_2::_zq(122, "File read error.", "Problem reading QST Quota section: Quotas are not defined.", ""); } } } sub _yt { my ($__btg, $__bth) = @_; my $__btb = 0; my $__btc = $__btg->{'_uf'}; my $__btd = _yv($__btg->{'_if'}, $__btc); my $__bte = $__btd->{$__bth}->{'_amo'}; my $__btf = $__btd->{$__bth}->{'_hi'}; if (exists $__btc->{'_fw'}) { $__btb = $__bte + $__btd->{$__bth}->{'in-progress'}; } else { $__btb = $__bte; } if ($__btf > $__btb) { return 1; } else { return 0; } } sub _yu { my ($__bug, $__buh) = @_; my $__bti = 0; if ($authlib9_14_2::_alb) { if (!exists $authlib9_14_2::_alb->{uc($__bug)}) { $__bti = 1; } } else { $__bti = 1; $authlib9_14_2::_alb = {}; } if ($__bti && _aet()) { my $__btj = 0; my $__btk = {}; my ($__bui, $__buj) = _xk($__bug); my ($__buk, $__buj) = _xk("sys_RespRemoved"); my $__btl = 0; my $__btm = 0; my $__btn = 0; my $__bto = $__buh->{'_lf'}; my $__btp = 0; foreach $__btp (@{$__bto}) { $__btk->{$__btp->{'_pt'}} = {'_amo' => 0, 'in-progress' => 0, 'admin-in-progress' => 0, 'in-active' => 0, '_hi' => 0}; } if (exists $__buh->{'_fw'}) { $__btl = 1; if (exists $__buh->{'_fw'}->{'_ou'}) { $__btm = int($__buh->{'_fw'}->{'_ou'} * 60); } if (exists $__buh->{'_fw'}->{'_lx'}) { $__btn = $__buh->{'_fw'}->{'_lx'}; } } my $__btq = ""; my $__btr = ""; my $__bts = time(); my $__btt = ""; my $__btu = "`$authlib9_14_2::_akj\_data1`"; my $__btv = "`$authlib9_14_2::_akj\_data$__buk`"; if ($__bui > 1) { $__btt = "`$authlib9_14_2::_akj\_data$__bui`"; $__btq .= "SELECT $__btt.`$__bug`, $__btu.`sys_RespStatus`, COUNT(*) FROM $__btu INNER JOIN $__btt ON $__btt.`sys_RespNum` = $__btu.`sys_RespNum`"; if ($__btv ne $__btt && $__btv ne $__btu) { $__btq .= " INNER JOIN $__btv ON $__btv.`sys_RespNum` = $__btu.`sys_RespNum`"; } $__btq .= " WHERE (($__btv.`sys_RespRemoved` IS NULL) OR ($__btv.`sys_RespRemoved` = 0))"; if (!$__btl) { $__btq .= " AND $__btu.`sys_RespStatus` = ". &authlib9_14_2::_AOH; } $__btr = " GROUP BY $__btt.`$__bug`, $__btu.`sys_RespStatus`"; } else { $__btq .= "SELECT `$__bug`, `sys_RespStatus`, COUNT(*) FROM $__btu"; if ($__buk > 1) { $__btq .= " INNER JOIN $__btv ON $__btv.`sys_RespNum` = $__btu.`sys_RespNum`"; } $__btq .= " WHERE (($__btv.`sys_RespRemoved` IS NULL) OR ($__btv.`sys_RespRemoved` = 0))"; if (!$__btl) { $__btq .= " AND `sys_RespStatus` = ". &authlib9_14_2::_AOH; } $__btr = " GROUP BY `$__bug`,`sys_RespStatus`"; } eval { $__btj = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__btq . $__btr, 0)); }; if ($@) { authlib9_14_2::_zq(229, "Database error.", "Database error reading data for quotas.", $@); } my $__btw = 0; my $__btx = 0; my $__bty = 0; my $__btz = 0; my $__bua = 0; my $__bub = 0; foreach $__btw (@{$__btj}) { $__bua = $__btw->[0]; $__bty = $__btw->[1]; $__bub = $__btw->[2]; if ($__bua > 0) { if ($__bty == &authlib9_14_2::_AOH) { $__btk->{$__bua}->{'_amo'} += $__bub; } elsif ($__bty == &authlib9_14_2::_AOF) { $__btk->{$__bua}->{'in-progress'} += $__bub; } } } if ($__btm) { my $__buc = 0; $__btq .= " AND "; if ($__bui > 1) { $__btq .= $__btu . "."; } $__btq .= "`sys_RespStatus` = ". &authlib9_14_2::_AOF . " AND "; if ($__bui > 1) { $__btq .= $__btu . "."; } $__btq .= "`sys_EndTimeStamp` < ". ($__bts - $__btm); eval { $__buc = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__btq . $__btr, 0)); }; if ($@) { authlib9_14_2::_zq(323, "Database error.", "Database error reading data for quotas.", $@); } foreach $__btw (@{$__buc}) { $__bua = $__btw->[0]; $__bty = $__btw->[1]; $__bub = $__btw->[2]; if ($__bua > 0) { $__btk->{$__bua}->{'in-active'} += $__bub; $__btk->{$__bua}->{'in-progress'} -= $__bub; } } } if ($__btl) { my $__bud = 0; foreach $__bua (keys %{$__btk}) { $__bud = $__btk->{$__bua}->{'in-progress'}; $__btk->{$__bua}->{'actual-in-progress'} = $__bud; $__btk->{$__bua}->{'in-progress'} = $__bud; if ($__btn) { $__btk->{$__bua}->{'in-progress'} = int($__bud * ($__btn / 100)); } } } $__btq = "SELECT `cell_value`, `cell_limit` FROM `" . $authlib9_14_2::_akj . "_quotas` WHERE `quota_name` = " . $authlib9_14_2::_ake->quote($__bug); eval { $__btj = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__btq, 0)); }; if ($@) { authlib9_14_2::_zq(230, "Database error.", "Database error reading quota table.", $@); } if (@{$__btj}) { my $__bue = 0; my $__buf = 0; foreach $__btw (@{$__btj}) { $__bue = $__btw->[0]; $__buf = $__btw->[1]; $__btk->{$__bue}->{'_hi'} = $__buf; } } else { authlib9_14_2::_zq(231, "Database error.", "Database error quota table returned nothing.", $@); } $authlib9_14_2::_alb->{uc($__bug)} = $__btk; } } sub _yv { my ($__bun, $__buo) = @_; if ($__buo == 0) { my $__bul = _yy($__bun); $__buo = $__bul->{'_uf'}; } _yu($__bun, $__buo); my $__bum = 0; if (exists $authlib9_14_2::_alb->{uc($__bun)}) { $__bum = $authlib9_14_2::_alb->{uc($__bun)}; } return $__bum; } sub _yw { my ($__bux) = @_; my $__bup = 0; my $__buq = ""; _ys(); if ($authlib9_14_2::_ala) { my $__bur = $authlib9_14_2::_ala->{'_lg'}; my $__bus = ""; my $__but = 0; my $__buu = 0; foreach $__bus (@{$__bur}) { $__but = authlib9_14_2::_ws($__bus); if ($__but > 0) { $__buu = _abc($__bus, $__but); if ($__buu == 0) { $__bup = 1; my $__buv = _yy($__bus); $__buq = $__buv->{'_uf'}->{'_dy'}; my @__buw = (); push @__buw, [$__bus, -3]; authlib9_14_2::_xj(\@__buw, $__bux, 0); last; } } } } return ($__bup, $__buq); } sub _yx { my ($__bva, $__bvb) = @_; my $__buy = ""; if ($__bvb > 0) { my $__buz = _yz($__bva, $__bvb); if ($__buz) { $__buy = $__buz->{'_if'}; } } elsif ($__bvb == -1) { $__buy = "[Disqualified]"; } elsif ($__bvb == -2) { $__buy = "[Over Quota]"; } elsif ($__bvb == -3) { $__buy = "[Over Quota - Qualified Restart]"; } return $__buy; } sub _yy { my ($__bvg) = @_; my $__bvc = 0; if (exists $authlib9_14_2::_ahp{$__bvg}) { $__bvc = $authlib9_14_2::_ahp{$__bvg}; my $__bvd = $__bvc->{'_iz'}; my $__bve = tell $authlib9_14_2::_ajm; seek $authlib9_14_2::_ajm, $__bvd, 0; my $__bvf = _zi(1); $__bvc->{'_uf'} = $__bvf; seek $authlib9_14_2::_ajm, $__bve, 0; } return $__bvc; } sub _yz { my ($__bvl, $__bvm) = @_; my $__bvh = _yy($__bvl); my $__bvi = 0; if ($__bvh) { my $__bvj = $__bvh->{'_uf'}->{'_lf'}; my $__bvk = 0; foreach $__bvk (@{$__bvj}) { if ($__bvk->{'_pt'} == $__bvm) { $__bvi = $__bvk; last; } } } return $__bvi; } sub _za { my ($__bvo, $__bvp) = @_; if ($__bvo =~ m/(.*?)_/i) { $__bvo = $1; } authlib9_14_2::_yh("acalib9_14_2.pl"); acalib9_14_2::_ari($__bvo, $__bvp); my $__bvn = $acalib9_14_2::_aso->{$__bvo}; return $__bvn; } sub _zb { my $__bvq = ""; my $__bvr = 0; my $__bvs = 0; my $__bvt = ""; my $__bvu = "text/html"; if ($authlib9_14_2::_ajz) { $__bvu = "application/json"; } my $__bvv = ""; if (exists $ENV{"REMOTE_ADDR"}) { $__bvv = $ENV{"REMOTE_ADDR"}; } if ($authlib9_14_2::_akp) { if ($__bvv !~ m/^::1$/ || exists $authlib9_14_2::_akp->{'_pp'}) { if (exists $authlib9_14_2::_akp->{'_nb'}) { my $__bvw = $authlib9_14_2::_akp->{'_nb'}; $__bvw =~ s/\n/\r\n/g; $__bvt .= $__bvw . "\r\n"; } } } $__bvt .= "Content-type: " . $__bvu . "\r\n\r\n"; if (exists($ENV{'MOD_PERL'}) && defined($ENV{'MOD_PERL'})) { $__bvr = 1; $__bvs = $ENV{'MOD_PERL'}; $__bvs =~ s/mod_perl\/(\d\.\d)(.*?)$/$1/i; } if ($ENV{'PERL_SEND_HEADER'} || ($__bvr == 0)) { $__bvq = $__bvt; } else { if ($__bvs < 1.9) { my $__bvx = Apache->request; $__bvx->content_type($__bvu); $__bvx->send_http_header; } else { $__bvq = $__bvt; } } $authlib9_14_2::_alc = 1; return $__bvq; } sub _zc { if (exists($ENV{'WINDIR'})) { return 1; } else { return 0; } } sub _zd { my ($__bvz, $__bwa) = @_; my $__bvy = 1; eval { if ($__bwa) { flock $__bvz, 2; } else { flock $__bvz, 1; } }; if ($@) { $@ = ""; $__bvy = 0; $authlib9_14_2::_ald = 0; } seek $__bvz, 0, 0; return $__bvy; } sub _ze { my ($__bwe, $__bwf, $__bwg) = @_; my $__bwb = 0; my $__bwc = 0; if ($__bwg) { ($__bwb, $__bwc) = _yg($__bwe, "write", 1, 1); } else { ($__bwb, $__bwc) = _yg($__bwe, "write", 0, 0); if ($__bwc) { authlib9_14_2::_zq(328, "File error.", "Error opening lock file.", $__bwc->{'_amn'}, 0); } } my $__bwd = authlib9_14_2::_zd($__bwb, $__bwf); if ($__bwd == 0) { if ($authlib9_14_2::_aib eq ".pl") { print authlib9_14_2::_zb(); print "<h4><u>Error</u>: This system does not support flock() for file locking. Please call Sawtooth Software.</h4>"; exit(); } _zf($__bwb); } return($__bwb); } sub _zf { my ($__bwk) = @_; my $__bwh = time + 20; my $__bwi = time; my $__bwj = $authlib9_14_2::_ahv{'_aml'} . $authlib9_14_2::_akh . "_lockfiles/" . $__bwk . "_LOCKFILE.cgi"; while (-e $__bwj && $__bwi < $__bwh) { $__bwi = time; } if (-e $__bwj) { unlink($__bwj); } my ($__bwl, $__bwm) = authlib9_14_2::_yg($__bwj, "write", 0, 0); if ($__bwm) { print "Content-type: text/html\r\n\r\n Can't create file $__bwj. Check your write permissions." . $!; } close $__bwl; } sub _zg { my ($__bwo) = @_; my $__bwn = $authlib9_14_2::_ahv{'_aml'} . $authlib9_14_2::_akh . "_lockfiles/" . $__bwo . "_LOCKFILE.cgi"; unlink $__bwn; } sub _zh { my ($__bwu) = @_; my $__bwp = {}; my @__bwq = (); my $__bwr = "SELECT COUNT(`sys_respnum`) FROM "; if ($__bwu) { push @__bwq, authlib9_14_2::_aev($__bwp, 1); push @__bwq, "`sys_RespStatus` = " . &authlib9_14_2::_AOH; } $__bwr = authlib9_14_2::_aeu($__bwr, \@__bwq, $__bwp); my $__bws = 0; eval { $__bws = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__bwr, 0)); }; if ($@) { authlib9_14_2::_zq(359, "Database error.", "Database error. Cannot get records.", $@); } my $__bwt = $__bws->[0]->[0]; return $__bwt; } sub _zi { my ($__bwv) = @_; return _zj($authlib9_14_2::_ajm, $authlib9_14_2::_akh . "_qst.cgi", $__bwv); } sub _zj { my ($__bxi, $__bxj, $__bxk) = @_; my $__bww = 0; my $__bwx = ""; my $__bwy = "<\0\0/>"; if ($authlib9_14_2::_aku || $authlib9_14_2::_akv || $authlib9_14_2::_akw) { $__bwy = "<\0/>"; } $__bwx .= _yc($__bxi, $__bwy); if ($__bwx !~ s/^$__bwy//m) { authlib9_14_2::_zq(126, "File read error.", "The offsets in the " . $__bxj . " file are incorrect. Please recreate the file and try again.", $!); } <$__bxi>; if ($__bxk && !$authlib9_14_2::_ajx && !$authlib9_14_2::_alh) { $__bwx = _zw($__bwx, 1); } $__bww = eval($__bwx); if ($@) { authlib9_14_2::_zq(127, "File read error.", "Problem reading QST section. Make sure that you have uploaded the " . $__bxj . " file in binary mode.", $@); } if (!defined($__bww)) { authlib9_14_2::_zq(128, "File read error.", "Problem reading QST file. Text: " . $__bwx, ""); } if (exists($ciwlib9_14_2::_tx{'remove_rand'})) { my $__bwz = ref $__bww; if (($__bwz ne "SCALAR") && ($__bwz ne "ARRAY")) { my $__bxa = $__bww; if ($__bwz =~ m/^grid$/i) { $__bxa = $__bww->{'_mv'}; _zk($__bxa); $__bxa = $__bww->{'_cl'}; _zk($__bxa); my $__bxb = @{$__bww->{'_pv'}}; my $__bxc = 0; my $__bxd = 0; for ($__bxd = 0; $__bxd < $__bxb; $__bxd++) { $__bxc = $__bww->{'_pv'}->[$__bxd]; $__bwz = ref $__bxc; if ($__bwz eq "ComboVar") { _zk($__bxc); } elsif ($__bwz eq "RankVar") { _zk($__bxc); } } } elsif ($__bwz eq "HASH") { my $__bxe = 0; my $__bxf = ""; my $__bxg = ""; my $__bxh = ""; foreach $__bxf (keys %{$__bww}) { $__bxe = $__bww->{$__bxf}; $__bxg = ref $__bxe; if (($__bxg eq "CList") || ($__bxg eq "PList")) { if ($__bxg eq "CList") { $__bxh = $__bxe->{'_hk'}; $__bxh =~ s/RANDOMIZE(.*?);//; $__bxe->{'_hk'} = $__bxh; } } else { last; } } } else { if ($__bwz ne "") { _zk($__bxa); } } } } return $__bww; } sub _zk { my ($__bxm) = @_; my $__bxl = ""; if (exists $__bxm->{'_la'}) { delete($__bxm->{'_la'}); } if (exists $__bxm->{'_jn'}) { delete($__bxm->{'_jn'}); } if (exists $__bxm->{'_ln'}) { delete($__bxm->{'_ln'}); } if (exists $__bxm->{'_amp'}) { delete($__bxm->{'_amq'}); } } sub _zl { my ($__bxz) = @_; my $__bxn = 0; my $__bxo = $__bxz; my $__bxp = ""; $__bxo = reverse($__bxo); $__bxo =~ s/^.*?\///; $__bxo = reverse($__bxo); my $__bxq = $__bxo . '/admin/' . $authlib9_14_2::_akh . "_path.cgi"; my $__bxr = $__bxo . "/" . $authlib9_14_2::_akh . "/admin/" . $authlib9_14_2::_akh . "_path.cgi"; my $__bxs = $__bxz . "/" . $authlib9_14_2::_akh . "_path.cgi"; my $__bxt = $authlib9_14_2::_akh . "_path.cgi"; my $__bxu = 0; my $__bxv = 0; my $__bxw = 0; my $__bxx = ""; if (-e $__bxq) { $__bxx = $__bxq; } elsif (-e $__bxr) { $__bxx = $__bxr; } elsif (-e $__bxs) { $__bxx = $__bxs; } elsif (-e $__bxt) { $__bxx = $__bxt; $__bxu = 1; } else { _zq(129, "Cannot find the study name.", "Can't find file " . $authlib9_14_2::_akh . "_path.cgi.", "", 1); } ($__bxv, $__bxw) = authlib9_14_2::_yg($__bxx, "read", 1, 1); $__bxp = <$__bxv>; $__bxp = _zo($__bxp); if ($__bxu) { $authlib9_14_2::_ahv{'_aml'} = $__bxp; } else { $authlib9_14_2::_ahv{'_aml'} = _zn($__bxz, $__bxp); } $authlib9_14_2::_ahv{'_aml'} = _zw($authlib9_14_2::_ahv{'_aml'}, 0); $authlib9_14_2::_ahv{'_amr'} = $__bxp; if (! -e $authlib9_14_2::_ahv{'_aml'}) { _zq(130, "Directory does not exist.", "The directory: " . $authlib9_14_2::_ahv{'_aml'} . " does not exist. Check your study paths under Advanced Settings.", ""); } $__bxp = <$__bxv>; $__bxp = _zo($__bxp); if ($__bxu) { $authlib9_14_2::_ahv{'_ams'} = $__bxp; } else { $authlib9_14_2::_ahv{'_ams'} = _zn($__bxz, $__bxp); } my $__bxy = $__bxp; if ($__bxy =~ m/^@(.*?)$/) { $__bxy = $1; } else { $__bxy = _zm($__bxy); } $authlib9_14_2::_ahv{'_ur'} = $__bxy; close $__bxv; } sub _zm { my ($__byb) = @_; my $__bya = ""; $__bya = $ENV{'SCRIPT_NAME'}; $__bya =~ s/\/ciwweb\.pl//; $__bya =~ s/\/admin\.pl//; $__bya =~ s/\/testmode\.pl//; $__bya = _zw(_zn($__bya, $__byb), 0); return $__bya; } sub _zn { my ($__byd, $__bye) = @_; my $__byc = ""; if ($__bye =~ m/https?:\/\//i) { $__byc = $__bye; } else { $__byd = reverse($__byd); while ($__bye =~ m/^\.\.\//) { $__bye =~ s/^\.\.\///; $__byd =~ s/^.*?\///; } $__byd = reverse($__byd); $__byc = $__byd . "/" . $__bye; } return $__byc; } sub _zo { my ($__byf) = @_; if (length($__byf)) { $__byf =~ s/^\s+//; $__byf =~ s/\s+$//; } return $__byf; } sub _zp { my ($__byp, $__byq) = @_; if ($authlib9_14_2::_amg) { return; } my $__byg = $authlib9_14_2::_akm->{"qst_version"}; my $__byh = ""; if (exists $authlib9_14_2::_akp->{'_gh'}) { $__byh = _aac(); } my $__byi = ""; if (exists $authlib9_14_2::_akp->{'_pr'}) { $__byi = _aab(); } my $__byj = time(); my $__byk = $authlib9_14_2::_akn{"hid_respnum"}; my $__byl = ""; my $__bym = ""; while (my ($__byr, $__bys) = each %authlib9_14_2::_akn) { $__byl .= $__bym; $__byl .= $__byr . "=>" . $__bys; $__bym = ", "; } my $__byn = "INSERT INTO `" . $authlib9_14_2::_akj . "_design_log` (`sys_RespNum`,`ipaddress`,`user_agent`,`timestamp`,`qst_version`,`exercisename`,`input`,`message`) VALUES(?, ?, ?, ?, ?, ?, ?, ?)"; eval { my $__byo = $authlib9_14_2::_ake->prepare(_wn($__byn, 0)); $__byo->execute($__byk, $__byh, _wh($__byi), $__byj, $__byg, $__byp, _wh($__byl), _wh($__byq)); }; if ($@) { _zq(296, "Database error.", "Database error. Cannot insert design log row.", $@); } } sub _zq { my ($__byt, $__byu, $__byv, $__byw, $__byx, $__byy) = @_; if ($__byu eq "") { $__byu = $__byv; } if (!$__byx) { _acg(&authlib9_14_2::_AOS, $__byt, $__byv, $__byw, $__byy); } if ($authlib9_14_2::_aiv) { if ($__byw ne "") { $__byw = ": " . $__byw; } eval { require "Carp.pm"; Carp::confess("Error: " . $__byv . $__byw . " Error"); }; if ($@) { _acg(&authlib9_14_2::_AOS, 0, "Cannot load Carp.pm.", $@); } } else { if ($authlib9_14_2::_ajz) { print authlib9_14_2::_zb(); print "{"; print "\"result\": false,"; print "\"error\": \"Error #" . $__byt . " - " . _zr($__byu) . "\""; print "}"; } else { if (!$authlib9_14_2::_alc) { print authlib9_14_2::_zb(); } if (!$ciwlib9_14_2::_uc) { print authlib9_14_2::_yi(0) . "\n<body>\n"; } print "<div style=\"border: 1px solid black; background-color: white; color: black; font-family: arial; padding: 5px;"; print " width: 800px; margin-left: auto; margin-right: auto; padding: 5px;\">\n"; print "<div style=\"color: red; text-decoration: underline; font-weight: bold;\">Sawtooth Error"; if ($__byt) { print " # " . $__byt; } print "</div><div><p>" . $__byu . "</p></div>"; print "<div style=\"margin-top: 30px;\">"; print "Please try to refresh your browser or try to backup and submit again. If the error continues please contact the survey administrator."; if ($__byt == 129 || $__byt == 102) { print " If you are starting the survey, please check the survey link and try again."; } print "</div></div>"; print _zu(); print "</body>\n</html>\n"; } authlib9_14_2::_act(); } } sub _zr { my ($__byz) = @_; $__byz =~ s/(?<!\\)"/\\"/g; $__byz =~ s/\n/ /g; return $__byz; } sub _zs { my $__bza = ""; my $__bzb = Symbol::gensym(); opendir($__bzb, "../admin/") || authlib9_14_2::_zq(314, "Cannot find default studyname.", "", "", 1); my @__bzc = readdir($__bzb); closedir $__bzb; my $__bzd = ""; foreach $__bzd(@__bzc) { if ($__bzd =~ m/(.*?)_config\.cgi/i) { $__bza = $1; last; } } return $__bza; } sub _zt { my ($__bze) = @_; if (!$authlib9_14_2::_alc) { print authlib9_14_2::_zb(); } if (!$ciwlib9_14_2::_uc) { print authlib9_14_2::_yi(0) . "\n<body>\n"; } print "<div style=\"border: 2px solid orange; background-color: white; color: black; font-family: arial; padding: 5px;"; print " width: 800px; margin-left: auto; margin-right: auto; padding: 5px;\">\n"; print "<div style=\"color: blue; text-decoration: underline; font-weight: bold;\">Test Mode Error</div>"; print "<div><p>" . $__bze . "</p></div>"; print "</div>"; print "</body>\n</html>\n"; authlib9_14_2::_act(); } sub _zu { my $__bzf = ""; $__bzf .= "\n<style type=\"text/css\">\n"; $__bzf .= ".loading{display: none;}\n"; $__bzf .= ".stage{display: block;}\n"; $__bzf .= "</style>\n"; return $__bzf; } sub _zv { my ($__bzh, $__bzi) = @_; my $__bzg = ""; $__bzg .= "<div style=\"border: 1px solid black; background-color: white; font-family: arial;"; $__bzg .= " width: 800px; margin-left: auto; margin-right: auto; padding: 5px;\">\n"; $__bzg .= "<div style=\"color: red; text-decoration: underline; font-weight: bold;\">Sawtooth Error:</div>"; $__bzg .= "<div style=\"color: black; padding: 5px;\">" . $__bzh . "</div>"; $__bzg .= "<div style=\"color: blue; padding: 5px;\">" . $__bzi . "</div>"; $__bzg .= "</div>"; return $__bzg; } sub _zw { my ($__bzl, $__bzm) = @_; my $__bzj = ""; my $__bzk = ""; while($__bzl =~ m/\[%(.*?)%\]/sg) { $__bzj = $1; if ($__bzm) { $__bzj =~ s/\\'/'/sg; $__bzj =~ s/\\\\/\\/sg; } $__bzk = _zx($__bzj, "Lighthouse Studio Scripting"); $__bzk =~ s/\[%(.*?)%\]/$1/sg; if ($__bzm) { $__bzk =~ s/\\/\\\\/sg; $__bzk =~ s/'/\\'/sg; } $__bzl =~ s/\[%(.*?)%\]/$__bzk/s; } return $__bzl; } sub _zx { my ($__bzo, $__bzp) = @_; my $__bzn = ""; $__bzn = eval($__bzo); if ($authlib9_14_2::_amg && ($__bzn eq "" || $@)) { $__bzn = "<span class=script_preview>[Script]</span>"; } elsif ($@) { authlib9_14_2::_zq(132, "Script error.", "There is an error in " . $__bzp . ": Script:" . $__bzo, $@); } else { return $__bzn; } } sub RADIOSELECT { my ($__bzq, $__bzr) = @_; return ciwlib9_14_2::_tm($__bzq, $__bzr, 1, 0); } sub CHECKSELECT { my ($__bzs, $__bzt) = @_; return ciwlib9_14_2::_tm($__bzs . "_" . $__bzt, 1, 0, 0); } sub REMOVEPREVIOUS { my $__bzu = ""; $__bzu .= "<style type=\"text/css\">#previous_button{display: none;}</style>"; return $__bzu; } sub PAGETIME { my ($__cah, $__cai) = @_; my $__bzv = 0; my $__bzw = 0; my $__bzx = ""; my @__bzy = (); my $__bzz = ciwlib9_14_2::_rj(); my $__caa = (); if ($__cai eq "") { $__cai = $__cah; } if ($__cah =~ m/^\d+$/ && $__cai =~ m/^\d+$/) { my $__cab = 0; my $__cac = (); my $__cad = ""; for ($__cab = $__cah; $__cab <= $__cai; $__cab++) { $__cac = _zy("sys_pagetime_" . $__cab); @__bzy = keys %{ $__cac }; foreach my $__cae (@__bzy) { my @__caf = @{ $__cac->{$__cae} }; $__bzx = "SELECT " . join(",", @__caf) . " FROM `" . $authlib9_14_2::_akj . "_data" . $__cae . "` WHERE `sys_RespNum` = " . $__bzz; eval { $__caa = $authlib9_14_2::_ake->selectrow_arrayref(authlib9_14_2::_wn($__bzx, 0)); }; foreach my $__cag (@{ $__caa }) { $__bzv += $__cag; } } } } return $__bzv; } sub _zy { my ($__can) = @_; my $__caj = ""; my $__cak = 0; my $__cal = ""; my $__cam = (); if (_xl($__can)) { $__caj = "SELECT `name`, `table` FROM `" . $authlib9_14_2::_akj . "_map` WHERE `name` LIKE '" . $__can . ".%'"; } else { $__caj = "SELECT `name`, `table` FROM `" . $authlib9_14_2::_akj . "_map` WHERE `name` = '" . $__can . "'"; } eval { $__cak = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__caj, 0)); }; if ($@) { authlib9_14_2::_zq(266, "Database error.", "Database error. Cannot select map row.", $@); } foreach $__cal (@{$__cak}) { if (!exists $__cam->{$__cal->[1]}) { $__cam->{$__cal->[1]} = (); } push @{ $__cam->{$__cal->[1]} }, "`" . $__cal->[0] . "`"; } return $__cam; } sub BLOCKPOSITION { my $__cao = $authlib9_14_2::_ahp{$authlib9_14_2::_ajk}; my $__cap = $__cao->{'_ji'}; my $__caq = $authlib9_14_2::_ako->[$__cap - 1]; my $__car = ""; if (exists $__caq->{'_ba'}) { my $__cas = $__caq->{'_ba'}; my @__cat = @{ciwlib9_14_2::_rf(ciwlib9_14_2::_rj(), $__cap)}; my @__cau = @{ciwlib9_14_2::_qw($__cas->{'_nj'})}; for (my $__cav = 0; $__cav < @__cat; $__cav++) { my $__caw = $__cau[$__cat[$__cav] - 1]; if ($__caw->[0] <= $__cap && $__caw->[1] >= $__cap) { $__car = $__cav + 1; last; } } } return $__car; } sub VALUE { my ($__cax) = @_; return _ws($__cax); } sub LABEL { my ($__cbb) = @_; my $__cay = ""; my $__caz = ""; my $__cba = 0; $__cay = _zo(authlib9_14_2::_ws($__cbb)); if ($__cay ne "") { ($__caz, $__cba) = _abu($__cbb, 1, $__cay, 0); $__caz = _zw($__caz, 0); } return $__caz; } sub JAVASCRIPT { my $__cbc = 0; if (exists $authlib9_14_2::_akn{"hid_javascript"} && defined $authlib9_14_2::_akn{"hid_javascript"}) { if ($authlib9_14_2::_akn{"hid_javascript"} == 1) { $__cbc = 1; } else { $__cbc = 0; } } return $__cbc; } sub BROWSER { return _zz(); } sub _zz { my $__cbd = ""; if (exists($ENV{'HTTP_USER_AGENT'})) { my $__cbe = $ENV{'HTTP_USER_AGENT'}; my $__cbf = SSIWebParseBrowser->new($__cbe); if (exists($__cbf->{"name"})) { $__cbd .= $__cbf->{"name"}; if (exists($__cbf->{"version"})) { $__cbd .= " " . $__cbf->{"version"}->{"v"}; } } } return $__cbd; } sub OPERATINGSYSTEM { return _aaa(); } sub _aaa { my $__cbg = ""; if (exists($ENV{'HTTP_USER_AGENT'})) { my $__cbh = $ENV{'HTTP_USER_AGENT'}; my $__cbi = SSIWebParseBrowser->new($__cbh); if (exists($__cbi->{"os"})) { $__cbg = $__cbi->{"os"} . " " . $__cbi->{"osvers"}; } } return $__cbg; } sub USERAGENT { return _aab(); } sub _aab { my $__cbj = ""; if (exists($ENV{'HTTP_USER_AGENT'})) { $__cbj = $ENV{'HTTP_USER_AGENT'}; } return $__cbj; } sub IPADDRESS { return _aac(); } sub _aac { my $__cbk = ""; my @__cbl = qw(HTTP_X_FORWARDED_FOR HTTP_FORWARDED_FOR HTTP_CLIENT_IP HTTP_X_REAL_IP REMOTE_ADDR); foreach my $__cbm (@__cbl) { if (exists $ENV{$__cbm}) { $__cbk = $ENV{$__cbm}; } if ($__cbk) { last; } } my $__cbn = index($__cbk, ","); if ($__cbn != -1) { $__cbk = substr($__cbk, 0, $__cbn); } return (defined $__cbk) ? $__cbk : ""; } sub STUDYNAME { my $__cbo = $authlib9_14_2::_akh; if ($authlib9_14_2::_amg) { $__cbo = ""; } return $__cbo; } sub PAGENUMBER { return _aad(); } sub _aad { my $__cbp = ""; if ((exists $authlib9_14_2::_akn{"hid_pagenum"}) && (defined $authlib9_14_2::_akn{"hid_pagenum"})) { $__cbp = $authlib9_14_2::_akn{"hid_pagenum"}; } return $__cbp; } sub TOTALPAGES { my $__cbq = 0; $__cbq = @{$authlib9_14_2::_ako}; return $__cbq; } sub NUMCHECKED { my ($__cck) = @_; my ($__ccl, $__ccm, $__ccn) = _abt($__cck); if ($authlib9_14_2::_amg || !exists $authlib9_14_2::_ahp{$__ccl}) { return ""; } my $__cbr = $authlib9_14_2::_ahp{$__ccl}; my $__cbs = $__cbr->{'_pj'}; my $__cbt = tell $authlib9_14_2::_ajm; my $__cbu = $__cbr->{'_iz'}; seek $authlib9_14_2::_ajm, $__cbu, 0; my $__cbv = _zi(0); my $__cbw = 0; my $__cbx = 0; my $__cby = 0; my $__cbz = 0; my $__cca = ""; if ($__cbs == &authlib9_14_2::_ANG) { if ($__cbv->{'_pj'} eq "check") { my $__ccb = _acy($__cbv->{'_hj'}, $__ccn); if ($__ccb) { $__cbz = @{$__ccb}; for ($__cbw = 0; $__cbw < $__cbz; $__cbw++) { $__cbx = $__ccb->[$__cbw]->{'_pt'}; $__cca = $__ccl . "_" . $__cbx . $__ccn; if (authlib9_14_2::_ws($__cca) == 1) { $__cby++; } } } } } elsif ($__cbs == &authlib9_14_2::_ANS) { my $__ccc = 0; my $__ccd = 0; my $__cce = 0; if ($__ccm =~ m/r(\d+)/i) { $__ccc = $1; $__cce = authlib9_14_2::_acy($__cbv->{'_co'}, $__ccn); } elsif ($__ccm =~ m/c(\d+)/i) { $__ccd = $1; $__cce = authlib9_14_2::_acy($__cbv->{'_mw'}, $__ccn); } if ($__cce) { $__cbz = @{$__cce}; } for ($__cbw = 0; $__cbw < $__cbz; $__cbw++) { $__cbx = $__cce->[$__cbw]->{'_pt'}; $__cca = $__ccl . "_" . $__cbx; if ($__ccc > 0) { $__cca = $__ccl . "_r" . $__ccc . "_c" . $__cbx; } elsif ($__ccd > 0) { $__cca = $__ccl . "_r" . $__cbx . "_c" . $__ccd; } $__cca .= $__ccn; if (authlib9_14_2::_ws($__cca) == 1) { $__cby++; } } } elsif ($__cbs == &authlib9_14_2::_ANR) { my $__ccf = $__cbv->{'_pv'}; my $__ccg = 0; my $__cch = ""; my $__cci = 0; my $__ccj = 0; for ($__cbw = 0; $__cbw < @{$__ccf}; $__cbw++) { $__ccg = $__ccf->[$__cbw]; $__cch = ref($__ccg); if ($__cch eq "CheckVar") { if ($__ccg->{'_if'} eq $__cck) { $__ccj = $__ccg->{'_iy'}; for ($__cci = 1; $__cci <= $__ccj; $__cci++) { $__cca = $__cck . "_" . $__cci . $__ccn; if (authlib9_14_2::_ws($__cca) == 1) { $__cby++; } } last; } } } } seek $authlib9_14_2::_ajm, $__cbt, 0; return $__cby; } sub DISPLAYTOTAL { my ($__ccy, $__ccz, $__cda) = @_; my $__cco = ""; my $__ccp = 0; my $__ccq = ""; my $__ccr = 1; my @__ccs = (); my %__cct = (); my $__ccu = $authlib9_14_2::_akn{"hid_javascript"}; my $__ccv = 1; my $__ccw = 0; if ($__ccy =~ m/^(.*?)(_?)(\d+)$/) { $__ccq = $1 . $2; if ($2 eq "_") { $__ccv = 0; } $__ccr = $3; } if ($__ccz =~ m/^(.*?)(\d+)$/) { $__ccw = $2; } $__cct{$__ccq . "*"} = 1; for ($__ccp = $__ccr; $__ccp <= $__ccw; $__ccp++) { push @__ccs, $__ccp; } my $__ccx = ""; if ($__ccv) { $__ccx = "_total_" . $authlib9_14_2::_aix; } else { $__ccx = "total_" . $authlib9_14_2::_aix; } $__cco .= ciwlib9_14_2::_sk($__ccq . $__ccx, $__cda); if (!$authlib9_14_2::_amg) { $__cco .= ciwlib9_14_2::_si($__ccy . "_" . $authlib9_14_2::_aix, \@__ccs, \%__cct, $__ccx); } $authlib9_14_2::_aix++; return $__cco; } sub QUESTIONNAME { return $authlib9_14_2::_ajk; } sub GRAPHICSPATH { return $authlib9_14_2::_ahv{'_ur'}; } sub PROGRESSBAR { my $__cdb = $authlib9_14_2::_akp->{'_kr'}; return ciwlib9_14_2::_te($__cdb); } sub PROGRESSBAROFF { $authlib9_14_2::_ale = 1; return ""; } sub PROGRESSBARSET { my ($__cdc) = @_; $authlib9_14_2::_alf = $__cdc; return ""; } sub RANDNUM { my ($__cdj, $__cdk, $__cdl) = @_; my $__cdd = @_; my $__cde = 0; my $__cdf = ""; my $__cdg = ""; my $__cdh = ""; if ($__cdd == 1) { $__cde = $__cdj; } elsif ($__cdd == 3) { $__cde = $__cdj; $__cdf = $__cdk; $__cdg = $__cdl; } if (exists($authlib9_14_2::_akn{"hid_respnum"}) && defined($authlib9_14_2::_akn{"hid_respnum"})) { $__cde = $authlib9_14_2::_akn{"hid_respnum"} + int($__cde); if ($__cdd == 1) { $__cdh = _aco($__cde); } elsif ($__cdf < $__cdg) { my $__cdi = $__cdg - $__cdf; _aco($__cde); $__cdh = (int rand($__cdi + 1)); $__cdh = $__cdh + $__cdf; } } return $__cdh; } sub SYSRAND { my ($__cds, $__cdt) = @_; my $__cdm = @_; $authlib9_14_2::_aix++; my $__cdn = time() + $authlib9_14_2::_aix; my $__cdo = ""; my $__cdp = ""; my $__cdq = ""; if ($__cdm == 2) { $__cdo = $__cds; $__cdp = $__cdt; } if ($__cdm == 0) { $__cdq = _aco($__cdn); } elsif ($__cdo < $__cdp) { my $__cdr = $__cdp - $__cdo; _aco($__cdn); $__cdq = (int rand($__cdr + 1)); $__cdq = $__cdq + $__cdo; } return $__cdq; } sub RESPNUM { return $authlib9_14_2::_akn{"hid_respnum"}; } sub LINKBUTTON { my ($__cdw) = @_; my $__cdu = ""; if (exists $authlib9_14_2::_akp->{'_amt'}) { my $__cdv = authlib9_14_2::_zw($authlib9_14_2::_akp->{'_amt'}, 0); $__cdu = "<a href=\"" . $__cdw . "\">" . $__cdv . "</a>\n"; } else { $__cdu = "<input type=\"button\" value=\"" . authlib9_14_2::_zw($authlib9_14_2::_akp->{'_ik'}, 0) . "\" onClick=\"window.location.href='" . $__cdw . "'\">\n"; } return $__cdu; } sub POPUP { my ($__cdy, $__cdz, $__cea, $__ceb) = @_; my $__cdx = ""; if ($__cdz !~ m/https?:\/\//) { $__cdz = $authlib9_14_2::_ahv{'_ur'} . $__cdz; } $__cdx = "<a href=\"#\" class=\"popup_link\" onclick=\"window.open('" . $__cdz . "', '','resizable=yes,scrollbars=yes,width=" . $__cea . ",height=" . $__ceb . "'); return false;\">" . $__cdy . "</a>"; return $__cdx; } sub TOOLTIP { my ($__ced, $__cee, $__cef, $__ceg) = @_; my $__cec = ""; $__cec .= "<span class=\"tool_tip_link\">" . $__ced . "</span>"; $__cec .= "<span class=\"tool_tip_text\""; if ($__cef || $__ceg) { $__cec .= " style=\""; if ($__cef) { $__cec .= "max-width: none;"; $__cec .= "width:" . $__cef . "px;"; } if ($__ceg) { $__cec .= "height:" . $__ceg . "px;"; } $__cec .= "\""; } $__cec .= ">"; $__cec .= $__cee; $__cec .= "</span>"; return $__cec; } sub DEBUG { my $__ceh = ""; my $__cei = ciwlib9_14_2::_rj(); if ($__cei) { my $__cej = 0; my $__cek = ""; my $__cel = $authlib9_14_2::_akm->{"num_data_tables"}; my $__cem = 0; my $__cen = ""; my $__ceo = 0; my $__cep = 0; my $__ceq = ""; my $__cer = ""; my $__ces = 0; my $__cet = ""; my %__ceu = (); my @__cev = (); my $__cew = 0; for ($__cem = 1; $__cem <= $__cel; $__cem++) { ($__cen, $__ceo, $__cep, $__ceq, $__cer) = authlib9_14_2::_wm($authlib9_14_2::_akj . "_data" . $__cem); eval { $__cew = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__cen, 0)); }; if ($@) { authlib9_14_2::_zq(212, "Database error.", "Database error. Cannot get table description.", $@); } $__cen = "SELECT * FROM `" . $authlib9_14_2::_akj . "_data" . $__cem . "` WHERE `sys_RespNum` = " . $__cei; $__ces = 0; $__cet = ""; eval { $__ces = $authlib9_14_2::_ake->selectrow_arrayref(authlib9_14_2::_wn($__cen, 0)); }; if ($@ || $__ces == 0) { authlib9_14_2::_zq(268, "Database error.", "Database error. Cannot get data for DEBUG.", $@); } else { my $__cex = 0; foreach my $__cey (@{$__cew}) { $__cet = $__cey->[$__ceo]; if ($__ces->[$__cex]) { $__ceu{$__cet} = $__ces->[$__cex]; push @__cev, $__cet; } $__cex++; } } } $__ceh .= "<div class=\"debug_box\">"; $__ceh .= "<table border=\"1\" cellpadding=\"5\" cellspacing=\"0\">"; $__ceh .= "<tr class=\"debug_header\"><td align=\"center\" colspan=\"2\">"; $__ceh .= "<h1>Lighthouse Studio DEBUGGER</h1>"; $__ceh .= "</td></tr>"; $__ceh .= "<tr class=\"debug_section\">"; $__ceh .= "<td><b>Question Name</b></td>"; $__ceh .= "<td><b>Value</b></td></tr>"; foreach $__cej (@__cev) { if ($__cej =~ m/^sys_/i) { next; } $__ceh .= "<tr><td align=\"right\"><b>" . $__cej . "</b></td><td align=\"left\">" . $__ceu{$__cej} . "</td></tr>"; } $__ceh .= "<tr class=\"debug_section\">"; $__ceh .= "<td><b>Constructed List</b></td>"; $__ceh .= "<td><b>Value</b></td></tr>"; $__cen = "SELECT * FROM `" . $authlib9_14_2::_akj . "_clists` WHERE `sys_RespNum` = " . $__cei; $__ces = 0; $__cet = ""; eval { $__ces = $authlib9_14_2::_ake->selectall_arrayref(authlib9_14_2::_wn($__cen, 0)); }; if ($@ || $__ces == 0) { authlib9_14_2::_zq(268, "Database error.", "Database error. Cannot get data for DEBUG.", $@); } else { foreach my $__cez (@{$__ces}) { $__ceh .= "<tr><td align=\"right\"><b>" . $__cez->[1] . "</b></td><td align=\"left\">" . $__cez->[2] . "</td></tr>"; } } $__ceh .= "<tr class=\"debug_section\"><td colspan=\"2\" align=\"left\">"; $__ceh .= "<b>Internal Page Variables</b>"; $__ceh .= "</td></tr>"; foreach $__cej (sort keys %authlib9_14_2::_akn) { if ($__cej =~ m/hid_/) { $__cek = _zo($authlib9_14_2::_akn{$__cej}); if ($__cej eq "hid_pagenum") { if (exists $authlib9_14_2::_akn{"hid_pagenum"}) { $__cek = $authlib9_14_2::_akn{"hid_pagenum"}; } } if ($__cek eq "") { $__cek = "&nbsp;"; } $__ceh .= "<tr><td align=\"right\"><b>" . $__cej . "</b></td><td align=\"left\">" . $__cek . "</td></tr>"; } } $__ceh .= "<tr class=\"debug_section\"><td colspan=\"2\" align=\"left\">"; $__ceh .= "<b>Internal System Variables</b>"; $__ceh .= "</td></tr>"; foreach $__cej (sort keys %__ceu) { if ($__cej =~ m/^sys_/i) { $__ceh .= "<tr><td align=\"right\"><b>" . $__cej . "</b></td><td align=\"left\">" . $__ceu{$__cej} . "</td></tr>"; } } $__ceh .= "</table></div>"; } return $__ceh; } sub STRINGTONUMBER { my ($__cfa) = @_; $__cfa =~ s/^\s*0+(.+?)$/$1/; return $__cfa; } sub NUMBERTOSTRING { my ($__cfb) = @_; return $__cfb; } sub BOOLEANTONUMBER { my ($__cfc) = @_; return $__cfc; } sub NUMBERTOBOOLEAN { my ($__cfd) = @_; return $__cfd; } sub LISTLENGTH { my ($__cfe) = @_; return _aae($__cfe); } sub _aae { my ($__cfh) = @_; my $__cff = _acy($__cfh); my $__cfg = 0; if ($__cff) { $__cfg = @{$__cff}; } return $__cfg; } sub LISTHASPARENTMEMBER { my ($__cfm, $__cfn) = @_; my $__cfi = _acy($__cfm); my $__cfj = 0; if ($__cfi) { $__cfj = @{$__cfi}; } my $__cfk = 0; my $__cfl = 0; for ($__cfk = 0 ; $__cfk < $__cfj; $__cfk++) { if ($__cfi->[$__cfk]->{'_pt'} == $__cfn) { $__cfl = 1; last; } } return $__cfl; } sub LISTLABEL { my ($__cfq, $__cfr) = @_; my $__cfo = ""; my $__cfp = _acy($__cfq); if (($__cfr > 0) && $__cfp && ($__cfr <= @{$__cfp})) { $__cfo = $__cfp->[$__cfr - 1]->{'_op'}; $__cfo = _zw($__cfo, 0); } return $__cfo; } sub LISTVALUE { my ($__cfu, $__cfv) = @_; my $__cfs = ""; my $__cft = _acy($__cfu); if (($__cfv > 0) && $__cft && ($__cfv <= @{$__cft})) { $__cfs = $__cft->[$__cfv - 1]->{'_pt'}; } return $__cfs; } sub LISTVALUESARRAY { my ($__cfy) = @_; my $__cfw = ""; my $__cfx = _acy($__cfy); if ($__cfx) { $__cfw = "[" . join(",", map{$_->{'_pt'}} @{$__cfx}) . "]"; } return $__cfw; } sub LISTLABELSARRAY { my ($__cgb) = @_; my $__cfz = ""; my $__cga = _acy($__cgb); if ($__cga) { $__cfz = "[" . join(",", map{"'" . _aaf($_) . "'"} @{$__cga}) . "]"; } return $__cfz; } sub _aaf { my ($__cgd) = @_; my $__cgc = $__cgd->{'_op'}; $__cgc =~ s/\\/\\\\/sg; $__cgc =~ s/'/\\'/sg; $__cgc = _zw($__cgc, 0); return $__cgc; } sub FORMATLISTLABELS { my ($__cgi, $__cgj, $__cgk) = @_; my $__cge = 0; my $__cgf = ""; my $__cgg = ""; my $__cgh = _acy($__cgi); if ($__cgh) { foreach $__cge (@{$__cgh}) { $__cgf = $__cge->{'_op'}; $__cgg .= $__cgj . $__cgf . $__cgk; } } return $__cgg; } sub DISPLAYLISTLABELS { my ($__cgq, $__cgr, $__cgs) = @_; my $__cgl = ""; my $__cgm = ""; my $__cgn = _acy($__cgq); if ($__cgn) { my $__cgo = @{$__cgn}; my $__cgp = 0; for ($__cgp = 0; $__cgp < $__cgo; $__cgp++) { $__cgl = $__cgn->[$__cgp]->{'_op'}; $__cgm .= $__cgl; if ($__cgo > 2 && $__cgp < $__cgo - 1) { $__cgm .= $__cgr . " "; } if ($__cgo > 1) { if ($__cgp == $__cgo - 2) { $__cgm .= " " . $__cgs . " "; } } } } return $__cgm; } sub WRITELOG { my ($__cgt, $__cgu) = @_; if (!$__cgu) { $__cgu = &authlib9_14_2::_AOU; } _acg($__cgu, 0, $__cgt); return ""; } sub ERRFIELD { return "[\0ERRFIELD()\0]"; } sub ERRQNAME { return "[\0ERRQNAME()\0]"; } sub ERRTEXT { return "[\0ERRTEXT()\0]"; } sub ERRMIN { return "[\0ERRMIN()\0]"; } sub ERRMAX { return "[\0ERRMAX()\0]"; } sub ERRTOTAL { return "[\0ERRTOTAL()\0]"; } sub ERRCURSUM { return "[\0ERRCURSUM()\0]"; } sub ACAATTRIBUTE { return "[\0ACAATTRIBUTE()\0]"; } sub ACABEST { return "[\0ACABEST()\0]"; } sub ACAWORST { return "[\0ACAWORST()\0]"; } sub ACAIMPORTANCE { my ($__cgw, $__cgx) = @_; my $__cgv = _za($__cgw, 1); return _aag($__cgv, $__cgx); } sub _aag { my ($__cgy, $__cgz) = @_; return acalib9_14_2::_asg($__cgy, $__cgz, 0); } sub ACASAVECUSTOMACAIMP { my ($__chb) = @_; if (!$authlib9_14_2::_amg) { my $__cha = _za($__chb, 1); acalib9_14_2::_asl($__cha, $__chb); } return ""; } sub ACAUTILITY { my ($__chd, $__che, $__chf) = @_; my $__chc = _za($__chd, 1); return _aah($__chc, $__che, $__chf); } sub _aah { my ($__chh, $__chi, $__chj) = @_; my $__chg = ""; eval { $__chg = acalib9_14_2::_asg($__chh, $__chi, $__chj); }; if ($@ || ($__chj <= 0)) { $__chg = ""; } return $__chg; } sub ACAPRIORSBESTLEVELLABEL { my ($__chn, $__cho) = @_; my $__chk = _za($__chn, 1); my $__chl = _aai($__chk, $__chn, $__cho, 1); my $__chm = $__chk->{'_ae'}; return $__chm->[$__cho - 1]->{'_hf'}->[$__chl - 1]; } sub ACAPRIORSBESTLEVELVALUE { my ($__chr, $__chs) = @_; my $__chp = _za($__chr, 1); my $__chq = _aai($__chp, $__chr, $__chs, 1); return $__chq; } sub ACAPRIORSWORSTLEVELLABEL { my ($__chw, $__chx) = @_; my $__cht = _za($__chw, 1); my $__chu = _aai($__cht, $__chw, $__chx, 0); my $__chv = $__cht->{'_ae'}; return $__chv->[$__chx - 1]->{'_hf'}->[$__chu - 1]; } sub ACAPRIORSWORSTLEVELVALUE { my ($__cia, $__cib) = @_; my $__chy = _za($__cia, 1); my $__chz = _aai($__chy, $__cia, $__cib, 0); return $__chz; } sub _aai { my ($__cig, $__cih, $__cii, $__cij) = @_; my $__cic = $__cig->{'_ae'}; if ($__cii > @{$__cic} || $__cii <= 0) { die("The attribute " . $__cii . " being used in Sawtooth Script does not match the number of attributes defined in this study"); } my $__cid = 0; my $__cie = 0; my $__cif = 0; ($__cie, $__cif) = acalib9_14_2::_ask($__cih, $__cic, $__cii); if ($__cij) { $__cid = $__cie; } else { $__cid = $__cif; } return $__cid; } sub ACACALMIN { return "[\0ACACALMIN()\0]"; } sub ACACALMAX { return "[\0ACACALMAX()\0]"; } sub ACAMOSTIMPATTLABEL { my ($__cin, $__cio) = @_; my $__cik = _za($__cin, 1); my $__cil = _aaj($__cik, 0, $__cio); my $__cim = $__cik->{'_ae'}; return $__cim->[$__cil - 1]->{'_if'}; } sub ACAMOSTIMPATTVALUE { my ($__ciq, $__cir) = @_; my $__cip = _za($__ciq, 1); return _aaj($__cip, 0, $__cir); } sub ACALEASTIMPATTLABEL { my ($__civ, $__ciw) = @_; my $__cis = _za($__civ, 1); my $__cit = _aaj($__cis, 1, $__ciw); my $__ciu = $__cis->{'_ae'}; return $__ciu->[$__cit - 1]->{'_if'}; } sub ACALEASTIMPATTVALUE { my ($__ciy, $__ciz) = @_; my $__cix = _za($__ciy, 1); return _aaj($__cix, 1, $__ciz); } sub _aaj { my ($__cjd, $__cje, $__cjf) = @_; if (authlib9_14_2::_zo($__cjf) eq "") { $__cjf = 1; } my $__cja = @{$__cjd->{'_ae'}}; my $__cjb = 0; my @__cjc = () x $__cja; for ($__cjb = 1; $__cjb <= $__cja; $__cjb++) { $__cjc[$__cjb - 1] = [$__cjb, _aag($__cjd, $__cjb)]; } @__cjc = sort{$b->[1] <=> $a->[1]} @__cjc; if ($__cje) { @__cjc = reverse(@__cjc); } return $__cjc[$__cjf - 1]->[0]; } sub ACABESTLEVELLABEL { my ($__cjj, $__cjk, $__cjl) = @_; my $__cjg = _za($__cjj, 1); my $__cjh = _aak($__cjg, $__cjk, $__cjl, 1); my $__cji = $__cjg->{'_ae'}; return $__cji->[$__cjk - 1]->{'_hf'}->[$__cjh - 1]; } sub ACABESTLEVELVALUE { my ($__cjn, $__cjo, $__cjp) = @_; my $__cjm = _za($__cjn, 1); return _aak($__cjm, $__cjo, $__cjp, 1); } sub ACAWORSTLEVELLABEL { my ($__cjt, $__cju, $__cjv) = @_; my $__cjq = _za($__cjt, 1); my $__cjr = _aak($__cjq, $__cju, $__cjv, 0); my $__cjs = $__cjq->{'_ae'}; return $__cjs->[$__cju - 1]->{'_hf'}->[$__cjr - 1]; } sub ACAWORSTLEVELVALUE { my ($__cjx, $__cjy, $__cjz) = @_; my $__cjw = _za($__cjx, 1); return _aak($__cjw, $__cjy, $__cjz, 0); } sub _aak { my ($__cke, $__ckf, $__ckg, $__ckh) = @_; if (authlib9_14_2::_zo($__ckg) eq "") { $__ckg = 1; } my $__cka = $__cke->{'_ae'}; my $__ckb = @{$__cka->[$__ckf - 1]->{'_hf'}}; my $__ckc = 0; my @__ckd = () x $__ckb; for ($__ckc = 1; $__ckc <= $__ckb; $__ckc++) { $__ckd[$__ckc - 1] = [$__ckc, _aah($__cke, $__ckf, $__ckc)]; } if ($__ckh) { @__ckd = sort{$b->[1] <=> $a->[1]} @__ckd; } else { @__ckd = sort{$a->[1] <=> $b->[1]} @__ckd; } return $__ckd[$__ckg - 1]->[0]; } sub ACASTRICTIMPORTANCE { my ($__cko, $__ckp) = @_; my $__cki = _za($__cko, 1); my $__ckj = 0; my $__ckk = @{$__cki->{'_ae'}}; my $__ckl = 0; my $__ckm = 0; my $__ckn = 0; for ($__ckj = 1; $__ckj <= $__ckk; $__ckj++) { $__ckm = _aal($__cki, $__cko, $__ckj); if ($__ckj == $__ckp) { $__ckl = $__ckm; } $__ckn += $__ckm; } return ($__ckl / ($__ckn * 100)); } sub _aal { my ($__clc, $__cld, $__cle) = @_; my $__ckq = 0; my $__ckr = 0; my $__cks = $__clc->{'_ae'}; ($__ckq, $__ckr) = acalib9_14_2::_ask($__cld, $__cks, $__cle); my $__ckt = $__cks->[$__cle - 1]->{'_pj'}; if ($__ckt == 0) { my $__cku = @{$__cks->[$__cle - 1]->{'_hf'}}; my $__ckv = 0; my $__ckw = 0; my $__ckx = ciwlib9_14_2::GetPreviousACAData($__cld . "_Rating" . $__cle . "_" . $__ckq); my $__cky = ciwlib9_14_2::GetPreviousACAData($__cld . "_Rating" . $__cle . "_" . $__ckr); for ($__ckv = 1; $__ckv <= $__cku; $__ckv++) { $__ckw = ciwlib9_14_2::GetPreviousACAData($__cld . "_Rating" . $__cle . "_" . $__ckv); if ($__ckw == $__ckx) { if (_aah($__clc, $__cle, $__ckv) > _aah($__clc, $__cle, $__ckq)) { $__ckq = $__ckv; } } if ($__ckw == $__cky) { if (_aah($__clc, $__cle, $__ckv) < _aah($__clc, $__cle, $__ckr)) { $__ckr = $__ckv; } } } } my $__ckz = _aah($__clc, $__cle, $__ckq); my $__cla = _aah($__clc, $__cle, $__ckr); my $__clb = $__ckz - $__cla; if ($__clb < 0) { $__clb = 0; } return $__clb; } sub CVAVERSION { return "[\0CVAVERSION()\0]"; } sub ACBCPRICELEVELTEXT { return "[\0ACBCPRICELEVELTEXT()\0]"; } sub ACBCMUSTHAVETEXT { return "[\0ACBCMUSTHAVETEXT()\0]"; } sub ACBCMUSTHAVERULES { return "[\0ACBCMUSTHAVERULES()\0]"; } sub ACBCUNACCEPTABLETEXT { return "[\0ACBCUNACCEPTABLETEXT()\0]"; } sub ACBCUNACCEPTABLERULES { return "[\0ACBCUNACCEPTABLERULES()\0]"; } sub ACBCNUMSCREENEDINCONCEPTS { my ($__clh) = @_; my $__clf = _aao($__clh); my $__clg = acbclib9_14_2::_bix($__clf, $__clh); return @{$__clg}; } sub ACBCNUMSCREENERS { my ($__clk) = @_; if ($__clk) { my $__cli = 0; my $__clj = _aao($__clk); if (exists $__clj->{'_iv'}) { $__cli = $__clj->{'_iv'}; } return $__cli; } else { return "[\0ACBCNUMSCREENERS()\0]"; } } sub ACBCCURRENTSCREENER { my $__cll = $authlib9_14_2::_ajk; my $__clm = 0; if ($__cll =~ m/_Screener(\d+)/i) { $__clm = $1; } return $__clm; } sub ACBCNUMCHOICETASKS { my ($__cln) = @_; if ($__cln) { return _aam($__cln); } else { return "[\0ACBCNUMCHOICETASKS()\0]"; } } sub _aam { my ($__clt) = @_; my $__clo = 0; my $__clp = 0; my $__clq = _aao($__clt); my $__clr = acbclib9_14_2::_bix($__clq, $__clt); $__clp = @{$__clr}; if (exists $__clq->{'_fx'}) { $__clp++; } if (exists $__clq->{'_hr'}) { my $__cls = $__clq->{'_hr'}; if ($__clp > $__cls) { $__clp = $__cls; } if ($__clp) { $__clo = acbclib9_14_2::_bhz($__clp, $__clq); } } return $__clo; } sub ACBCCURRENTCHOICETASK { my $__clu = $authlib9_14_2::_ajk; my $__clv = 0; if ($__clu =~ m/_ChoiceTask(\d+)/i) { $__clv = $1; } return $__clv; } sub ACBCNUMCALIBRATIONS { my ($__cly) = @_; if ($__cly) { my $__clw = _aao($__cly); my $__clx = acbclib9_14_2::_biy($__clw, $__cly); my ($__clz, $__cma, $__cmb) = acbclib9_14_2::_biu($__clw, $__cly); return acbclib9_14_2::_bhy($__clz, $__clx, $__cma, $__cmb, $__clw); } else { return "[\0ACBCNUMCALIBRATIONS()\0]"; } } sub ACBCCURRENTCALIBRATION { my $__cmc = $authlib9_14_2::_ajk; my $__cmd = 0; if ($__cmc =~ m/_Calibration(\d+)/i) { $__cmd = $1; } return $__cmd; } sub ACBCCALIBRATIONTEXT { return "[\0ACBCCALIBRATIONTEXT()\0]"; } sub ACBCISMUSTHAVE { my ($__cmm, $__cmn, $__cmo) = @_; my $__cme = 0; my ($__cmp, $__cmq) = _aan($__cmm, $__cmn); if (exists $__cmp->{$__cmn}) { my $__cmf = $__cmp->{$__cmn}; if (exists $__cmf->{'_amu'}) { my $__cmg = $__cmf->{'_amu'}; my $__cmh = $__cmf->{'_kb'}; my $__cmi = @{$__cmg}; my $__cmj = 0; if ($__cmg->[$__cmo - 1] == 1) { $__cme = 0; } else { my $__cmk = 0; if ($__cmh == 1) { for ($__cmj = 0; $__cmj < $__cmi; $__cmj++) { if ($__cmj == 0 && $__cmg->[$__cmj] == 0) { last; } else { if ($__cmg->[$__cmj] == 0) { $__cmk = $__cmj + 1; last; } } } } elsif ($__cmh == 2) { for ($__cmj = $__cmi - 1; $__cmj >= 0; $__cmj--) { if ($__cmj == ($__cmi - 1) && $__cmg->[$__cmj] == 0) { last; } else { if ($__cmg->[$__cmj] == 0) { $__cmk = $__cmj + 1; last; } } } } else { my $__cml = 0; for ($__cmj = 0; $__cmj < $__cmi; $__cmj++) { if ($__cmg->[$__cmj] == 0) { $__cml++; } } if ($__cml == 1) { $__cmk = $__cmo; } } if ($__cmk == $__cmo) { $__cme = 1; } } } } return $__cme; } sub ACBCISUNACCEPTABLE { my ($__cmu, $__cmv, $__cmw) = @_; my $__cmr = 0; my ($__cmx, $__cmy) = _aan($__cmu, $__cmv); if (exists $__cmx->{$__cmv}) { my $__cms = $__cmx->{$__cmv}; if (exists $__cms->{'_amu'}) { my $__cmt = $__cms->{'_amu'}; if ($__cmt->[$__cmw - 1] == 1) { $__cmr = 1; } } } else { if ($__cmy) { if ($__cmw > $__cmy) { $__cmr = 1; } } } return $__cmr; } sub _aan { my ($__cni, $__cnj) = @_; my $__cmz = _aao($__cni); my $__cna = acbclib9_14_2::_bkd($__cmz, $__cnj); my $__cnb = {}; my $__cnc = {}; my ($__cnk, $__cnl) = acbclib9_14_2::_bih($__cni, 0, $__cmz); acbclib9_14_2::_bid($__cnk, $__cna, $__cnb, $__cnc); my ($__cnm, $__cnb) = acbclib9_14_2::_bii($__cni, 0, $__cmz, $__cnb, $__cnc); my $__cnd = 0; my $__cne = 0; my $__cnf = 0; my $__cng = 0; my $__cnh = 0; foreach $__cnd (@{$__cnk}) { $__cne = $__cnd->[0]; $__cnf = $__cnd->[1]; $__cng = $__cnd->[2]; if ($__cnj == $__cne) { acbclib9_14_2::_bke(24, $__cna, $__cne, $__cnf, $__cng); } } foreach $__cnd (@{$__cnm}) { $__cne = $__cnd->[0]; $__cnf = $__cnd->[1]; $__cng = $__cnd->[2]; if ($__cnj == $__cne) { if (exists $__cna->{$__cnj}) { acbclib9_14_2::_bke(25, $__cna, $__cne, $__cnf, $__cng); } else { $__cnh = $__cnf; } } } return ($__cna, $__cnh); } sub _aao { my ($__cnp) = @_; my $__cnn = $__cnp; if ($__cnn =~ m/(.*?)_/i) { $__cnn = $1; } authlib9_14_2::_yh("acbclib9_14_2.pl"); acbclib9_14_2::_bhl($__cnn); my $__cno = $acbclib9_14_2::_bky->{$__cnn}; return $__cno; } sub _aap { my ($__cnv, $__cnw) = @_; my @__cnq = (); my $__cnr = 0; my $__cns = 0; my $__cnt = 0; my $__cnu = 0; foreach $__cnr (@{$__cnw}) { $__cnu = 0; foreach $__cns (@{$__cnr}) { foreach $__cnt (@{$__cnv}) { if ($__cns->[0] == $__cnt) { $__cnu = 1; last; } } if ($__cnu) { last; } } if (!$__cnu) { push @__cnq, $__cnr; } } return \@__cnq; } sub BYOCONDTEXT { my ($__coe, $__cof, $__cog, $__coh) = @_; my $__cnx = _aao($__coe); my $__cny = ""; if (exists $__cnx->{'_dd'}) { my $__cnz = $__cnx->{'_dd'}->{'_md'}; my $__coa = @{$__cnz}; if ($__cof <= $__coa) { my $__cob = $__cnz->[$__cof - 1]; if (exists $__cob->{'_bn'}) { my $__coc = $__cob->{'_bn'}; my $__cod = ""; if ($__cog || $__coh) { $__cod .= " position:fixed;"; if ($__cog) { $__cod .= " left: " . $__cog . "px;"; } if ($__coh) { $__cod .= " top: " . $__coh . "px;"; } } $__cny = acbclib9_14_2::_bho($__coe . "_BYO", $__coc, $__cof, $__cod, 1); } } } return $__cny; } sub ACBCBYOLABEL { my ($__coj, $__cok) = @_; my $__coi = _aaq($__coj, $__cok); my ($__col, $__com) = _aas($__coj, $__cok, $__coi, 0); if ($__com) { $__com = _zw($__com, 0); } return $__com; } sub ACBCBYOVALUE { my ($__con, $__coo) = @_; return _aaq($__con, $__coo); } sub _aaq { my ($__cor, $__cos) = @_; my $__cop = $__cor . "_BYO_" . $__cos; my $__coq = ""; $__coq = _zo(authlib9_14_2::_ws($__cop)); return $__coq; } sub ACBCWINNERLABEL { my ($__cou, $__cov) = @_; my $__cot = _aar($__cou, $__cov); if ($__cot eq "" || $__cot == 0) { return ""; } my ($__cow, $__cox) = _aas($__cou, $__cov, $__cot, 0); if ($__cox) { $__cox = _zw($__cox, 0); } return $__cox; } sub ACBCWINNERVALUE { my ($__coy, $__coz) = @_; return _aar($__coy, $__coz); } sub _aar { my ($__cph, $__cpi) = @_; my $__cpa = 0; my $__cpb = authlib9_14_2::_aao($__cph); my ($__cpj, $__cpk, $__cpl) = acbclib9_14_2::_biu($__cpb, $__cph); if ($__cpj == -1) { return ""; } my $__cpc = acbclib9_14_2::_bim([$__cpj], $__cph, $__cpb); my $__cpd = acbclib9_14_2::_bil($__cph, $__cpb); my $__cpe = 0; my $__cpf = @{$__cpd}; my $__cpg = 0; for ($__cpe = 0; $__cpe < $__cpf; $__cpe++) { if ($__cpi == $__cpd->[$__cpe]) { $__cpg = $__cpe + 1; last; } } if ($__cpg) { $__cpa = $__cpc->[0]->[$__cpg]; } return $__cpa; } sub _aas { my ($__cpt, $__cpu, $__cpv, $__cpw) = @_; my $__cpm = authlib9_14_2::_aao($__cpt); my $__cpn = 0; my $__cpo = ""; my $__cpp = ""; my $__cpq = ""; my $__cpr = 0; my $__cps = 0; if (exists $__cpm->{'_kf'}) { $__cpn = $__cpm->{'_kf'}->{'_kg'}; } if ($__cpu > 0) { if ($__cpu == $__cpn) { if (!$__cpw) { $__cpp = $__cpv; $__cpp = acbclib9_14_2::_bhw($__cpp, $__cpm); } } else { $__cpr = authlib9_14_2::_adc($__cpm->{'_ac'}); $__cpo = _abv($__cpr->[$__cpu - 1], "", $__cpw); if (exists $__cpm->{'_ad'}->{$__cpu}) { $__cpq = $__cpm->{'_ad'}->{$__cpu}->{'_he'}; $__cps = authlib9_14_2::_adc($__cpq); if ($__cpv) { $__cpp = _abv($__cps->[$__cpv - 1], "", $__cpw); } } } } return ($__cpo, $__cpp); } sub CBCNONE { return "[\0CBCNONE()\0]"; } sub CBCVERSION { return "[\0CBCVERSION()\0]"; } sub CBCDESIGNLEVELVALUE { my ($__cqb, $__cqc, $__cqd) = @_; my $__cpx = 0; my $__cpy = 0; my $__cpz = $__cqc - 1; my $__cqa = $__cqd - 1; $__cpx = _aat($__cqb); if (($__cpx != 0) && ($__cqc > 0) && ($__cqd > 0)) { $__cpy = $__cpx->_bcr($__cpz, $__cqa) + 1; } return $__cpy; } sub CBCATTRIBUTEVALUE { my ($__cqi, $__cqj, $__cqk) = @_; my $__cqe = 0; my $__cqf = 0; my $__cqg = $__cqj - 1; my $__cqh = $__cqk - 1; $__cqe = _aat($__cqi); if (($__cqe != 0) && ($__cqj > 0) && ($__cqk > 0)) { $__cqf = $__cqe->_bcs($__cqg, $__cqh) + 1; } return $__cqf; } sub CBCDESIGNLEVELTEXT { my ($__cqp, $__cqq, $__cqr) = @_; my $__cql = 0; my $__cqm = ""; my $__cqn = $__cqr - 1; my $__cqo = $__cqq - 1; $__cql = _aat($__cqp); if (($__cql != 0) && ($__cqq > 0) && ($__cqr > 0)) { $__cqm = $__cql->_auz($__cqo, $__cqn) } return _zw($__cqm, 1); } sub CBCATTRIBUTELABEL { my ($__cqv, $__cqw) = @_; my $__cqs = ""; my $__cqt = $__cqw -1; if ($__cqv && $__cqw) { my $__cqu = 0; $__cqu = _aat($__cqv); if (($__cqu != 0) && ($__cqw > 0)) { $__cqs = $__cqu->_bcd($__cqt); } } else { $__cqs = "[\0CBCATTRIBUTELABEL()\0]"; } return _zw($__cqs, 1); } sub CBCDESIGNCONCEPTVALUE { my ($__cra, $__crb) = @_; my $__cqx = 0; my $__cqy = 0; my $__cqz = $__crb - 1; $__cqx = _aat($__cra); if (($__cqx != 0) && ($__crb > 0)) { $__cqy = $__cqx->_bdg($__cqz); } return $__cqy; } sub CBCCOLUMNWIDTHCSS { my ($__crf) = @_; my $__crc = 0; my $__crd = ""; $__crc = _aat($__crf); if ($__crc->_auo()) { _zq(343, "CBCColumnWidthCSS not supported in Shelf Facing Display.", "CBCColumnWidthCSS is not supported in shelf facing CBC excercises. Either remove the function call or uncheck the box to use shelf facing display.", $@); } if ($__crc) { my $__cre = "#" . $__crf . "_div"; $__crd = $__crc->_awy(); $__crd =~ s/$__cre//g; } return _zw($__crd, 1); } sub _aat { my ($__crl) = @_; my $__crg = 0; my $__crh = $authlib9_14_2::_akn{"hid_respnum"}; authlib9_14_2::_yh("cbclib9_14_2.pl"); if (exists($authlib9_14_2::_aig{$__crl})) { $__crg = $authlib9_14_2::_aig{$__crl}; } else { my $__cri = {}; my $__crj = 0; my $__crk = tell $authlib9_14_2::_ajm; if (exists($authlib9_14_2::_ahp{$__crl})) { $__crj = $authlib9_14_2::_ahp{$__crl}->{'_iz'}; } else { return 0; } $__cri->{'_if'} = $__crl; $__cri->{'_iz'} = $__crj; $__cri = cbclib9_14_2::new($__cri); $authlib9_14_2::_alh = 1; $__cri->_ve(); $authlib9_14_2::_alh = 0; $__crg = cbcviewgenerator9_14_2::_bbz($__cri->_awq(1)); $authlib9_14_2::_aig{$__crl} = $__crg; if ($__crk > 0) { seek $authlib9_14_2::_ajm, $__crk, 0; } } return $__crg; } sub CBCTOTALTASKS { return "[\0CBCTOTALTASKS()\0]"; } sub CBCCURRENTTASK { return "[\0CBCCURRENTTASK()\0]"; } sub MAXDIFFTOTALSETS { return "[\0MAXDIFFTOTALSETS()\0]"; } sub MAXDIFFCURRENTSET { return "[\0MAXDIFFCURRENTSET()\0]"; } sub MAXDIFFSCORE { my ($__crr, $__crs) = @_; my $__crm = _aaw($__crr); my $__crn = ""; if (defined $__crm) { my $__cro = _aay($__crr . "_1"); my $__crp = _aba($__cro); if (exists $__crp->{$__crs}) { my $__crq = $__crp->{$__crs}; $__crn = $__crm->[$__crq]; } } return $__crn; } sub MAXDIFFRANKATTVALUE { my ($__crw, $__crx) = @_; my $__crt = ""; my $__cru = _aau($__crw, $__crx); if ($__cru) { my $__crv = _aay($__crw . "_1"); $__crt = LISTVALUE($__crv->{'_hj'}, $__cru); } return $__crt; } sub MAXDIFFRANKATTLABEL { my ($__csb, $__csc) = @_; my $__cry = ""; my $__crz = _aau($__csb, $__csc); if ($__crz) { my $__csa = _aay($__csb . "_1"); $__cry = LISTLABEL($__csa->{'_hj'}, $__crz); } return $__cry; } sub MAXDIFFVERSION { return "[\0MAXDIFFVERSION()\0]"; } sub MAXDIFFRLH { my ($__csd) = @_; if (!exists $authlib9_14_2::_akn{"sys_MaxDiff_RLH_". $__csd}) { _aaw($__csd); } return $authlib9_14_2::_akn{"sys_MaxDiff_RLH_". $__csd}; } sub MAXDIFFRSQ { my ($__cse) = @_; if (!exists $authlib9_14_2::_akn{"sys_MaxDiff_RSQ_". $__cse}) { _aaw($__cse); } return $authlib9_14_2::_akn{"sys_MaxDiff_RSQ_". $__cse}; } sub BANDITMAXDIFF { my ($__csy, $__csz, $__cta) = @_; my $__csf = @_; if ($__csf == 2) { $__cta = int($__csz * 5 / 6 + 0.5); } elsif ($__csf == 3) { if ($__cta < 0 || $__cta > $__csz) { authlib9_14_2::_zq(357, "", "Bandit MaxDiff list building error. The NumThompsonItems parameter is out of range."); } } _yh("maxdifflib9_14_2.pl"); my $__csg = _aay($__csy . "_1"); if (!$__csg) { authlib9_14_2::_zq(356, "", "Bandit MaxDiff list building error."); } my $__csh = _acx($__csg->{'_hj'}); my $__csi = $__csg->{'_hj'}; if ($__csh && exists $__csh->{'_jq'}) { $__csi = $__csh->{'_jq'}; $__csh = _acx($__csh->{'_jq'}); } if ($__csz < 3 || $__csz > @{$__csh->{'_gk'}}) { authlib9_14_2::_zq(355, "", "Bandit MaxDiff list building error. The Items parameter is out of range."); } my $__csj = 0; eval { my $__csk = "SELECT * FROM `" . $authlib9_14_2::_akj . "_maxdiff_banditdata` WHERE `exercise_name`=? ORDER BY `parent_list_value`"; my $__csl = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__csk, 0)); $__csl->execute($__csy); $__csj = $__csl->fetchall_arrayref({}); }; if ($@) { authlib9_14_2::_zq(354, "", "Bandit MaxDiff list building error. Error reading the maxdiff_banditdata table."); } _aco($authlib9_14_2::_akn{"hid_respnum"} * 310727); my $__csm = 8 * atan2(1, 1); my $__csn = $__csg->{'_pd'}; foreach my $__cso (@{$__csj}) { my $__csp = $__cso->{"inferred_pair_best"}; my $__csq = $__cso->{"inferred_pair_total"}; my $__csr = $__csp / $__csq; my $__css = ($__cso->{"occurrences"} + $__cso->{"times_included"}) / 2; if ($__css == 0) { $__css = 1; } my $__cst = sqrt(-2 * log(rand() * .99999 + .00001)) * cos($__csm * rand()); $__cst *= sqrt($__csr * (1 - $__csr) / $__css); $__cst += $__csr; $__cso->{"win_percent_draw"} = $__cst; my $__csu = $__cso->{"times_included"}; my $__csv = $__csu + int(rand(6)); $__cso->{"perturbed_times_included"} = $__csv; } my @__csw = sort { $b->{"win_percent_draw"} <=> $a->{"win_percent_draw"} } @{$__csj}; for (my $__csx = 0; $__csx < $__cta; $__csx++) { ADD($__csi, $__csw[0]->{"parent_list_value"}); shift(@__csw); } @__csw = sort { $a->{"perturbed_times_included"} <=> $b->{"perturbed_times_included"} } @__csw; for (my $__csx = 0; $__csx < $__csz - $__cta; $__csx++) { ADD($__csi, $__csw[$__csx]->{"parent_list_value"}); } } sub _aau { my ($__cte, $__ctf) = @_; my $__ctb = ""; my $__ctc = _aaw($__cte); if (defined $__ctc) { my $__ctd = _aav($__cte, $__ctc); $__ctb = $__ctd->[$__ctf - 1]->{'_amv'}; } return $__ctb; } sub _aav { my ($__ctm, $__ctn) = @_; my $__ctg = $authlib9_14_2::_akn{"hid_respnum"}; my $__cth = _aay($__ctm . "_1"); my $__cti = @{$__ctn}; my $__ctj = 0; my @__ctk = (); for ($__ctj = 0; $__ctj < $__cti; $__ctj++) { push @__ctk, {'_amv' => ($__ctj + 1), '_amx' => LISTVALUE($__cth->{'_hj'}, $__ctj + 1), '_amw' => $__ctn->[$__ctj]}; } my @__ctl = sort { if ($a->{'_amw'} == $b->{'_amw'}) { if ($__ctg % 2 == 0) { return $a->{'_amx'} <=> $b->{'_amx'}; } else { return $b->{'_amx'} <=> $a->{'_amx'}; } } else { return $b->{'_amw'} <=> $a->{'_amw'}; } } @__ctk; return \@__ctl; } sub _aaw { my ($__cts) = @_; my $__cto = undef; my $__ctp = undef; my $__ctq = undef; if (exists $authlib9_14_2::_akn{"sys_MaxDiff_Utilities_" . $__cts}) { $__cto = $authlib9_14_2::_akn{"sys_MaxDiff_Utilities_" . $__cts}; } else { _yh("maxdifflib9_14_2.pl"); my $__ctr = _aay($__cts . "_1"); if ($__ctr) { ($__cto, $__ctp, $__ctq) = maxdifflib9_14_2::_bgy($__ctr, $__cts); $authlib9_14_2::_akn{"sys_MaxDiff_Utilities_" . $__cts} = $__cto; $authlib9_14_2::_akn{"sys_MaxDiff_RLH_". $__cts} = $__ctp; $authlib9_14_2::_akn{"sys_MaxDiff_RSQ_". $__cts} = $__ctq; } } return $__cto; } sub MAXDIFFDESIGNLABEL { my ($__ctv, $__ctw) = @_; my $__ctt = 0; my $__ctu = ""; $__ctt = _aax($__ctv, $__ctw); if ($__ctt != 0) { $__ctu .= $__ctt->{'_op'}; } return $__ctu; } sub MAXDIFFDESIGNVALUE { my ($__ctz, $__cua) = @_; my $__ctx = 0; my $__cty = ""; $__ctx = _aax($__ctz, $__cua); if ($__ctx != 0) { $__cty .= $__ctx->{'_pt'}; } return $__cty; } sub _aax { my ($__cuk, $__cul) = @_; my $__cub = 0; my $__cuc = 0; my $__cud = ""; if (exists($authlib9_14_2::_aif{$__cuk})) { $__cuc = $authlib9_14_2::_aif{$__cuk}; } else { my $__cue = _aay($__cuk); if ($__cue) { my $__cuf = 0; my $__cug = _aaz($__cue); my $__cuh = 0; _yh("maxdifflib9_14_2.pl"); ($__cuf, $__cuh) = maxdifflib9_14_2::_bgs($__cue, $__cuk, 1); my $__cui = 0; my @__cuj = (); foreach $__cui (@{$__cuf}) { push @__cuj, $__cug->[$__cui]; } $__cuc = \@__cuj; $authlib9_14_2::_aif{$__cuk} = $__cuc; } } if ($__cuc != 0) { $__cub = $__cuc->[$__cul - 1]; } return $__cub; } sub _aay { my ($__cup) = @_; my $__cum = 0; if (exists($authlib9_14_2::_ahp{$__cup})) { my $__cun = tell $authlib9_14_2::_ajm; my $__cuo = $authlib9_14_2::_ahp{$__cup}->{'_iz'}; seek $authlib9_14_2::_ajm, $__cuo, 0; $__cum = authlib9_14_2::_zi(0); if ($__cun > 0) { seek $authlib9_14_2::_ajm, $__cun, 0; } } return $__cum; } sub _aaz { my ($__cus) = @_; my $__cuq = $__cus->{'_hj'}; my $__cur = _acy($__cuq); return $__cur; } sub _aba { my ($__cux) = @_; my $__cut = _aaz($__cux); my $__cuu = 0; my %__cuv = (); my $__cuw = 0; foreach $__cuu (@{$__cut}) { $__cuv{$__cuu->{'_pt'}} = $__cuw; $__cuw++; } return \%__cuv; } sub QUOTACELLNAME { my ($__cuy) = @_; return _abb($__cuy); } sub QUOTAGROUPNAME { my ($__cuz) = @_; return _abb($__cuz); } sub _abb { my ($__cvc) = @_; my $__cva = ""; my $__cvb = _zo(authlib9_14_2::_ws($__cvc)); if ($__cvb) { $__cva = _yx($__cvc, $__cvb); } return $__cva; } sub ISQUOTACELLOPEN { my ($__cvd, $__cve) = @_; return _abc($__cvd, $__cve); } sub ISQUOTAGROUPOPEN { my ($__cvf, $__cvg) = @_; return _abc($__cvf, $__cvg); } sub _abc { my ($__cvj, $__cvk) = @_; my $__cvh = 0; my $__cvi = _yy($__cvj); if ($__cvi) { $__cvh = _yt($__cvi, $__cvk) } return $__cvh; } sub QUOTACELLREMAINING { my ($__cvl, $__cvm) = @_; return _abd($__cvl, $__cvm); } sub QUOTAGROUPREMAINING { my ($__cvn, $__cvo) = @_; return _abd($__cvn, $__cvo); } sub _abd { my ($__cvt, $__cvu) = @_; my $__cvp = 0; my $__cvq = _yv($__cvt, 0); if ($__cvq) { my $__cvr = $__cvq->{$__cvu}->{'_amo'}; my $__cvs = $__cvq->{$__cvu}->{'_hi'}; $__cvp = $__cvs - $__cvr; if ($__cvp < 0) { $__cvp = 0; } } return $__cvp; } sub QUOTACELLLIMIT { my ($__cvv, $__cvw) = @_; return _abe($__cvv, $__cvw); } sub QUOTAGROUPLIMIT { my ($__cvx, $__cvy) = @_; return _abe($__cvx, $__cvy); } sub _abe { my ($__cwb, $__cwc) = @_; my $__cvz = 0; my $__cwa = _yv($__cwb, 0); if ($__cwa) { $__cvz = $__cwa->{$__cwc}->{'_hi'}; } return $__cvz; } sub QUOTACELLCOMPLETES { my ($__cwd, $__cwe) = @_; return _abf($__cwd, $__cwe); } sub QUOTAGROUPCOMPLETES { my ($__cwf, $__cwg) = @_; return _abf($__cwf, $__cwg); } sub _abf { my ($__cwj, $__cwk) = @_; my $__cwh = 0; my $__cwi = _yv($__cwj, 0); if ($__cwi) { $__cwh = $__cwi->{$__cwk}->{'_amo'}; } return $__cwh; } sub AREALLQUOTACELLSCLOSED { my ($__cwl) = @_; return _abg($__cwl); } sub AREALLQUOTAGROUPSCLOSED { my ($__cwm) = @_; return _abg($__cwm); } sub _abg { my ($__cws) = @_; my $__cwn = 0; my $__cwo = _yy($__cws); if ($__cwo) { my $__cwp = $__cwo->{'_uf'}->{'_lf'}; my $__cwq = 0; my $__cwr = 0; foreach $__cwq (@{$__cwp}) { if (_yt($__cwo, $__cwq->{'_pt'})) { $__cwr = 1; last; } } if (!$__cwr) { $__cwn = 1; } } return $__cwn; } sub AREALLQUOTASCLOSED { my $__cwt = 0; if ($authlib9_14_2::_aja) { _ys(); if ($authlib9_14_2::_ala) { my $__cwu = $authlib9_14_2::_ala->{'_lg'}; my $__cwv = ""; my $__cww = 0; foreach $__cwv (@{$__cwu}) { if (_abg($__cwv) == 0) { $__cww = 1; last; } } if (!$__cww) { $__cwt = 1; } } } return $__cwt; } sub AREANYQUOTASCLOSED { my $__cwx = 0; if ($authlib9_14_2::_aja) { _ys(); if ($authlib9_14_2::_ala) { my $__cwy = $authlib9_14_2::_ala->{'_lg'}; my $__cwz = ""; foreach $__cwz (@{$__cwy}) { if (_abg($__cwz)) { $__cwx = 1; last; } } } } return $__cwx; } sub FLOOR { my ($__cxa) = @_; return _abh($__cxa); } sub _abh { my ($__cxc) = @_; my $__cxb = int($__cxc); if ($__cxc < 0 && $__cxc != $__cxb) { return $__cxb - 1; } return $__cxb; } sub CEILING { my ($__cxd) = @_; return _abi($__cxd); } sub _abi { my ($__cxe) = @_; if ($__cxe > int($__cxe)) { $__cxe = int($__cxe + 1); } elsif ($__cxe < 0) { $__cxe = int($__cxe); } return $__cxe; } sub ROUND { my ($__cxf, $__cxg) = @_; return _abj($__cxf, $__cxg); } sub _abj { my ($__cxo, $__cxp) = @_; my $__cxh = @_; my $__cxi = 0; my $__cxj = ""; if ($__cxo =~ m/^(-)(.*?)$/) { $__cxj = $1; $__cxo = $2; } if ($__cxh == 1 || $__cxp < 0) { $__cxp = 0; } if ($__cxo =~ m/\.(\d*?)$/) { my $__cxk = $1; my $__cxl = substr $__cxk, $__cxp, 1; if ($__cxl == 5) { my $__cxm = 1 / (10 ** ($__cxp + 5)); $__cxo += $__cxm; } } $__cxo = sprintf("%." . $__cxp . "f", $__cxo); if ($__cxp > 0) { if ($__cxo !~ m/\./) { $__cxo .= "."; } my $__cxn = 0; if ($__cxo =~ m/^(.*?)\.(.*?)$/) { $__cxn = length($2); } while($__cxn < $__cxp) { $__cxo .= "0"; $__cxn++; } } if ($__cxo != 0) { $__cxo = $__cxj . $__cxo; } return $__cxo; } sub ROUNDTONUMBER { my ($__cxq, $__cxr, $__cxs) = @_; return _abk($__cxq, $__cxr, $__cxs); } sub _abk { my ($__cyb, $__cyc, $__cyd) = @_; my $__cxt = 0; if ($__cyc > 0) { my $__cxu = 0; my $__cxv = 0; my $__cxw = 0; my $__cxx = ""; if ($__cyb =~ m/^(-)(.*?)$/) { $__cxx = $1; $__cyb = $2; } if ($__cyb =~ m/\.(\d+)/) { $__cxv = length($1); } elsif ($__cyb =~ m/[Ee][-+]0*(\d+)/) { $__cxv = $1; } if ($__cyc =~ m/\.(\d+)/) { $__cxw = length($1); } elsif ($__cyc =~ m/[Ee][-+]0*(\d+)/) { $__cxw = $1; } if ($__cxw > $__cxv) { $__cxu = $__cxw; } else { $__cxu = $__cxv; } if ($__cxu) { $__cyc *= 10 ** $__cxu; $__cyc = sprintf("%.0f", $__cyc); $__cyb *= 10 ** $__cxu; $__cyb = sprintf("%.0f", $__cyb); } my $__cxy = ($__cyb % $__cyc); my $__cxz = $__cyc / 2; if ($__cxy >= $__cxz) { my $__cya = int($__cyb / $__cyc); $__cya++; $__cxt = $__cya * $__cyc; } else { $__cxt = $__cyb - $__cxy; } if ($__cxu > 0) { $__cxt /= 10 ** $__cxu; $__cxt = sprintf("%." . $__cxu . "f", $__cxt); } $__cxt = $__cxx . $__cxt; } else { $__cxt = $__cyb; } if ($__cyd > -1) { $__cxt = _abj($__cxt, $__cyd); } return $__cxt; } sub FORMATNUMBER { my ($__cye, $__cyf, $__cyg, $__cyh) = @_; return _abl($__cye, $__cyf, $__cyg, $__cyh); } sub _abl { my ($__cyo, $__cyp, $__cyq, $__cyr) = @_; my $__cyi = ""; $__cyo = _zo($__cyo); if ($__cyo =~ m/^(-)(.*?)$/) { $__cyi = $1; $__cyo = $2; } $__cyr = int($__cyr); if ($__cyr < 0) { $__cyr = 0; } $__cyo = _abj($__cyo, $__cyr); my $__cyj = ""; my $__cyk = $__cyo; if ($__cyo =~ m/(\d*?)\.(.*?)$/) { $__cyk = $1; $__cyj = $2; if ($__cyq eq "") { $__cyq = "."; } $__cyj = $__cyq . $__cyj; } if ($__cyp) { my $__cyl = length($__cyk); my $__cym = ""; while ($__cyl > 3) { $__cym = $__cyp . substr($__cyk, $__cyl - 3 , 3) . $__cym; $__cyl -= 3; } $__cyk = substr($__cyk, 0, $__cyl) . $__cym; } my $__cyn = $__cyk . $__cyj; if ($__cyn != 0) { $__cyn = $__cyi . $__cyn; } return $__cyn; } sub _abm { my ($__cys) = @_; $__cys = authlib9_14_2::_abo($__cys); if ($__cys =~ m/^(0+)(.*)$/) { if (length($1) == length($__cys)) { $__cys = 0; } else { $__cys = $2; if ($__cys =~ m/^0*\.0*$/) { $__cys = 0; } } } $__cys = _abn($__cys); return $__cys; } sub _abn { my ($__cyu) = @_; if ($__cyu) { if ($__cyu =~ m/^-?\d*\.(\d+)$/o) { my $__cyt = $1; if (length($__cyt) > 15) { $__cyu = sprintf("%.15f", $__cyu); } $__cyu = _abp($__cyu); } } return $__cyu; } sub _abo { my ($__cyv) = @_; $__cyv =~ s/,/./; return $__cyv; } sub _abp { my ($__cyy) = @_; if ($__cyy =~ m/^(-?\d*)\.(\d+)$/o) { my $__cyw = $1; my $__cyx = $2; $__cyx =~ s/0+$//; if (length($__cyx)) { $__cyw .= "." . $__cyx; } $__cyy = $__cyw; if (length($__cyy) == 0) { $__cyy = 0; } } return $__cyy; } sub POWER { my ($__cyz, $__cza) = @_; return $__cyz ** $__cza; } sub MID { my ($__czb, $__czc, $__czd) = @_; if ($__czc < 1) { $__czc = 1; } return substr($__czb, $__czc - 1, $__czd); } sub TEXTEXISTS { my ($__czg, $__czh) = @_; my $__cze = 0; my $__czf = index(uc($__czg), uc($__czh)); if ($__czf > -1) { $__cze = 1; } return $__cze; } sub ENCODEFORURL { my ($__czi) = @_; return _abq($__czi); } sub _abq { my ($__czo) = @_; my @__czj = split("", $__czo); my $__czk = ""; my @__czl = (); my $__czm = ""; my $__czn = 0; foreach $__czk (@__czj) { $__czn = ord($__czk); if (($__czk =~ m/\w/) || $__czn < 32 || $__czn > 126) { $__czm = $__czk; } else { $__czm = "%" . uc(sprintf "%lx", $__czn); } push @__czl, $__czm; } return join("", @__czl); } sub ISNUMBER { my ($__czp) = @_; return _abr($__czp); } sub _abr { my ($__czq) = @_; $__czq = _zo($__czq); $__czq =~ s/^-//; if (exists $authlib9_14_2::_akp->{'_dq'}) { if ($__czq =~ m/\./) { $__czq =~ s/\.//; } else { $__czq =~ s/,//; } } else { $__czq =~ s/\.//; } if ($__czq =~ m/^(\d+)$/) { return 1; } else { return 0; } } sub SHOWN { my ($__czy) = @_; my $__czr = $authlib9_14_2::_akn{"hid_respnum"}; my ($__czz, $__daa, $__dab) = authlib9_14_2::_abt($__czy); my @__czs = @{authlib9_14_2::_xy($__czr, {"limbo" => 0})}; @__czs = grep { $_->{"quest_name"} =~ m/^$__czz\b/ } @__czs; for (my $__czt = 0; $__czt < @__czs; $__czt++) { if ($__czy eq $__czs[$__czt]->{"quest_name"} || exists $__czs[$__czt]->{"data"}->{$__czy}) { return 1; } } if ($__dab eq "") { if (exists $authlib9_14_2::_akn{"hid_loops"}) { authlib9_14_2::_adr(); my $__czu = 0; if (exists $authlib9_14_2::_ahp{$__czz}) { my $__czv = $authlib9_14_2::_ahp{$__czz}; $__czu = $__czv->{'_ji'}; } else { $__czu = _aad(); } my $__czw = $authlib9_14_2::_ako->[$__czu - 1]; my $__czx = ciwlib9_14_2::_qz($authlib9_14_2::_akn{"hid_loops"}); my ($__dac, $__dad) = ciwlib9_14_2::_rb($__czw, $__czx); if ($__dac) { $__czy .= $__dac; for (my $__czt = 0; $__czt < @__czs; $__czt++) { if ($__czy eq $__czs[$__czt]->{"quest_name"} || exists $__czs[$__czt]->{"data"}->{$__czy}) { return 1; } } } } } return 0; } sub ANSWERED { my ($__daf) = @_; my $__dae = 0; if (_zo(authlib9_14_2::_ws($__daf)) ne "") { $__dae = 1; } return $__dae; } sub LOG10 { my ($__dag) = @_; return (log($__dag) / log(10)); } sub LOOPVALUE { my ($__dah) = @_; my ($__dai, $__daj, $__dak) = _abs($__dah); return $__daj; } sub LOOPLABEL { my ($__dal) = @_; my ($__dam, $__dan, $__dao) = _abs($__dal); return $__dao; } sub LOOPITERATION { my ($__dap) = @_; my ($__daq, $__dar, $__das) = _abs($__dap); return $__daq; } sub _abs { my ($__dbb) = @_; my $__dat = ""; my $__dau = ""; my $__dav = ""; authlib9_14_2::_adr(); my $__daw = ciwlib9_14_2::_qz($authlib9_14_2::_akn{"hid_loops"}); my $__dax = _aad(); if ($__dax < 2 && exists $authlib9_14_2::_akn{"hid_loops_restart_page"}) { $__dax = $authlib9_14_2::_akn{"hid_loops_restart_page"}; } my $__day = $authlib9_14_2::_ako->[$__dax - 1]; if (exists $__day->{'_hm'}) { if ($__dbb eq "") { $__dbb = $__day->{'_hm'}->[0]; } if (exists $__daw->{$__dbb}) { $__dat = $__daw->{$__dbb}; my $__daz = $authlib9_14_2::_ame->{$__dbb}->{'_hj'}; my $__dba = authlib9_14_2::_acy($__daz); if ($__dba) { $__dau = $__dba->[$__dat - 1]->{'_pt'}; $__dav = $__dba->[$__dat - 1]->{'_op'}; } } } return ($__dat, $__dau, $__dav); } sub SETVALUE { my ($__dbg, $__dbh) = @_; if ($authlib9_14_2::_ajr || $authlib9_14_2::_amg) { return ""; } my $__dbc = ciwlib9_14_2::_rj(); if ($__dbc) { authlib9_14_2::_wt($__dbg, $__dbh); my ($__dbi, $__dbj) = _xk($__dbg); eval { my $__dbd = "UPDATE `" . $authlib9_14_2::_akj . "_data" . $__dbi . "` SET `" . $__dbg . "` = ? WHERE `sys_RespNum` = " . $__dbc; my $__dbe = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__dbd, 0)); $__dbe->execute(_wh($__dbh)); }; if ($@) { my $__dbf = "Database error. Error in \"SetValue\" function. Cannot update data row."; if ($__dbi == 0) { $__dbf .= " Cannot find \"" . $__dbg . "\" in database."; } authlib9_14_2::_zq(269, "Database error.", $__dbf, $@); } $authlib9_14_2::_ake->commit(); } return ""; } sub GETVALUE { my ($__dbk) = @_; return _ws($__dbk); } sub SCREENWIDTH { return _aer(); } sub _abt { my ($__dbo) = @_; my $__dbl = ""; if ($__dbo =~ m/(.*?)(\..*?)$/) { $__dbo = $1; $__dbl = $2; } my $__dbm = $__dbo; my $__dbn = ""; if ($__dbo =~ m/^sys_/i) { if ($__dbo =~ m/^(sys_.*?)_(.*?)$/i) { $__dbm = $1; $__dbn = $2; } } elsif ($__dbo =~ m/_/) { if ($__dbo =~ m/^(.*?_(\d+|\*))_(b|w|anchor)$/i) { $__dbm = $1; $__dbn = $3; $__dbm =~ s/_\*$/_1/; } elsif ($__dbo =~ m/^(.*?)_(.*?)$/i) { $__dbm = $1; $__dbn = $2; } if (!exists $authlib9_14_2::_ahp{$__dbm}) { if ($__dbo =~ m/^(.*?_.*?)_(.*?)$/i) { $__dbm = $1; $__dbn = $2; } if (!exists $authlib9_14_2::_ahp{$__dbm}) { $__dbm = $__dbo; $__dbn = ""; } } } return ($__dbm, $__dbn, $__dbl); } sub _abu { my ($__ddd, $__dde, $__ddf, $__ddg) = @_; my $__dbp = 0; my $__dbq = 0; my $__dbr = ""; my $__dbs = 0; my $__dbt = 0; my $__dbu = ""; my $__dbv = ""; my $__dbw = 0; my $__dbx = 0; my $__dby = 0; my $__dbz = ""; my $__dca = 0; ($__ddd, $__dbu, $__dbv) = authlib9_14_2::_abt($__ddd); $__dbu = lc($__dbu); $__dbp = $authlib9_14_2::_ahp{$__ddd}; $__dbq = $__dbp->{'_pj'}; if ($__dbq == &authlib9_14_2::_ANG) { $__dbt = tell $authlib9_14_2::_ajm; $__dbs = $__dbp->{'_iz'}; seek $authlib9_14_2::_ajm, ($__dbs), 0; my $__dcb = _zi(0); if ($__dcb->{'_pj'} eq "check") { if ($__ddg) { $__dbw = _adc($__dcb->{'_hj'}); } else { $__dbw = _acy($__dcb->{'_hj'}, $__dbv); } if ($__dde && $__dbw) { $__dbx = @{$__dbw}; for ($__dby = 0; $__dby < $__dbx; $__dby++) { if ($__dbw->[$__dby]->{'_pt'} == $__dbu) { $__dbr = _abv($__dbw->[$__dby], "", $__ddg); last; } } } elsif ($__dbu eq "") { my $__dcc = ""; my @__dcd = (); my $__dce = ""; if ($__dbw) { $__dbx = @{$__dbw}; for ($__dby = 0; $__dby < $__dbx; $__dby++) { $__dca = $__dbw->[$__dby]->{'_pt'}; $__dcc = $__ddd . "_" . $__dca . $__dbv; $__dce = authlib9_14_2::_ws($__dcc); if ($__dce ne "") { push @__dcd, {'_pt'=>$__dca, '_amz'=>_zo($__dce)}; } } } $__dbr = \@__dcd; } } else { if ($__dde) { if ($__ddf ne "") { $__dbw = _adc($__dcb->{'_hj'}); $__dbz = $__ddd . "_" . $__ddf . "_other" . $__dbv; $__dbr = _abv($__dbw->[$__ddf - 1], $__dbz, $__ddg); } } else { $__dbw = _acy($__dcb->{'_hj'}, $__dbv); $__dbr = _abz($__dbw, $__ddd . $__dbv); } } seek $authlib9_14_2::_ajm, $__dbt, 0; } elsif ($__dbq == &authlib9_14_2::_ANS) { my $__dcf = 0; my $__dcg = 0; my $__dch = ""; my $__dci = 0; my $__dcj = 0; my $__dck = 0; my $__dcl = 0; my $__dcm = 0; my $__dcn = 0; my $__dco = ""; my $__dcp = 0; my $__dcq = $__ddd . "_" . $__dbu; $__dbt = tell $authlib9_14_2::_ajm; $__dbs = $__dbp->{'_iz'}; seek $authlib9_14_2::_ajm, ($__dbs), 0; $__dcf = _zi(0); $__dch = $__dcq; if ($__dch =~ m/(.*?)_r(\d+)/) { $__dcm = $2; } if ($__dch =~ m/(.*?)_c(\d+)/) { $__dcn = $2; } if ($__dcf->{'_pu'} eq "cols") { $__dch =~ s/_r\d+//; $__dci = $__dcn; $__dcp = $__dcm; } else { $__dch =~ s/_c\d+//; $__dci = $__dcm; $__dcp = $__dcn; } $__dcj = $__dcf->{'_pv'}->[$__dci - 1]; if ($__dcf->{'_pu'} eq "cols") { $__dco = $__dcf->{'_mw'}; } else { $__dco = $__dcf->{'_co'}; } if ($__dcj->{'_if'} eq $__dch) { $__dck = ref($__dcj); } if ($__dck eq "RadioVar") { if ($__dde) { if ($__ddf ne "") { $__dbw = _adc($__dco); $__dbz = $__dcq . "_other"; if ($__dbz =~ m/_r\d+/) { $__dbz =~ s/_r\d+/_c$__ddf/; } elsif ($__dbz =~ m/_c\d+/) { $__dbz =~ s/_c\d+/_r$__ddf/; } $__dbr = _abv($__dbw->[$__ddf - 1], $__dbz, $__ddg); } } else { $__dbr = _abz(_acy($__dco, $__dbv), $__dcq . $__dbv); } } else { if (!$__dde && $__dbu !~ m/_/) { $__dbr = _abx($__dch, $__dcf, _acy($__dco, $__dbv), $__dbv); } else { if (($__dck eq "ComboVar") || (($__dck eq "RankVar") && ($__dcj->{'_pj'} eq "combo"))) { $__dbw = _adc($__dcj->{'_hj'}); if ($__dde) { if ($__ddf ne "") { $__dbz = $__dcq . "_" . $__ddf . "_other"; $__dbr = _abv($__dbw->[$__ddf - 1], $__dbz, $__ddg); } } else { $__dbr = _abz(_acy($__dcj->{'_hj'}, $__dbv), $__dcq . $__dbv); } } elsif (!$__dde) { $__dbr = $__ddf; } } } seek $authlib9_14_2::_ajm, $__dbt, 0; } elsif ($__dbq == &authlib9_14_2::_ANT || $__dbq == &authlib9_14_2::_ANU) { $__dbt = tell $authlib9_14_2::_ajm; $__dbs = $__dbp->{'_iz'}; seek $authlib9_14_2::_ajm, ($__dbs), 0; my $__dcr = _zi(0); if ($__dde) { if ($__ddg) { $__dbw = _adc($__dcr->{'_hj'}); } else { $__dbw = _acy($__dcr->{'_hj'}, $__dbv); } if ($__dbw) { $__dbx = @{$__dbw}; for ($__dby = 0; $__dby < $__dbx; $__dby++) { if ($__dbw->[$__dby]->{'_pt'} == $__dbu) { $__dbr = _abv($__dbw->[$__dby], "", $__ddg); last; } } } } elsif ($__dbu eq "") { my $__dcc = ""; my @__dcd = (); my $__dce = ""; $__dbw = _acy($__dcr->{'_hj'}, $__dbv); if ($__dbw) { $__dbx = @{$__dbw}; for ($__dby = 0; $__dby < $__dbx; $__dby++) { $__dca = $__dbw->[$__dby]->{'_pt'}; $__dcc = $__ddd . "_" . $__dca; $__dce = authlib9_14_2::_ws($__dcc); if ($__dce ne "") { push @__dcd, {'_pt'=>$__dca, '_amz'=>_zo($__dce)}; } } } $__dbr = \@__dcd; } seek $authlib9_14_2::_ajm, $__dbt, 0; } elsif ($__dbq == &authlib9_14_2::_ANW) { $__dbt = tell $authlib9_14_2::_ajm; $__dbs = $__dbp->{'_iz'}; seek $authlib9_14_2::_ajm, ($__dbs), 0; my $__dcs = _zi(0); if ($__dde) { if (exists $__dcs->{'_eg'} && $__dbu eq "anchor") { if ($__ddf ne "") { my $__dct = $__dcs->{'_eg'}->{'_mo'}; my $__dcu = 0; foreach $__dcu(@{$__dct}) { if ($__dcu->{'_pt'} == $__ddf) { $__dbr = $__dcu->{'_op'}; last; } } } } elsif ($__ddf ne "") { $__dbw = _adc($__dcs->{'_hj'}); $__dbr = _abv($__dbw->[$__ddf - 1], "", $__ddg); } } else { $__dbw = _acy($__dcs->{'_hj'}, $__dbv); if ($__dbw) { my $__dcv = 0; my $__dcw = 0; my $__dcx = 0; _yh("maxdifflib9_14_2.pl"); ($__dcv, $__dcx) = maxdifflib9_14_2::_bgs($__dcs, $__ddd, 1); my $__dcy = 0; my @__dcz = (); foreach $__dcy (@{$__dcv}) { push @__dcz, $__dbw->[$__dcy]; } $__dbr = _abz(\@__dcz, $__ddd . "_" . $__dbu); } } seek $authlib9_14_2::_ajm, $__dbt, 0; } elsif ($__dbq == &authlib9_14_2::_ANY) { if ($__dde) { my ($__ddh, $__ddi) = authlib9_14_2::_aas($__ddd, $__dbu, $__ddf, $__ddg); $__dbr = $__ddi; } else { my $__dda = authlib9_14_2::_aao($__ddd); my $__ddb = $__dbu; if (exists $__dda->{'_ad'}->{$__ddb}) { my $__ddc = $__dda->{'_ad'}->{$__ddb}->{'_he'}; $__dbw = _acy($__ddc, $__dbv); $__dbr = _abz($__dbw, $__ddd . "_" . $__ddb); } } } return ($__dbr, $__dbp); } sub _abv { my ($__ddl, $__ddm, $__ddn) = @_; my $__ddj = ""; if ($__ddn) { $__ddj = _abw($__ddl); } else { my $__ddk = _zo(authlib9_14_2::_ws($__ddm)); if ($__ddm && exists($__ddl->{'_jg'}) && $__ddk) { $__ddj = $__ddk; } else { $__ddj = $__ddl->{'_op'}; } } return $__ddj; } sub _abw { my ($__ddp) = @_; my $__ddo = ""; if (exists $__ddp->{'_k'}) { $__ddo = $__ddp->{'_k'}; } else { $__ddo = $__ddp->{'_op'}; } $__ddo = _zo($__ddo); return $__ddo; } sub _abx { my ($__ddw, $__ddx, $__ddy, $__ddz) = @_; my $__ddq = 0; my $__ddr = 0; my $__dds = ""; my @__ddt = (); my $__ddu = 0; my $__ddv = ""; if ($__ddy) { $__ddr = @{$__ddy}; } for ($__ddq = 0; $__ddq < $__ddr; $__ddq++) { $__dds = $__ddw; $__ddu = $__ddy->[$__ddq]->{'_pt'}; if ($__ddx->{'_pu'} eq "cols") { $__dds =~ s/(_c\d+)/_r$__ddu$1/; } else { $__dds .= "_c" . $__ddu; } $__dds .= $__ddz; $__ddv = _zo(authlib9_14_2::_ws($__dds)); if ($__ddv ne "" || _ael($__dds)) { push @__ddt, {'_pt'=>$__ddu, '_amz'=>$__ddv}; } } return \@__ddt; } sub _aby { my ($__dee, $__def, $__deg, $__deh) = @_; my $__dea = ""; my $__deb = 0; if ($__def != 0) { my $__dec = @{$__def}; $__deb = 1; if ($__deg eq "") { if ($__deh =~ m/^values$/i) { $__dea = "[" . join(",", map{$_->{'_pt'}} @{$__def}) . "]"; } elsif ($__deh =~ m/^labels$/i) { $__dea = "[" . join(",", map{"'" . $_->{'_op'} . "'"} @{$__def}) . "]"; } elsif ($__deh =~ m/^length$/i) { $__dea = $__dec; } } else { if ($__deh =~ m/^value$/i) { if (($__deg > 0) && ($__deg <= $__dec)) { $__dea = $__def->[$__deg - 1]->{'_pt'}; } } elsif ($__deh =~ m/^label$/i) { if (($__deg > 0) && ($__deg <= $__dec)) { $__dea = $__def->[$__deg - 1]->{'_op'}; } } elsif ($__deh =~ m/^hasParentItem$/i) { my $__ded = 0; $__dea = 0; for ($__ded = 0 ; $__ded < $__dec; $__ded++) { if ($__def->[$__ded]->{'_pt'} == $__deg) { $__dea = 1; last; } } } } } return($__deb, $__dea); } sub _abz { my ($__deo, $__dep) = @_; my @__dei = (); my $__dej = authlib9_14_2::_ws($__dep); if ($__deo && ($__dej ne "" || _ael($__dep))) { my $__dek = 0; my $__del = @{$__deo}; my $__dem = 0; my $__den = 0; for ($__dek = 0; $__dek < $__del; $__dek++) { $__dem = $__deo->[$__dek]->{'_pt'}; $__den = 0; if ($__dej == $__dem) { $__den = 1; } push @__dei, {'_pt'=>$__dem, '_amz'=>$__den}; } } return \@__dei; } sub _aca { my @__deq = ( { "name" => "time_stamp", "sql_info" => "INT NOT NULL" }, { "name" => "type", "sql_info" => "INT NOT NULL" }, { "name" => "error_number", "sql_info" => "INT" }, { "name" => "message", "sql_info" => "TEXT" }, { "name" => "system_error", "sql_info" => "TEXT" }, { "name" => "form_input", "sql_info" => "TEXT" }, { "name" => "ssi_version", "sql_info" => "TEXT NOT NULL" }, { "name" => "ip_address", "sql_info" => "TEXT" }, { "name" => "user_agent", "sql_info" => "TEXT" } ); return \@__deq; } sub _acb { my $__der = _aca(); my $__des = 0; my @__det = (); foreach $__des(@{$__der}) { push(@__det, "`" . $__des->{"name"} . "` " . $__des->{"sql_info"}); } return join(",", @__det); } sub _acc { my $__deu = _aca(); my $__dev = 0; my @__dew = (); my @__dex = (); foreach $__dev(@{$__deu}) { push(@__dew, "`" . $__dev->{"name"} . "`"); push(@__dex, "?"); } return (join(",", @__dew), join(",", @__dex)); } sub _acd { my $__dey = _aca(); my $__dez = 0; my @__dfa = (); foreach $__dez(@{$__dey}) { push(@__dfa, "\"" . $__dez->{"name"} . "\""); } return join(",", @__dfa); } sub _ace { my ($__dff) = @_; my $__dfb = _aca(); my $__dfc = 0; my @__dfd = (); my $__dfe = ""; foreach $__dfc(@{$__dfb}) { $__dfe = ""; if (exists $__dff->{$__dfc->{"name"}}) { $__dfe = _acj($__dff->{$__dfc->{"name"}}); $__dfe =~ s/\n//g; } push(@__dfd, $__dfe); } return join(",", @__dfd); } sub _acf { my ($__dfk) = @_; my $__dfg = _aca(); my $__dfh = 0; my @__dfi = (); my $__dfj = ""; foreach $__dfh(@{$__dfg}) { $__dfj = undef; if (exists $__dfk->{$__dfh->{"name"}}) { $__dfj = authlib9_14_2::_wh($__dfk->{$__dfh->{"name"}}); } push(@__dfi, $__dfj); } return \@__dfi; } sub _acg { my ($__dfs, $__dft, $__dfu, $__dfv, $__dfw) = @_; my $__dfl = ""; my $__dfm = $authlib9_14_2::_aia; my $__dfn = ""; my %__dfo = (); $__dfo{"time_stamp"} = time(); $__dfo{"type"} = $__dfs; $__dfo{"error_number"} = $__dft; $__dfo{"message"} = substr($__dfu, 0, 10000); $__dfo{"system_error"} = substr($__dfv, 0, 10000); $__dfo{"ip_address"} = _aac(); $__dfm =~ s/_/./g; $__dfo{"ssi_version"} = $__dfm; if (exists($ENV{"HTTP_USER_AGENT"})) { $__dfn = $ENV{"HTTP_USER_AGENT"}; } $__dfo{"user_agent"} = substr($__dfn, 0, 10000); my $__dfp = ""; my @__dfq = (); foreach $__dfp (sort keys(%authlib9_14_2::_akn)) { push(@__dfq, $__dfp . "=>" . $authlib9_14_2::_akn{$__dfp}); } $__dfo{"form_input"} = join(" | ", @__dfq); my $__dfr = 0; if (!$__dfw) { $__dfr = _ach(\%__dfo, 0); } if ($__dfw || $__dfr) { _aci(\%__dfo); } } sub _ach { my ($__dgf, $__dgg) = @_; my ($__dgh, $__dgi) = _acc(); my $__dfx = _acf($__dgf); my $__dfy = 0; eval { my $__dfz = "INSERT INTO `" . $authlib9_14_2::_akj . "_survey_log` (" . $__dgh . ") VALUES (" . $__dgi . ")"; my $__dga = $authlib9_14_2::_ake->prepare(authlib9_14_2::_wn($__dfz, 0)); $__dga->execute(@{$__dfx}); $__dga->finish; }; if ($@) { $__dfy = 1; my $__dgb = 332; my $__dgc = "Cannot insert into survey_log table."; my $__dgd = _zo($@); my $__dge = _acv($__dgf); $__dge->{"error_number"} = $__dgb; $__dge->{"message"} = $__dgc; $__dge->{"system_error"} = $__dgd; _aci($__dge); } elsif ($authlib9_14_2::_ake) { $authlib9_14_2::_ake->commit(); } return $__dfy; } sub _aci { my ($__dgl) = @_; my $__dgj = $authlib9_14_2::_ahv{'_aml'}; if ($__dgj eq "") { $__dgj = "../admin/"; } my $__dgk = $__dgj . "error_log.cgi"; my ($__dgm, $__dgn) = authlib9_14_2::_yg($__dgk, "append", 0, 0); if (!$__dgn) { authlib9_14_2::_zd($__dgm, 1); print $__dgm _ace($__dgl) . "\n"; close $__dgm; } } sub _acj { my ($__dgo) = @_; $__dgo =~ s/"/""/g; return "\"" . $__dgo . "\""; } sub _ack { my ($__dhj, $__dhk, $__dhl, $__dhm) = @_; my $__dgp = 0; my $__dgq = 0; my $__dgr = $__dhj->{'_pu'}; my $__dgs = @{$__dhl}; my $__dgt = @{$__dhm}; my $__dgu = $__dhj->{'_pv'}; my @__dgv = (); my $__dgw = 0; my $__dgx = ""; my $__dgy = ""; my $__dgz = 0; my $__dha = ""; my $__dhb = 0; my $__dhc = 0; my $__dhd = 0; my $__dhe = 0; my $__dhf = 0; my $__dhg = 0; my $__dhh = ""; my $__dhi = 0; if ($__dgr eq "rows") { foreach $__dhd (@{$__dhl}) { $__dhf = $__dhd - 1; $__dgw = _acv($__dgu->[$__dhf]); $__dgx = $__dgw->{'_if'}; $__dha = ref($__dgw); if ($__dha eq "CheckVar") { $__dgw->{'_if'} = $__dgx . "_c*"; $__dgw->{'_iy'} = $__dgt; $__dgw->{'_uh'} = $__dhm; push @__dgv, $__dgw; } elsif ($__dha eq "RadioVar") { push @__dgv, $__dgw; } elsif (($__dhk == 0) && ($__dha eq "RankVar" || $__dha eq "ConsumVar")) { $__dgw->{'_uz'} = $__dgx . "_c*"; $__dgw->{'_amy'} = $__dgt; $__dgw->{'_uh'} = $__dhm; push @__dgv, $__dgw; } else { $__dhi = 0; if (($__dha eq "ConsumVar") && $__dhk) { foreach $__dhe (@{$__dhm}) { $__dhg = $__dhe; $__dgy = $__dgx . "_c" . ($__dhg); if (exists $authlib9_14_2::_akn{$__dgy}) { $__dhh = _zo($authlib9_14_2::_akn{$__dgy}); if ($__dhh ne "") { $__dhi = 1; last; } } } } foreach $__dhe (@{$__dhm}) { $__dhg = $__dhe; $__dgw->{'_if'} = $__dgx . "_c" . ($__dhg); if ($__dhi) { $__dgw->{'_ui'} = 1; } push @__dgv, _acv($__dgw); } } } } else { foreach $__dhe (@{$__dhm}) { $__dhg = $__dhe - 1; $__dgw = _acv($__dgu->[$__dhg]); $__dgx = $__dgw->{'_if'}; $__dha = ref($__dgw); if ($__dha eq "CheckVar") { $__dgy = $__dgx; $__dgy =~ s/(_c.*)$/_r\*$1/; $__dgw->{'_if'} = $__dgy; $__dgw->{'_iy'} = $__dgs; $__dgw->{'_uh'} = $__dhl; push @__dgv, $__dgw; } elsif ($__dha eq "RadioVar") { push @__dgv, $__dgw; } elsif (($__dhk == 0) && ($__dha eq "RankVar" || $__dha eq "ConsumVar")) { $__dgy = $__dgx; $__dgy =~ s/(_c.*)$/_r\*$1/; $__dgw->{'_uz'} = $__dgy; $__dgw->{'_amy'} = $__dgs; $__dgw->{'_uh'} = $__dhl; push @__dgv, $__dgw; } else { $__dhi = 0; if (($__dha eq "ConsumVar") && $__dhk) { foreach $__dhd (@{$__dhl}) { $__dhf = $__dhd; $__dgy = $__dgx; $__dgy =~ s/(_c.*)$/_r$__dhf$1/; if (exists $authlib9_14_2::_akn{$__dgy}) { $__dhh = _zo($authlib9_14_2::_akn{$__dgy}); if ($__dhh ne "") { $__dhi = 1; last; } } } } foreach $__dhd (@{$__dhl}) { $__dhf = $__dhd; $__dgy = $__dgx; $__dgy =~ s/(_c.*)$/_r$__dhf$1/; $__dgw->{'_if'} = $__dgy; if ($__dhi) { $__dgw->{'_ui'} = 1; } push @__dgv, _acv($__dgw); } } } } return \@__dgv; } sub _acl { my ($__dhp) = @_; my $__dhn = @{$__dhp}; my $__dho = 0; for ($__dho = $__dhn - 1; $__dho >= 0; $__dho--) { if (!exists($__dhp->[$__dho]->{'_jg'}) && !exists($__dhp->[$__dho]->{'_in'})) { last; } } return ($__dho + 1); } sub _acm { my ($__dhx, $__dhy, $__dhz, $__dia, $__dib) = @_; my $__dhq = 0; my $__dhr = 0; my $__dhs = 0; my $__dht = 0; my $__dhu = 0; my @__dhv = () x $__dhy; my $__dhw = 0; if ($__dhy < $__dib) { $__dib = $__dhy; } $__dia = $__dia - 1; $__dib = $__dib - 1; if ($__dia < $__dib) { $__dhw = 1; $__dht = _acn($__dhx, ($__dib - $__dia) + 1, $__dhz); } if ($__dhw && ($__dia == 0) && ($__dib == ($__dhy - 1))) { $__dhu = $__dht; } else { for ($__dhq = 0; $__dhq < $__dhy; $__dhq++) { if ($__dhw && ($__dhq >= $__dia) && ($__dhq <= $__dib)) { $__dhs = ($__dht->[$__dhr]) + $__dia; $__dhv[$__dhq] = $__dhs; $__dhr++; } else { $__dhv[$__dhq] = $__dhq; } } $__dhu = \@__dhv; } return $__dhu; } sub _acn { my ($__die, $__dif, $__dig) = @_; _aco($__die + $__dig); my @__dic = map{ rand() } (0..($__dif-1)); my @__did = sort { $__dic[$a] <=> $__dic[$b] } (0..($__dif-1)); return \@__did; } sub _aco { my ($__dij) = @_; my $__dih = 0; my $__dii = 0; $__dih = $__dij % 10000; $__dii = (((($__dih * 3141 + int($__dij / 10000) * 5821) % 10000) * 10000 + $__dih * 5821) % 100000000 + 1) % 100000000; srand($__dii); $__dih = $__dii % 5 + 1; while ($__dih--){ rand; } $_ = rand; return $_; } sub _acp { my ($__dik,$__dil,$__dim) = @_; if (!$__dil) { if ($__dik =~ m/^-?\d+$/) { return(0); } } elsif (exists $authlib9_14_2::_akp->{'_dq'}) { if ($__dik =~ m/^-?(?:\d+(?:(\.|,)\d*)?|(\.|,)\d+)$/) { return(0); } } else { if ($__dik =~ m/^-?(?:\d+(?:\.\d*)?|\.\d+)$/) { return(0); } } return(1); } sub _acq { my ($__din) = @_; $__din =~ s/\[\0/\[%/g; $__din =~ s/\0\]/%\]/g; return $__din; } sub _acr { my ($__dir) = @_; my $__dio = ""; my $__dip = ""; if (exists $authlib9_14_2::_akn{"hid_backup"}) { $__dio = $authlib9_14_2::_akn{"hid_backup"}; my @__diq = split(",", $__dio); if ($__dir eq "hid_studyname") { $authlib9_14_2::_akn{"hid_studyname"} = $__diq[0]; $__dip = $authlib9_14_2::_akn{"hid_studyname"}; } elsif ($__dir eq "hid_respnum") { if ($__diq[1] && $__diq[2]) { $authlib9_14_2::_akn{"hid_respnum"} = $__diq[1] . "," . $__diq[2]; } $__dip = $authlib9_14_2::_akn{"hid_respnum"}; } elsif ($__dir eq "hid_pagenum") { $authlib9_14_2::_akn{"hid_pagenum"} = $__diq[3]; $__dip = $authlib9_14_2::_akn{"hid_pagenum"}; } elsif ($__dir eq "hid_javascript") { $authlib9_14_2::_akn{"hid_javascript"} = $__diq[4]; $__dip = $authlib9_14_2::_akn{"hid_javascript"}; } } return $__dip; } sub _acs { my ($__diw) = @_; my $__dis = 0; my $__dit = 0; my $__diu = 0; my $__div = ""; $__diu = length($__diw); for ($__dit = 0; $__dit < $__diu; $__dit++) { $__div = chop $__diw; $__dis += ord(uc $__div) * ($__dit + 1); } return ($__dis); } sub _act { if ($authlib9_14_2::_ajm) { close $authlib9_14_2::_ajm; } if ($authlib9_14_2::_ake) { _we(); } exit(); } sub _acu { my ($__diy, $__diz) = @_; my $__dix = pack "H*", $__diy; for (0..length($__dix)-1) { for (vec($__dix, $_, 8)) { $_ -= $__diz if $_ >= $__diz; } } return unpack "H*", $__dix; } sub _acv { my ($__djb) = @_; my $__dja = ref $__djb; if (not $__dja) { $__djb; } elsif ($__dja eq "ARRAY") { [map _acv($_), @$__djb]; } elsif ($__djb =~ m/=ARRAY\(/) { bless([map _acv($_), @$__djb], $__dja); } elsif ($__dja eq "HASH") { +{map { $_ => _acv($__djb->{$_}) } keys %$__djb}; } elsif ($__djb =~ m/=HASH\(/) { bless(+{map { $_ => _acv($__djb->{$_}) } keys %$__djb}, $__dja); } else { die "what type is $_?"; } } sub _acw { if ($authlib9_14_2::_alk == 0) { my $__djc = tell $authlib9_14_2::_ajm; if ($authlib9_14_2::_aik) { seek $authlib9_14_2::_ajm, ($authlib9_14_2::_aik), 0; $authlib9_14_2::_alk = _zi(0); seek $authlib9_14_2::_ajm, $__djc, 0; } else { return 0; } } } sub _acx { my ($__djd) = @_; if ($authlib9_14_2::_alk == 0) { if ($authlib9_14_2::_aik) { unless (_acw()) { return 0; } } else { return 0; } } if (exists($authlib9_14_2::_alk->{$__djd})) { return _acv($authlib9_14_2::_alk->{$__djd}); } else { return 0; } } sub _acy { my ($__dkl, $__dkm) = @_; my $__dje = 0; my $__djf = 0; my $__djg = 0; my $__djh = 0; my $__dji = ""; if ($__dkl =~ m/(.*?)(\..*?)$/) { $__dkl = $1; $__dji = $2; } if ($authlib9_14_2::_alt eq $__dkl && $authlib9_14_2::_amd) { $__djf = _adb(); } else { $__djh = _acx($__dkl); } if ($authlib9_14_2::_amg && $__djh) { if (exists($__djh->{'_jq'})) { $__djh = _acx($__djh->{'_jq'}); } if ($__djh && exists($__djh->{'_gk'})) { if (@{$__djh->{'_gk'}} == 0) { push @{$__djh->{'_gk'}}, {'_op'=>"", '_pt'=>"1"}; } } } if ($__djh) { if (exists($__djh->{'_jq'})) { my $__djj = $__djh->{'_hk'}; my $__djk = _acx($__djh->{'_jq'}); my $__djl = 0; my @__djm = (); my $__djn = $authlib9_14_2::_amd; my $__djo = $authlib9_14_2::_alr; my $__djp = $authlib9_14_2::_als; my @__djq = (); my $__djr = ""; my $__djs = 0; $authlib9_14_2::_amd = \@__djq; $authlib9_14_2::_alr = $__djk; $authlib9_14_2::_als = $__djh->{'_jq'}; if (!exists($authlib9_14_2::_ais{$authlib9_14_2::_als})) { $__djl = @{$__djk->{'_gk'}}; my @__djt = ("") x ($__djl + 1); $__djt[0] = 0; $authlib9_14_2::_ais{$authlib9_14_2::_als} = \@__djt; } $authlib9_14_2::_ais{$authlib9_14_2::_als}->[0]++; if ($authlib9_14_2::_ais{$authlib9_14_2::_als}->[0] > 1000) { _acg(&authlib9_14_2::_AOT, 0, "Circular reference found in list building causing an infinite loop. List name: " . $__dkl); return 0; } $__djr = $authlib9_14_2::_alt; $authlib9_14_2::_alt = $__dkl; my $__dju = authlib9_14_2::_ws($__dkl . $__dji, 0, $__dkl); if ($__dju eq "" && exists($authlib9_14_2::_akn{$__dkl})) { $__dju = $authlib9_14_2::_akn{$__dkl}; } if ($__dju eq "" && (exists $authlib9_14_2::_akn{"hid_loops"} || exists $authlib9_14_2::_akn{"hid_loops_restart_dot_notation"}) && $__dji eq "") { my $__djv = ""; if (exists $authlib9_14_2::_akn{"hid_loops_restart_dot_notation"}) { $__djv = $authlib9_14_2::_akn{"hid_loops_restart_dot_notation"}; } else { my $__djw = ciwlib9_14_2::_qz($authlib9_14_2::_akn{"hid_loops"}); my $__djx = $authlib9_14_2::_ako->[_aad() - 1]; my $__djy = 0; ($__djv, $__djy) = ciwlib9_14_2::_rb($__djx, $__djw, $__dkl); } if ($__djv) { my $__djz = $__dkl . $__djv; my $__dka = authlib9_14_2::_ws($__djz); if ($__dka ne "") { authlib9_14_2::_wt($__dkl, $__dka); $__dju = $__dka; } } } if ($__dju) { if ($ciwlib9_14_2::_tz && exists($authlib9_14_2::_akn{$__dkl})) { $authlib9_14_2::_ait{$__dkl} = $__dju; authlib9_14_2::_wt($__dkl, $__dju); } if ($__dju =~ m/[\d,\s]+/) { $authlib9_14_2::_amd = eval("[" . $__dju . "]"); if ($@) { authlib9_14_2::_zq(133, "", "Reading saved list error.", $@); } my $__dkb = authlib9_14_2::_ws($__dkl . "_others" . $__dji); if ($__dkb ne "" || exists($authlib9_14_2::_akn{$__dkl . "_others"})) { if ($__dkb eq "" && exists($authlib9_14_2::_akn{$__dkl . "_others"})) { $__dkb = $authlib9_14_2::_akn{$__dkl . "_others"}; } $__dkb =~ s/\\,/\0/g; my @__dkc = split(",", $__dkb); my $__dkd = @__dkc; if ($ciwlib9_14_2::_tz && exists($authlib9_14_2::_akn{$__dkl . "_others"})) { $authlib9_14_2::_ait{$__dkl . "_others"} = $__dkb; authlib9_14_2::_wt($__dkl . "_others", $__dkb); } $__dkb = ""; for ($__djg = 0; $__djg < $__dkd; $__djg++) { $__djs = $authlib9_14_2::_amd->[$__djg]; $__dje = $__djk->{'_gk'}->[$__djs - 1]; if (exists($__dje->{'_jg'})) { $__dkb = $__dkc[$__djg]; if ($__dkb ne "") { $__dkb =~ s/"/&quot;/g; $__dkb =~ s/\0/,/g; $__dje->{'_op'} = $__dkb; $__dje->{'_jg'}->{'_op'} = $__dkb; $authlib9_14_2::_ais{$authlib9_14_2::_als}->[$__djs] = $__dkb; } } } } } } elsif ($__dkm || $__dji || (exists $authlib9_14_2::_akg->{$__dkl} && $authlib9_14_2::_akg->{$__dkl} eq "")) { $__djf = 0; } else { _zx($__djj, "list building"); $__dju = _ada($authlib9_14_2::_amd); my $__dke = $__dkl; $authlib9_14_2::_ait{$__dke} = $__dju; authlib9_14_2::_wt($__dkl, $__dju); } $__djl = @{$authlib9_14_2::_amd}; if ($__djl > @{$__djk->{'_gk'}}) { authlib9_14_2::_zq(134, "List building error.", "List building error: The number of items in the parent list (" . $__djh->{'_jq'} . ") is less than the number of items in the constructed list (" . $__dkl . ").", ""); } my $__dkf = 0; my $__dkg = ""; my @__dkh = (); for ($__djg = 0; $__djg < $__djl; $__djg++) { $__djs = $authlib9_14_2::_amd->[$__djg]; $__dje = $__djk->{'_gk'}->[$__djs - 1]; push @__djm, $__dje; $__dkf = $__djm[$__djg]->{'_pt'}; if (exists $__dje->{'_jg'} && $authlib9_14_2::_ais{$authlib9_14_2::_als}->[$__dkf] ne "") { $__dkg = $authlib9_14_2::_ais{$authlib9_14_2::_als}->[$__dkf]; $__djm[$__djg]->{'_op'} = $__dkg; $__dkg =~ s/"/&quot;/g; $__djm[$__djg]->{'_jg'}->{'_op'} = $__dkg; $__dkg =~ s/,/\\,/g; push @__dkh, $__dkg; } else { push @__dkh, ""; } } $__dkg = join(",", @__dkh); my $__dki = $__dkl . "_others"; my $__dkj = $__dkg; $__dkj =~ s/,//g; if ($__dkj ne "") { my $__dkk = authlib9_14_2::_ws($__dki); if ($__dkk eq "" && !exists($authlib9_14_2::_akn{$__dki})) { $authlib9_14_2::_ait{$__dki} = $__dkg; authlib9_14_2::_wt($__dki, $__dkg); } } $authlib9_14_2::_ais{$authlib9_14_2::_als}->[0]--; if ($authlib9_14_2::_ais{$authlib9_14_2::_als}->[0] == 0) { delete $authlib9_14_2::_ais{$authlib9_14_2::_als}; } $authlib9_14_2::_amd = $__djn; $authlib9_14_2::_alr = $__djo; $authlib9_14_2::_als = $__djp; $authlib9_14_2::_alt = $__djr; $__djf = \@__djm; } else { $__djf = $__djh->{'_gk'}; } if ($__djf && !$authlib9_14_2::_ajx) { if (exists $authlib9_14_2::_ain->{$__dkl . $__dji}) { $__djf = $authlib9_14_2::_ain->{$__dkl . $__dji}; } else { _acz($__djf); $authlib9_14_2::_ain->{$__dkl . $__dji} = $__djf; } } } if ($__dkm && $__dji eq "" && ($__djf == 0 || @{$__djf} == 0)) { $__djf = _acy($__dkl . $__dkm); } if ($__djf) { if (@{$__djf} == 0) { $__djf = 0; } } return $__djf; } sub _acz { my ($__dkr) = @_; my $__dkn = @{$__dkr}; my $__dko = 0; my $__dkp = 0; my $__dkq = 0; for ($__dko = 0; $__dko < $__dkn; $__dko++) { $__dkp = $__dkr->[$__dko]; $__dkp->{'_op'} = _zw($__dkp->{'_op'}, 0); if (exists $__dkp->{'_jg'}) { $__dkq = $__dkp->{'_jg'}; if (exists $__dkq->{'_ek'}) { $__dkq->{'_ek'} = _zw($__dkq->{'_ek'}, 0); } } } } sub _ada { my ($__dkt) = @_; my $__dks = join(",", @{$__dkt}); return $__dks; } sub _adb { my $__dku = 0; my $__dkv = ""; my $__dkw = 0; my @__dkx = (); if ($authlib9_14_2::_amd) { my $__dky = @{$authlib9_14_2::_amd}; for ($__dkw = 0; $__dkw < $__dky; $__dkw++) { push @__dkx, $authlib9_14_2::_alr->{'_gk'}->[$authlib9_14_2::_amd->[$__dkw] - 1]; } } return \@__dkx; } sub _adc { my ($__dlb) = @_; my $__dkz = []; my $__dla = _acx($__dlb); if ($__dla) { if (exists($__dla->{'_jq'})) { $__dla = _acx($__dla->{'_jq'}); } if ($__dla) { $__dkz = $__dla->{'_gk'}; } } return $__dkz; } sub _add { my ($__dle) = @_; my $__dlc = ""; my $__dld = _acx($__dle); if ($__dld && exists($__dld->{'_jq'})) { $__dlc = $__dld->{'_jq'}; } else { $__dlc = $__dle; } return $__dlc; } sub _ade { my ($__dlp, $__dlq, $__dlr) = @_; my $__dlf = 0; my $__dlg = 0; my $__dlh = @{$__dlp}; my $__dli = 0; my $__dlj = @{$authlib9_14_2::_amd}; my $__dlk = 0; if ($__dlq <= 0) { $__dlk = 1; } for ($__dlf = 0; $__dlf < $__dlh; $__dlf++) { $__dli = $__dlp->[$__dlf]; if ($__dlr && $authlib9_14_2::_ais{$authlib9_14_2::_als}->[0] == 1) { $authlib9_14_2::_ais{$authlib9_14_2::_als}->[$__dli] = ""; } for ($__dlg = 0; $__dlg < $__dlj; $__dlg++) { if ($__dli == $authlib9_14_2::_amd->[$__dlg]) { if ($__dlk) { $__dlp->[$__dlf] = ""; } else { $authlib9_14_2::_amd->[$__dlg] = ""; } } } } my @__dll = (); for ($__dlf = 0; $__dlf < $__dlj; $__dlf++) { if ($authlib9_14_2::_amd->[$__dlf] ne "") { push @__dll, $authlib9_14_2::_amd->[$__dlf]; } } $__dlj = @__dll; my @__dlm = (); for ($__dlf = 0; $__dlf < $__dlh; $__dlf++) { if ($__dlp->[$__dlf] ne "") { push @__dlm, $__dlp->[$__dlf]; } } $__dlh = @__dlm; if ($__dlq > $__dlj) { $__dlq = -1; } if ($__dlq <= 0) { push @__dll, @__dlm; $authlib9_14_2::_amd = \@__dll; } else { my @__dln = (); my @__dlo = (); if ($__dlq > 1) { @__dln = @__dll[0 .. ($__dlq - 2)]; } if ($__dlj > 0) { @__dlo = @__dll[($__dlq - 1) .. ($__dlj - 1)]; } push @__dlm, @__dlo; push @__dln, @__dlm; $authlib9_14_2::_amd = \@__dln; } } sub _adf { my ($__dlv) = @_; my @__dls = (); if ($__dlv && (ref($__dlv) eq "ARRAY")) { my $__dlt = @{$__dlv}; my $__dlu = 0; for ($__dlu = 0; $__dlu < $__dlt; $__dlu++) { push @__dls, ($__dlv->[$__dlu]->{'_pt'}); } } return \@__dls; } sub AIC { my ($__dlx, $__dly, $__dlz) = @_; my $__dlw = @_; _adl($__dlx, ">", 0, 0, $__dly, $__dlz, $__dlw); } sub RIC { my ($__dmd, $__dme, $__dmf) = @_; my $__dma = @_; my $__dmb = _acv($authlib9_14_2::_amd); $authlib9_14_2::_amd = []; _adl($__dmd, ">", 0, 0, $__dme, $__dmf, $__dma); my $__dmc = _acv($authlib9_14_2::_amd); $authlib9_14_2::_amd = $__dmb; _adi($__dmc); } sub ANC { my ($__dmh, $__dmi, $__dmj) = @_; my $__dmg = @_; _adl($__dmh, "==", 0, 0, $__dmi, $__dmj, $__dmg); } sub AIE { my ($__dmk, $__dml) = @_; _adl($__dmk, "==", $__dml, _adk($__dmk), 0, 0, 0); } sub AIELOOPLIST { my ($__dmm, $__dmn, $__dmo) = @_; _adn($__dmn, "==", $__dmo, $__dmm); } sub ANE { my ($__dmp, $__dmq) = @_; _adl($__dmp, "!=", $__dmq, _adk($__dmp), 0, 0, 0); } sub ANELOOPLIST { my ($__dmr, $__dms, $__dmt) = @_; _adn($__dms, "!=", $__dmt, $__dmr); } sub AIL { my ($__dmu, $__dmv) = @_; _adl($__dmu, "<", $__dmv, _adk($__dmu), 0, 0, 0); } sub AILLOOPLIST { my ($__dmw, $__dmx, $__dmy) = @_; _adn($__dmx, "<", $__dmy, $__dmw); } sub AIG { my ($__dmz, $__dna) = @_; _adl($__dmz, ">", $__dna, _adk($__dmz), 0, 0, 0); } sub AIGLOOPLIST { my ($__dnb, $__dnc, $__dnd) = @_; _adn($__dnc, ">", $__dnd, $__dnb); } sub ADD { my ($__dnf, $__dng, $__dnh) = @_; my $__dne = @_; if ($__dne == 1) { INSERT(-1, $__dnf); } elsif ($__dne == 2 && $__dng > 0) { INSERT(-1, $__dnf, $__dng); } elsif ($__dne == 3 && $__dng > 0 && $__dnh >= $__dng) { INSERT(-1, $__dnf, $__dng, $__dnh); } } sub ADDSORTED { my ($__dnq, $__dnr) = @_; my $__dni = 0; my $__dnj = ""; my $__dnk = _adk($__dnq); my @__dnl = (); my @__dnm = (); my $__dnn = 0; if ($__dnk) { ($__dni, $__dnj) = _adj($__dnq); } else { ($__dni, $__dnn) = _abu($__dnq, 0, "", 0); } if ($__dni) { @__dnl = @{$__dni}; @__dnm = grep { $_->{'_amz'} } @__dnl; my $__dno = -1; if ($__dnr) { @__dnm = sort { if ($a->{'_amz'} eq $b->{'_amz'}) { $__dno++; if (RANDNUM($__dno) >= 0.5) { return -1; } else { return 1; } } else { return $a->{'_amz'} <=> $b->{'_amz'}; } } @__dnm; } else { @__dnm = sort { if ($a->{'_amz'} eq $b->{'_amz'}) { $__dno++; if (RANDNUM($__dno) >= 0.5) { return 1; } else { return -1; } } else { return $b->{'_amz'} <=> $a->{'_amz'}; } } @__dnm; } @__dnm = map { $_->{'_pt'} } @__dnm; foreach my $__dnp (@__dnm) { _adm($__dnq, $__dnp, $__dnk, $__dnj); } } _ade(\@__dnm, -1, 0); } sub MIRROR { my ($__dnz, $__doa) = @_; my $__dns = @_; if ($__dns == 1) { $__doa = 0; } my @__dnt = @{_adf(_acy($__dnz))}; my $__dnu = _acx($__dnz); my $__dnv = 1; if ($__dnu && exists($__dnu->{'_jq'})) { $__dnv = 0; } my @__dnw = map { $_ + $__doa } @__dnt; my @__dnx = @{_adf(_acy($authlib9_14_2::_als))}; my %__dny = map { $_ => 1 } @__dnx; @__dnw = grep { exists $__dny{$_} } @__dnw; _ade(\@__dnw, -1, $__dnv); } sub INSERT { my ($__dol, $__dom, $__don, $__doo) = @_; my $__dob = @_; my $__doc = ""; my $__dod = ""; my @__doe = (); my $__dof = _adf(_acy($__dom)); my $__dog = _acx($__dom); my $__doh = 1; if ($__dog && exists($__dog->{'_jq'})) { $__doh = 0; } if ($__dob == 2) { _ade($__dof, $__dol, $__doh); } elsif ($__dob == 3) { my $__doi = $__don; if ($__doi > 0) { push @__doe, $__dof->[$__doi - 1]; _ade(\@__doe, $__dol, $__doh); } } elsif ($__dob == 4) { $__doc = $__don; $__dod = $__doo; if (($__doc > 0) && ($__dod >= $__doc)) { my $__doj = 0; my $__dok = @{$__dof}; if ($__dod > $__dok) { $__dod = $__dok; } $__doc--; $__dod--; for ($__doj = $__doc; $__doj <= $__dod; $__doj++) { push @__doe, $__dof->[$__doj]; } _ade(\@__doe, $__dol, $__doh); } } } sub REMOVE { my ($__dot, $__dou, $__dov) = @_; my $__dop = @_; my $__doq = _adf(_acy($__dot)); if ($__dop == 1) { _adi($__doq); } else { if ($__dop == 2) { $__dov = $__dou; } if ($__dou > 0 && $__dov >= $__dou) { my $__dor = 0; my @__dos = (); for ($__dor = $__dou; $__dor <= $__dov; $__dor++) { push @__dos, $__doq->[$__dor - 1]; } _adi(\@__dos); } } } sub PARENTLISTNAME { return $authlib9_14_2::_als; } sub RANDOMIZE { my ($__dpg, $__dph, $__dpi) = @_; my $__dow = @_; my $__dox = 0; my $__doy = @{$authlib9_14_2::_amd}; my $__doz = 1; my $__dpa = 0; my $__dpb = 0; if ($__dow == 0) { $__dpa = $__doy; } elsif ($__dow == 1) { $__dpa = $__doy; $__dpb = $__dpg; } elsif ($__dow == 2) { $__doz = $__dpg; $__dpa = $__dph; } elsif ($__dow == 3) { $__dpb = $__dpg; $__doz = $__dph; $__dpa = $__dpi; } if (exists($authlib9_14_2::_akn{"hid_respnum"}) && defined($authlib9_14_2::_akn{"hid_respnum"})) { $__dox = $authlib9_14_2::_akn{"hid_respnum"}; } if ($__dpa > $__doy) { $__dpa = $__doy; } if ($__doz < 1) { $__doz = 1; } if ($__dpb == 0) { my $__dpc = $authlib9_14_2::_alt; if (exists $authlib9_14_2::_akn{"hid_loops"}) { $__dpc .= $authlib9_14_2::_akn{"hid_loops"}; } $__dpb = _acs($__dpc) + $authlib9_14_2::_aix * 53; $authlib9_14_2::_aix++; } my $__dpd = _acm($__dox, $__doy, $__dpb, $__doz, $__dpa); my @__dpe = (); my $__dpf = 0; for ($__dpf = 0; $__dpf < $__doy; $__dpf++) { push @__dpe, $authlib9_14_2::_amd->[$__dpd->[$__dpf]]; } $authlib9_14_2::_amd = \@__dpe; } sub LISTMIN { my ($__dpu) = @_; my $__dpj = @{$authlib9_14_2::_amd}; my $__dpk = 0; if ($__dpj < $__dpu) { $__dpk = $__dpu - $__dpj; my $__dpl = 0; my $__dpm = $authlib9_14_2::_alr->{'_gk'}; my $__dpn = @{$__dpm}; if (exists($authlib9_14_2::_akn{"hid_respnum"}) && defined($authlib9_14_2::_akn{"hid_respnum"})) { $__dpl = $authlib9_14_2::_akn{"hid_respnum"}; } my $__dpo = _acs($authlib9_14_2::_alt); my $__dpp = _acm($__dpl, $__dpn, $__dpo, 1, $__dpn); my $__dpq = 0; my @__dpr = (); my $__dps = 0; my $__dpt = 0; for ($__dpq = 0; $__dpq < $__dpn; $__dpq++) { if ($__dpk == 0) { last; } $__dpt = 1; $__dps = $__dpp->[$__dpq]; if (exists $__dpm->[$__dps]->{'_in'}) { $__dpt = 0; } elsif (exists $__dpm->[$__dps]->{'_jg'}) { $__dpt = 0; } if ($__dpt) { $__dpr[0] = $__dps + 1; _ade(\@__dpr, -1, 0); if (@{$authlib9_14_2::_amd} > $__dpj) { $__dpj = @{$authlib9_14_2::_amd}; $__dpk--; } } } } } sub LISTMAX { my ($__dpy) = @_; my $__dpv = @{$authlib9_14_2::_amd}; if ($__dpv > $__dpy) { my @__dpw = (); my $__dpx = 0; for ($__dpx = 0; $__dpx < $__dpy; $__dpx++) { push @__dpw, $authlib9_14_2::_amd->[$__dpx]; } $authlib9_14_2::_amd = \@__dpw; } } sub ISCAPI { return _ws("sys_DataSource") == &authlib9_14_2::_AOJ ? 1 : 0; } sub CAPIDEVICEID { return _adg(); } sub _adg { return _ws("sys_CAPIDeviceID"); } sub SETLISTLENGTH { my ($__dpz) = @_; LISTMAX($__dpz); LISTMIN($__dpz); } sub REVERSE { my @__dqa = reverse(@{$authlib9_14_2::_amd}); $authlib9_14_2::_amd = \@__dqa; } sub SORTBYVALUE { my @__dqb = sort {$a <=> $b} @{$authlib9_14_2::_amd}; $authlib9_14_2::_amd = \@__dqb; } sub SORTBYLABEL { my $__dqc = @{$authlib9_14_2::_amd}; my $__dqd = 0; my $__dqe = 0; my $__dqf = 0; my @__dqg = (); my $__dqh = 0; for ($__dqd = 0; $__dqd < $__dqc; $__dqd++) { $__dqe = $authlib9_14_2::_amd->[$__dqd]; $__dqf = _acv($authlib9_14_2::_alr->{'_gk'}->[$__dqe - 1]); $__dqf->{'_op'} = _zw($__dqf->{'_op'}, 0); push @__dqg, $__dqf; $__dqh = $__dqg[$__dqd]->{'_pt'}; if ($authlib9_14_2::_ais{$authlib9_14_2::_als}->[$__dqh] ne "") { $__dqg[$__dqd]->{'_op'} = _zw($authlib9_14_2::_ais{$authlib9_14_2::_als}->[$__dqh], 0); } } my @__dqi = sort {_adh()} @__dqg; my @__dqj = map {$_->{'_pt'}} @__dqi; $authlib9_14_2::_amd = \@__dqj; } sub _adh { my $__dqk = $a->{'_op'}; my $__dql = $b->{'_op'}; ($__dqk <=> $__dql) or (lc($__dqk) cmp lc($__dql)); } sub _adi { my ($__dqs) = @_; my $__dqm = 0; my $__dqn = 0; my $__dqo = @{$__dqs}; my $__dqp = 0; my $__dqq = @{$authlib9_14_2::_amd}; for ($__dqm = 0; $__dqm < $__dqo; $__dqm++) { $__dqp = $__dqs->[$__dqm]; for ($__dqn = 0; $__dqn < $__dqq; $__dqn++) { if ($__dqp == $authlib9_14_2::_amd->[$__dqn]) { $authlib9_14_2::_amd->[$__dqn] = ""; } } } my @__dqr = (); for ($__dqm = 0; $__dqm < $__dqq; $__dqm++) { if ($authlib9_14_2::_amd->[$__dqm] ne "") { push @__dqr, $authlib9_14_2::_amd->[$__dqm]; } } $authlib9_14_2::_amd = \@__dqr; } sub _adj { my ($__drg) = @_; my $__dqt = $authlib9_14_2::_ahp{$__drg}; my $__dqu = $__dqt->{'_pj'}; my @__dqv = (); my $__dqw = 0; if ($__dqu == &authlib9_14_2::_ANS) { my $__dqx = tell $authlib9_14_2::_ajm; my $__dqy = $__dqt->{'_iz'}; my $__dqz = ""; my $__dra = ""; seek $authlib9_14_2::_ajm, ($__dqy), 0; $__dqw = _zi(0); if ($__dqw->{'_pu'} eq "cols") { $__dqz = $__dqw->{'_co'}; } else { $__dqz = $__dqw->{'_mw'}; } my $__drb = _acy($__dqz); my $__drc = 0; if ($__drb) { $__drc = @{$__drb}; } my $__drd = 0; my $__dre = ""; my $__drf = 0; for ($__drd = 0; $__drd < $__drc; $__drd++) { $__drf = $__drb->[$__drd]->{'_pt'}; if ($__dqw->{'_pu'} eq "cols") { $__dre = $__drg . "_c" . $__drf; } else { $__dre = $__drg . "_r" . $__drf; } $__dra = _zo(authlib9_14_2::_ws($__dre)); if ($__dra ne "" || _ael($__dre)) { push @__dqv, {'_pt'=>$__drf, '_amz'=>$__dra}; } } seek $authlib9_14_2::_ajm, $__dqx, 0; } return (\@__dqv, $__dqw->{'_pu'}); } sub _adk { my ($__dri) = @_; my $__drh = 0; if (exists($authlib9_14_2::_ahp{$__dri})) { if ($authlib9_14_2::_ahp{$__dri}->{'_pj'} == 16) { $__drh = 1; } } return $__drh; } sub _adl { my ($__drv, $__drw, $__drx, $__dry, $__drz, $__dsa, $__dsb) = @_; my $__drj = 0; my $__drk = ""; my @__drl = (); my $__drm = ""; my $__drn = 0; if ($__drx eq "") { return ""; } if ($__dsb > 0) { if ($__dsb == 1) { $__drz = 0; $__dsa = 0; } else { if ($__dsb == 2) { $__dsa = $__drz; } if (!($__drz > 0 && $__dsa >= $__drz)) { return ""; } } } else { $__drz = 0; $__dsa = 0; } if ($__dry) { ($__drj, $__drk) = _adj($__drv); } else { ($__drj, $__drn) = _abu($__drv, 0, "", 0); } if ($__drj != 0) { my $__dro = @{$__drj}; my $__drp = 0; my $__drq = 0; my $__drr = 0; my $__drs = ""; my $__drt = 0; my $__dru = 0; for ($__drp = 0; $__drp < $__dro; $__drp++) { $__drt = $__drj->[$__drp]->{'_pt'}; $__dru = $__drj->[$__drp]->{'_amz'}; if ($__drz > 0 && ($__drt < $__drz)) { next; } elsif ($__dsa > 0 && ($__drt > $__dsa)) { next; } if ($__dru eq "") { $__dru = "0"; } $__drm = $__dru . " " . $__drw . " " . $__drx; $__drr = eval($__drm); if ($@) { authlib9_14_2::_zq(135, "", "List building error.", $@); } if ($__drr) { push @__drl, $__drt; _adm($__drv, $__drt, $__dry, $__drk); } } } _ade(\@__drl, -1, 0); } sub _adm { my ($__dsf, $__dsg, $__dsh, $__dsi) = @_; my $__dsc = ""; my $__dsd = ""; my $__dse = ""; if ($__dsf =~ m/(.*?)(\..*?)$/) { $__dsf = $1; $__dse = $2; } if ($__dsh) { $__dsc = $__dsf . "_"; if ($__dsi eq "rows") { $__dsc .= "r" . $__dsg . "_other"; } else { $__dsc .= "c" . $__dsg . "_other"; } } elsif ($__dsf =~ m/_/) { $__dsc = $__dsf . "_other"; if ($__dsc =~ m/_r\d+/) { $__dsc =~ s/_r\d+/_c$__dsg/; } elsif ($__dsc =~ m/_c\d+/) { $__dsc =~ s/_c\d+/_r$__dsg/; } } else { $__dsc = $__dsf . "_" . $__dsg . "_other"; } if ($__dse) { $__dsc .= $__dse; } $__dsd = authlib9_14_2::_ws($__dsc); if ($__dsd ne "") { $authlib9_14_2::_ais{$authlib9_14_2::_als}->[$__dsg] = $__dsd; } } sub _adn { my ($__dsw, $__dsx, $__dsy, $__dsz) = @_; my @__dsj = (); my %__dsk = (); authlib9_14_2::_adr(); if (exists $authlib9_14_2::_ame->{$__dsz}) { my $__dsl = _aed($__dsw); my $__dsm = $authlib9_14_2::_ako->[$__dsl->{'_ji'} - 1]; my @__dsn = (); my $__dso = ""; my $__dsp = 0; if (exists $__dsm->{'_hm'}) { my @__dsq = reverse @{$__dsm->{'_hm'}}; my $__dsr = 0; for ($__dsr = 0; $__dsr < @__dsq; $__dsr++) { if (uc($__dsq[$__dsr]) eq uc($__dsz)) { $__dsp = $__dsr; } } _adp($__dsw, \@__dsq, \@__dsn, ""); } my $__dss = 0; my $__dst = ""; my $__dsu = 0; my $__dsv = 0; foreach $__dso (@__dsn) { $__dss = authlib9_14_2::_ws($__dso); if ($__dss eq "") { if (_ael($__dso)) { $__dss = 0; } else { next; } } $__dst = $__dss . " " . $__dsx . " " . $__dsy; $__dsu = eval($__dst); if ($@) { authlib9_14_2::_zq(259, "", "List building error.", $@); } if ($__dsu) { $__dsv = _ado($__dso, $__dsp); if (!exists $__dsk{$__dsv}) { $__dsk{$__dsv} = 1; push @__dsj, $__dsv; } } } } _ade(\@__dsj, -1, 0); } sub _ado { my ($__dtd, $__dte) = @_; my $__dta = 0; if ($__dtd =~ m/(.*?)\.(.*?)$/) { my @__dtb = (); my $__dtc = $2; if ($__dtc =~ m/\./) { @__dtb = split(/\./, $__dtc); } else { push @__dtb, $__dtc; } if ($__dte < @__dtb) { $__dta = $__dtb[$__dte]; } } return $__dta; } sub _adp { my ($__dtk, $__dtl, $__dtm, $__dtn) = @_; my $__dtf = _acv($__dtl); my $__dtg = shift @{$__dtf}; if (exists $authlib9_14_2::_ame->{$__dtg}) { my $__dth = $authlib9_14_2::_ame->{$__dtg}->{'_hj'}; my $__dti = authlib9_14_2::_acy($__dth); if ($__dti) { foreach my $__dtj (@{$__dti}) { if (@{$__dtf}) { _adp($__dtk, $__dtf, $__dtm, $__dtn . "." . $__dtj->{'_pt'}); } else { push @{$__dtm}, $__dtk . $__dtn . "." . $__dtj->{'_pt'}; } } } } } sub _adq { my ($__dts) = @_; my $__dto = "SELECT * FROM `" . $authlib9_14_2::_akj . "_clists` WHERE `sys_RespNum` = " . $__dts; my $__dtp = 0; eval { $__dtp = $authlib9_14_2::_ake->selectall_hashref(authlib9_14_2::_wn($__dto, 0), "list_name"); }; if ($@) { authlib9_14_2::_zq(255, "Database error.", "Database error. Cannot read clist table.", $@); } my $__dtq = ""; my $__dtr = ""; foreach $__dtq (keys %{$__dtp}) { $__dtr = authlib9_14_2::_wi($__dtp->{$__dtq}->{"value"}); authlib9_14_2::_wt($__dtq, $__dtr); } return $__dtp; } sub _adr { if (!$authlib9_14_2::_ame) { if ($authlib9_14_2::_ail) { seek $authlib9_14_2::_ajm, $authlib9_14_2::_ail, 0; $authlib9_14_2::_ame = authlib9_14_2::_zi(0); } } } sub _ads { my $__dtt = 1; my $__dtu = authlib9_14_2::_ws("sys_CheckSum"); my $__dtv = $authlib9_14_2::_akn{"hid_checksum"}; if ($__dtv && $__dtv == $__dtu) { $__dtt = 0; } if ($__dtt) { authlib9_14_2::_zq(138, "Access Denied.", "Access Denied. Inconsistency in security check." . $__dtv . " != " . $__dtu . ". ", ""); } } sub _adt { my ($__dty) = @_; if (exists $__dty->{'_hx'}) { my $__dtw = _zo($__dty->{'_hx'}); if ($__dtw eq "") { $__dty->{'_hx'} = 0; } } if (exists $__dty->{'_ho'}) { my $__dtx = _zo($__dty->{'_ho'}); if ($__dtx eq "") { $__dty->{'_ho'} = 0; } } } sub _adu { my ($__duc) = @_; my $__dtz = 1; my $__dua = $__duc; if ($__duc =~ m/^(\d*)\.(\d*)$/) { $__dua = $1; } if ($__dua =~ m/^0+(\d+)$/) { $__dtz = 0; } my $__dub = $__duc; $__dub =~ s/\.//; if ($__dub !~ m/^\d+$/) { $__dtz = 0; } return $__dtz; } sub _adv { my ($__duf) = @_; my $__dud = 1; $__duf = _zo($__duf); my $__due = $__duf; $__due =~ s/\.//; $__due =~ s/^-//; if ($__due !~ m/^\d+$/) { $__dud = 0; } return $__dud; } sub _adw { my ($__dui) = @_; my @__dug = (); my $__duh = 0; for ($__duh = 1; $__duh <= $__dui; $__duh++) { push @__dug, $__duh; } return \@__dug; } sub _adx { my $__duj = "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/ssi_base9_14_2.js\"></script>\n"; return $__duj; } sub _ady { my $__duk = "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/jquery-3.6.0.min.js\"></script>\n"; return $__duk; } sub _adz { my $__dul = "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/jquery-ui-1.12.1.min.js\"></script>\n"; $__dul .= "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/jquery.ui.touch-punch.min.js\"></script>\n"; $__dul .= "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/jquery.dialogOptions.js\"></script>\n"; return $__dul; } sub _aea { my $__dum .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/smoothness/jquery-ui-1.12.1.min.css\">\n"; return $__dum; } sub _aeb { my $__dun = "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/modernizr-3.11.7.js\"></script>\n"; return $__dun; } sub _aec { my $__duo = "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/d3-3.5.17.min.js\"></script>\n"; $__duo .= "<script type=\"text/javascript\" src=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/nv.d3-1.8.6.min.js\"></script>\n"; $__duo .= "<link rel=\"stylesheet\" type=\"text/css\" href=\"" . $authlib9_14_2::_ahv{'_ur'} . "system/nv.d3-1.8.6.css\">\n"; return $__duo; } sub _aed { my ($__duq) = @_; if ($__duq =~ m/(.*?)\./) { $__duq = $1; } my $__dup = 0; my ($__dur, $__dus, $__dut) = authlib9_14_2::_abt($__duq); if (exists($authlib9_14_2::_ahp{$__duq})) { $__dup = $authlib9_14_2::_ahp{$__duq}; } elsif (exists($authlib9_14_2::_ahp{$__dur})) { $__dup = $authlib9_14_2::_ahp{$__dur}; } else { if ($__duq =~ m/(.*?)_(\d+)$/i) { $__dur = $1; if (exists($authlib9_14_2::_ahp{$__dur})) { $__dup = $authlib9_14_2::_ahp{$__dur}; } } } return $__dup; } sub _aee { my ($__dxi, $__dxj, $__dxk, $__dxl, $__dxm, $__dxn, $__dxo) = @_; my $__duu = ""; my $__duv = @{$authlib9_14_2::_ako}; my $__duw = 0; my $__dux = 0; my $__duy = 0; my $__duz = 0; my $__dva = 0; my $__dvb = 0; my $__dvc = 0; my $__dvd = 0; my $__dve = 0; my $__dvf = 0; my $__dvg = ""; my $__dvh = 0; my $__dvi = 0; my $__dvj = 0; my %__dvk = (); my $__dvl = ""; my $__dvm = 0; my @__dvn = (); if (!$__dxj && !$__dxk) { if (!$__dxi && !$authlib9_14_2::_aku) { push @__dvn, ["sys_RespNum", "* Respondent Number"]; } push @__dvn, ["sys_DispositionCode", "[Disposition Code]"]; push @__dvn, ["sys_ScreenWidth", "[Screen Width]"]; authlib9_14_2::_yo(); if ($authlib9_14_2::_aky) { if (exists $authlib9_14_2::_aky->{'_ju'}) { my $__dvo = $authlib9_14_2::_aky->{'_ju'}; if (exists $__dvo->{'_jt'}) { my @__dvp = @{$__dvo->{'_jt'}}; my $__dvo = 0; foreach $__dvo (@__dvp) { if ($__dvo->{'_pj'} eq "numeric" || !$__dxi) { push @__dvn, [$__dvo->{'_if'}, ""]; } } } if (exists $__dvo->{'_w'}) { my @__dvq = @{$__dvo->{'_w'}}; my $__dvr = 0; foreach $__dvr (@__dvq) { if ($__dvr->{'_pj'} eq "numeric" || !$__dxi) { push @__dvn, [$__dvr->{'_if'}, ""]; } } } } if (exists $authlib9_14_2::_aky->{'_jr'}) { my $__dvs = $authlib9_14_2::_aky->{'_jr'}; my $__dvt = 0; foreach $__dvt (@{$__dvs}) { if ($__dvt->{'_pj'} eq "numeric" || !$__dxi) { push @__dvn, [$__dvt->{'_if'}, ""]; } } } } } my $__dvu = 1; my $__dvv = 0; my %__dvw = (); my $__dvx = ""; while ($__dvu <= $__duv) { $__dvx = ""; $__dux = $authlib9_14_2::_ako->[$__dvu - 1]; if (exists $__dux->{'_hm'}) { authlib9_14_2::_adr(); my @__dvy = (); foreach my $__dvz (@{$__dux->{'_hm'}}) { if (not exists $__dvw{$__dvz}) { my %__dwa = (); $__dwa{'_fz'} = 1; $__dwa{'_ho'} = @{authlib9_14_2::_adc($authlib9_14_2::_ame->{$__dvz}->{'_hj'})}; $__dwa{'_v'} = $authlib9_14_2::_ame->{$__dvz}->{'_v'}; $__dvw{$__dvz} = \%__dwa; } unshift @__dvy, $__dvw{$__dvz}->{'_fz'}; } $__dvx = "." . join(".", @__dvy); } $__duw = $__dux->{'_ld'}; $__duz = @{$__duw}; for ($__dvb = 0; $__dvb < $__duz; $__dvb++) { $__duy = $__duw->[$__dvb]; $__dvd = $__duy->{'_iz'}; $__dvg = $__duy->{'_if'}; $__dvh = $__duy->{'_pj'}; if ($__dxj || $__dxk) { if ($__dxk || ($__dxj && $__dvh != &authlib9_14_2::_ANJ)) { _aef(\@__dvn, $__dvg, $__dvx); } } else { if (!$__dxi && $__dvh == &authlib9_14_2::_ANG) { seek $authlib9_14_2::_ajm, ($__dvd), 0; my $__dwb = authlib9_14_2::_zi(0); if ($__dwb->{'_pj'} eq "check") { $__dve = authlib9_14_2::_acx($__dwb->{'_hj'}); if ($__dve && exists($__dve->{'_jq'})) { $__dve = authlib9_14_2::_acx($__dve->{'_jq'}); } if ($__dve && exists($__dve->{'_gk'})) { $__dvi = @{$__dve->{'_gk'}}; } for ($__dvc = 0; $__dvc < $__dvi; $__dvc++) { _aef(\@__dvn, $__dvg . "_" . $__dve->{'_gk'}->[$__dvc]->{'_pt'}, $__dvx); } } else { _aef(\@__dvn, $__dvg, $__dvx); } } elsif ($__dvh == &authlib9_14_2::_ANL) { my $__dwc = 1; my $__dwd = 0; my $__dwe = 0; if ($__dvg =~ m/_Rating(\d+)/i) { $__dwc = $1; } my $__dwf = authlib9_14_2::_za($__dvg, 1); my $__dwg = $__dwf->{'_ae'}; $__dwd = @{$__dwg->[$__dwc - 1]->{'_hf'}}; for ($__dwe = 1; $__dwe <= $__dwd; $__dwe++) { _aef(\@__dvn, $__dvg . "_" . $__dwe, $__dvx); } } elsif ($__dvh == &authlib9_14_2::_ANQ) { seek $authlib9_14_2::_ajm, ($__dvd), 0; my $__dwh = authlib9_14_2::_zi(0); if (exists $__dwh->{'_df'}) { my $__dwi = $__dwh->{'_cv'}; if (exists($__dwh->{'_ph'})) { $__dwi++; } for ($__dvc = 1; $__dvc <= $__dwi; $__dvc++) { _aef(\@__dvn, $__dvg . "_" . $__dvc, $__dvx); } } elsif (exists $__dwh->{'_aw'}) { _aef(\@__dvn, $__dvg . "_b", $__dvx); _aef(\@__dvn, $__dvg . "_w", $__dvx); } else { _aef(\@__dvn, $__dvg, $__dvx); } if (exists $__dwh->{'_eh'}) { _aef(\@__dvn, $__dvg . "_none", $__dvx); } } elsif ($__dvh == &authlib9_14_2::_ANR) { seek $authlib9_14_2::_ajm, ($__dvd), 0; my $__dwj = authlib9_14_2::_zi(0); my $__dwk = $__dwj->{'_pv'}; my $__dwl = @{$__dwk}; my $__dwm = 0; for ($__dvc = 0; $__dvc < $__dwl; $__dvc++) { $__dwm = $__dwk->[$__dvc]; if (ref($__dwm) eq "OpenEndVar" && $__dxi) { } else { if (ref($__dwm) eq "CheckVar") { my $__dwn = $__dwm->{'_iy'}; for ($__dvj = 1; $__dvj <= $__dwn; $__dvj++) { _aef(\@__dvn, $__dwm->{'_if'} . "_" . $__dvj, $__dvx); } } else { _aef(\@__dvn, $__dwm->{'_if'}, $__dvx); } } } } elsif ($__dvh == &authlib9_14_2::_ANS) { seek $authlib9_14_2::_ajm, ($__dvd), 0; my $__dwo = authlib9_14_2::_zi(0); my $__dwp = 0; my $__dwq = $__dwo->{'_pv'}; my $__dwr = @{$__dwq}; my $__dwm = 0; my $__dws = ""; my $__dwt = $__dwo->{'_pu'}; for ($__dvc = 0; $__dvc < $__dwr; $__dvc++) { $__dwm = $__dwq->[$__dvc]; if (ref($__dwm) eq "RadioVar") { _aef(\@__dvn, $__dwm->{'_if'}, $__dvx); } elsif (ref($__dwm) eq "CheckVar" && $__dxi) { $__dws = $__dwm->{'_if'}; if ($__dwt eq "rows") { $__dws .= "_c*"; } else { $__dws =~ s/(_c\d+)/_r\*$1/; } _aef(\@__dvn, $__dws, $__dvx); } elsif (ref($__dwm) eq "OpenEndVar" && $__dxi) { } else { if ($__dwt eq "rows") { $__dve = authlib9_14_2::_acx($__dwo->{'_co'}); } else { $__dve = authlib9_14_2::_acx($__dwo->{'_mw'}); } if ($__dve && exists($__dve->{'_jq'})) { $__dve = authlib9_14_2::_acx($__dve->{'_jq'}); } if ($__dve && exists($__dve->{'_gk'})) { $__dvi = @{$__dve->{'_gk'}}; } for ($__dvj = 1; $__dvj <= $__dvi; $__dvj++) { $__dws = $__dwm->{'_if'}; if ($__dwt eq "rows") { $__dws .= "_c" . $__dvj; } else { $__dws =~ s/(_c\d+)/_r$__dvj$1/; } _aef(\@__dvn, $__dws, $__dvx); } } } } elsif ($__dvh == &authlib9_14_2::_ANT || $__dvh == &authlib9_14_2::_ANU) { seek $authlib9_14_2::_ajm, ($__dvd), 0; my $__dwu = authlib9_14_2::_zi(0); $__dve = authlib9_14_2::_acx($__dwu->{'_hj'}); if ($__dve && exists($__dve->{'_jq'})) { $__dve = authlib9_14_2::_acx($__dve->{'_jq'}); } if ($__dve && exists $__dve->{'_gk'}) { $__dvi = @{$__dve->{'_gk'}}; } for ($__dvj = 1; $__dvj <= $__dvi; $__dvj++) { _aef(\@__dvn, $__dvg . "_" . $__dvj, $__dvx); } } elsif ($__dvh == &authlib9_14_2::_ANW) { $__dvl = $__dvg; if ($__dxi) { $__dvl =~ s/_\d+//; if (!exists $__dvk{$__dvl}) { $__dvk{$__dvl} = $__dvl; } } else { seek $authlib9_14_2::_ajm, $__dvd, 0; my $__dwv = authlib9_14_2::_zi(0); push @__dvn, [$__dvl . "_b", ""]; if (!exists $__dwv->{'_au'}) { _aef(\@__dvn, $__dvl . "_w", $__dvx); } } } elsif ($__dvh == &authlib9_14_2::_ANY) { my $__dww = authlib9_14_2::_aao($__dvg); my $__dwx = authlib9_14_2::_adc($__dww->{'_ac'}); my $__dwy = @{$__dwx}; my $__dwc = 0; for ($__dvc = 0; $__dvc < $__dwy; $__dvc++) { $__dwc = $__dwx->[$__dvc]->{'_pt'}; if (exists $__dww->{'_ad'}->{$__dwc} && exists $__dww->{'_ad'}->{$__dwc}->{'_me'}) { next; } else { _aef(\@__dvn, $__dvg . "_" . $__dwc, $__dvx); } } } elsif ($__dvh == &authlib9_14_2::_ANZ) { if ($__dxi) { if ($__dvg =~ m/(.*?_Screener)1$/i) { } } } elsif (!$__dxi && $__dvh == &authlib9_14_2::_AOA) { } elsif (!$__dxi && $__dvh == &authlib9_14_2::_AOB) { } elsif ($__dvh == &authlib9_14_2::_AOC) { if ($__dxi) { if ($__dvg =~ m/(.*?_ChoiceTask)1$/i) { } } } elsif ($__dvh == &authlib9_14_2::_AOD) { _aef(\@__dvn, $__dvg, $__dvx); } elsif ($__dvh == &authlib9_14_2::_AOE) { seek $authlib9_14_2::_ajm, ($__dvd), 0; my $__dwz = authlib9_14_2::_zi(0); $__dve = authlib9_14_2::_acx($__dwz->{'_hj'}); if ($__dve && exists($__dve->{'_jq'})) { $__dve = authlib9_14_2::_acx($__dve->{'_jq'}); } if ($__dve && exists($__dve->{'_gk'})) { $__dvi = @{$__dve->{'_gk'}}; } for ($__dvj = 1; $__dvj <= $__dvi; $__dvj++) { _aef(\@__dvn, $__dvg . "_" . $__dvj, $__dvx); } } else { if (($__dvh == &authlib9_14_2::_ANJ || $__dvh == &authlib9_14_2::_ANK || $__dvh == &authlib9_14_2::_ANV) || ($__dxi && ($__dvh == &authlib9_14_2::_ANI || $__dvh == &authlib9_14_2::_ANP || $__dvh == &authlib9_14_2::_AOA || $__dvh == &authlib9_14_2::_AOB || $__dvh == &authlib9_14_2::_ANM || $__dvh == &authlib9_14_2::_ANN || $__dvh == &authlib9_14_2::_ANO ))) { } else { _aef(\@__dvn, $__dvg, $__dvx); } } } } $__dvu++; $__dvv = 0; if ($__dvu <= $__duv) { $__dvv = $authlib9_14_2::_ako->[$__dvu - 1]; } if (exists $__dux->{'_hm'}) { my $__dxa = $__dux->{'_hm'}; my %__dxb = (); my $__dxc = 0; if ($__dvv) { if (exists $__dvv->{'_hm'}) { %__dxb = map { $_ => 1 } @{$__dvv->{'_hm'}}; } } foreach my $__dvz (@{$__dxa}) { if (not exists $__dxb{$__dvz}) { if (exists $__dvw{$__dvz}) { $__dxc = $__dvw{$__dvz}->{'_fz'}; $__dxc++; if ($__dxc <= $__dvw{$__dvz}->{'_ho'}) { $__dvu = $__dvw{$__dvz}->{'_v'}->[0]; $__dvw{$__dvz}->{'_fz'} = $__dxc; last; } else { delete $__dvw{$__dvz}; } } } } } } my @__dxd = (); if (!$__dxk) { my $__dxe = 0; my $__dxf = ""; my $__dxg = ""; my $__dxh = 0; foreach $__dxe (@__dvn) { $__dxh = 0; $__dxf = $__dxe->[0]; $__dxg = $__dxe->[1]; if ($__dxl) { $__duu .= _aeg($__dxf, $__dxg, "", $__dxh); } else { $__duu .= _aej($__dxf, $__dxg, $__dxn, $__dxo); } } } return ($__duu, \@__dvn, \@__dxd); } sub _aef { my ($__dxp, $__dxq, $__dxr) = @_; push @{$__dxp}, [$__dxq . $__dxr, ""]; } sub _aeg { my ($__dxu, $__dxv, $__dxw, $__dxx) = @_; if ($__dxv eq "") { $__dxv = $__dxu; } my $__dxs = ""; if ($__dxx) { $__dxs = " checked "; } my $__dxt = ""; $__dxt .= "<div class=\"row checkbox_control\" data-name=\"" . _aei($__dxu) . "\" data-value=\""; if ($__dxx) { $__dxt .= "checked"; } $__dxt .= "\"><div class=\"col graphical_select checkbox_unselected\"></div>"; $__dxt .= "<div class=\"col label_cell\"><label>" . $__dxv . "</label></div></div>"; return $__dxt; } sub _aeh { my ($__dxz, $__dya) = @_; my $__dxy = ""; $__dxy .= "<div class=\"checkbox_group\">\n"; $__dxy .= "<input class=\"checkbox_input\" type=\"hidden\" name=\"" . $__dya . "\" id=\"" . $__dya . "\" value=\""; if (exists $authlib9_14_2::_akn{$__dya}) { $__dxy .= $authlib9_14_2::_akn{$__dya}; } $__dxy .= "\">"; $__dxy .= "<div class=\"row checkbox_control check_all\" data-value=\"\">\n"; $__dxy .= "<div class=\"col graphical_select checkbox_unselected\"></div>\n"; $__dxy .= "<div class=\"col label_cell\"><label>Select All</label></div>\n"; $__dxy .= "</div>\n"; $__dxy .= $__dxz; $__dxy .= "</div>"; return $__dxy; } sub _aei { my ($__dyb) = @_; $__dyb =~ s/"/\\"/g; return $__dyb; } sub _aej { my ($__dye, $__dyf, $__dyg, $__dyh) = @_; if ($__dyf eq "") { $__dyf = $__dye; } my $__dyc = _aek($__dye); if ($__dyg) { $__dyc = "test_" . $__dyc; } my $__dyd = "<option id=\"" . $__dyc . "\" value=\"" . $__dye . "\""; if ($__dyh && $__dyh eq $__dye) { $__dyd .= " selected "; } $__dyd .= ">" . $__dyf . "</option>\n"; return $__dyd; } sub _aek { my ($__dyi) = @_; $__dyi =~ s/\*/XSTARX/g; $__dyi =~ s/\./XDOTX/g; return $__dyi; } sub _ael { my ($__dyl) = @_; my $__dyj = $authlib9_14_2::_akn{"hid_respnum"}; my ($__dym, $__dyn, $__dyo) = authlib9_14_2::_abt($__dyl); my @__dyk = @{authlib9_14_2::_xy($__dyj, {"quest_name" => $__dym . $__dyo, "limbo" => 0})}; if (@__dyk) { return 1; } else { return 0; } } sub _aem { return "test_" . $authlib9_14_2::_akh; } sub _aen { my $__dyp = 0; if ($authlib9_14_2::_akj eq _aem()) { $__dyp = 1; } return $__dyp; } sub _aeo { my ($__dyt) = @_; my $__dyq = ""; if ($__dyt) { my @__dyr = gmtime($__dyt - (5*60*60)); my $__dys = ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")[$__dyr[4]]; $__dyq = sprintf("%d %s %d - %d:%02d:%02d", $__dyr[3],$__dys,($__dyr[5]+1900),$__dyr[2],$__dyr[1],$__dyr[0]); $__dyq .= " EST"; } return $__dyq; } sub _aep { my ($__dyw, $__dyx) = @_; my $__dyu = ""; eval { require "DateTime.pm"; if ($__dyw && $__dyx) { my $__dyv = DateTime->from_epoch( epoch => ($__dyw), time_zone => $__dyx ); $__dyu = $__dyv->strftime("%d %b %Y - %T %Z"); } elsif ($__dyw) { $__dyu = _aeo($__dyw); } }; if ($@) { $__dyu = _aeo($__dyw); } return $__dyu; } sub _aeq { my ($__dzf) = @_; my $__dyy = 0; my $__dyz = ""; my $__dza = 0; my $__dzb = ""; my $__dzc = 0; my $__dzd = ""; my $__dze = 0; $__dyy = int($__dzf / 3600); $__dze = $__dzf - ($__dyy*3600); $__dza = int($__dze / 60); $__dze = $__dze - ($__dza*60); $__dzc = int($__dze); $__dyz = sprintf("%01d", $__dyy); $__dzb = sprintf("%01d", $__dza); $__dzd = sprintf("%01d", $__dzc); return $__dyz . "h " . $__dzb . "m " . $__dzd . "s"; } sub _aer { my $__dzg = 0; if (exists $authlib9_14_2::_akn{"hid_screenwidth"}) { my $__dzh = $authlib9_14_2::_akn{"hid_screenwidth"}; if ($__dzh =~ m/^(\d+)$/) { $__dzg = $1; } } elsif ($authlib9_14_2::_amg == &authlib9_14_2::_AOY || $authlib9_14_2::_amg == &authlib9_14_2::_AOZ) { $__dzg = 2000; } else { $__dzg = authlib9_14_2::_ws("sys_ScreenWidth"); } return $__dzg; } sub _aes { my $__dzi = _aer(); my $__dzj = 0; if ($__dzi && $__dzi <= 800) { $__dzj = 1; } return $__dzj; } sub _aet { my $__dzk = 0; if (($authlib9_14_2::_amg != &authlib9_14_2::_AOY) && ($authlib9_14_2::_amg != &authlib9_14_2::_AOZ)) { $__dzk = 1; } return $__dzk; } sub _aeu { my ($__dzn, $__dzo, $__dzp) = @_; my $__dzl = "$authlib9_14_2::_akj\_data1"; $__dzp->{$__dzl} = 1; $__dzn .= join(", ", map { "`$_`" } sort keys %{$__dzp}); if (@{$__dzo}) { foreach my $__dzm (sort keys %{$__dzp}) { if ($__dzl ne $__dzm) { push @{$__dzo}, "`$__dzl`.`sys_RespNum` = `$__dzm`.`sys_RespNum`"; } } $__dzn .= " WHERE " . join(" AND ", @{$__dzo}); } return $__dzn; } sub _aev { my ($__dzs, $__dzt) = @_; my ($__dzu, $__dzv) = authlib9_14_2::_xk("sys_RespRemoved"); my $__dzq = "$authlib9_14_2::_akj\_data$__dzu"; $__dzs->{$__dzq} = 1; my $__dzr = "((`$__dzq`.`sys_RespRemoved` IS NULL) OR (`$__dzq`.`sys_RespRemoved` = 0))"; if (!$__dzt) { $__dzr = "(`$__dzq`.`sys_RespRemoved` = 1)"; } return $__dzr; } return 1; 
package SSIWebParseBrowser;

my %lang =
(
    'en' => 'English',
    'de' => 'German',
    'fr' => 'French',
    'es' => 'Spanish',
    'it' => 'Italian',
    'da' => 'Danish',
    'ja' => 'Japanese',
    'ru' => 'Russian',
);
my $langRE = join('|', keys %lang);

my %name_map =
(
    'Mozilla'   => 'Netscape',
    'Gecko'     => 'Mozilla',
    'Netscape6' => 'Netscape',
    'MSIE'      => 'Internet Explorer',
);

sub new {
    my $class   = shift;
    my $browser = {};
    bless $browser, ref $class || $class;
    $browser->Parse(shift);
    return $browser;
}

sub Parse {
    my $browser   = shift;
    my $ua_string = shift;
    my $useragent = $ua_string;
    my $version;
    delete $browser->{$_} for keys %{$browser};
    return undef unless $useragent;
    return undef if $useragent eq '-';
    $browser->{user_agent} = $useragent;
    $useragent =~ s/Opera (?=\d)/Opera\//i;

    while ($useragent =~ s/\[(\w+)\]//) {
        push @{$browser->{languages}}, $lang{$1} || $1;
        push @{$browser->{langs}}, $1;
    }

    while ($useragent =~ /\((.*?)\)/) {
        $browser->{detail} .= '; ' if defined($browser->{detail});
        $browser->{detail} .= $1;
        $useragent =~ s/\((.*?)\)//;
    }
    if (defined($browser->{detail})) {
        $browser->{properties} = [split /;\s+/, $browser->{detail}];
    }

    $browser->{useragents} = [grep /\//, split /\s+/, $useragent];

    if ($ua_string =~ /(iPhone|iPad|iPod).*?OS\s+(\d_\d(_\d)?)/) {
        $browser->{name} = 'Safari';
        $browser->{os} = $browser->{ostype} = 'iOS';
        ($browser->{osvers} = $2) =~ s/_/./g;
        if ($useragent =~ m!(Version|CriOS)/((\d+)(\.(\d+)[\.0-9]*)?)!) {
            if ($1 eq 'CriOS') {
                $browser->{name} = 'Chrome';
            }
            $browser->{version}->{v}     = $2;
            $browser->{version}->{major} = $3;
            $browser->{version}->{minor} = $5 if defined($5) && $5 ne '';
        }
    }
    elsif ($ua_string =~ m!\((BlackBerry|BB10).*Version/([0-9\.]+)!) {
        my $version_string = $2;
        $browser->{name} = $browser->{ostype} = 'BlackBerry';
        $browser->{version}->{v} = $version_string;
        if ($version_string =~ m!^([0-9]+)(\.([0-9]+).*)?!) {
            $browser->{version}->{major} = $browser->{osvers} = $1;
            $browser->{os}               = "BlackBerry $1";
            $browser->{version}->{minor} = $3 if defined($3) && $3 ne '';
        }
    }
    elsif ($ua_string =~ m!Mozilla/5.0 \(.*?Windows.*?; rv:((\d+)\.(\d+))\) like Gecko!) {
        $browser->{name} = 'MSIE';
        $browser->{version}->{v} = $1;
        $browser->{version}->{major} = $2;
        $browser->{version}->{minor} = $3;
    } elsif ($useragent =~ m!OPR/((\d+)\.(\d+)\.\d+\.\d+)!) {
        $browser->{name}             = 'Opera';
        $browser->{version}->{v}     = $1;
        $browser->{version}->{major} = $2;
        $browser->{version}->{minor} = $3;
    } elsif ($useragent =~ m!\bVersion/((\d+)\.(\d+)\S*) Safari/!) {
        $browser->{name}             = 'Safari';
        $browser->{version}->{v}     = $1;
        $browser->{version}->{major} = $2;
        $browser->{version}->{minor} = $3;
    } elsif ($useragent =~ m!Opera/.*Version/((\d+)\.(\d+)\S*)$!) {
        $browser->{name}             = 'Opera';
        $browser->{version}->{v}     = $1;
        $browser->{version}->{major} = $2;
        $browser->{version}->{minor} = $3;
    } else {
        my $seenchrome = 0;
        for (@{$browser->{useragents}}) {
            my ($br, $ver) = split /\//;
            $br = 'Chrome' if $br eq 'CriOS';
            if ($br ne 'Safari' || not $seenchrome) {
                $browser->{name} = $br;
                $browser->{version}->{v} = $ver;
                if ($ver =~ m!^v?(\d+)\.(\d+)!) {
                    ($browser->{version}->{major}, $browser->{version}->{minor}) = ($1, $2);
                }
            }
            $seenchrome = 1 if lc($br) eq 'chrome';
            last if lc($br) eq 'iron';
            last if lc($br) eq 'lynx';

            last if lc($br) eq 'opera';
        }
    }

    for (@{$browser->{properties}}) {
        /compatible/i and next;

        unless (defined($browser->{name}) && (lc($browser->{name}) eq 'webtv' || lc($browser->{name}) eq 'opera')) {
            /^MSIE (.*)$/ and do {
                $browser->{name} = 'MSIE';
                $browser->{version}->{v} = $1;
                ($browser->{version}->{major},
                $browser->{version}->{minor}) = split /\./, $1, 2;
            };
        }

        m!^Edge/(([0-9]+)\.([0-9]+))! and do {
            $browser->{name} = 'Edge';
            $browser->{version}->{v} = $1;
            $browser->{version}->{major} = $2;
            $browser->{version}->{minor} = $3;
        };

        if (m!^AOL ([0-9].*)!) {
            $browser->{name} = 'AOL';
            $browser->{version}->{v} = $1;
            ($browser->{version}->{major}, $browser->{version}->{minor}) = split /\./, $browser->{version}->{v};
        }

        /^Konqueror\/([-0-9.a-z]+)/ and do {
            $browser->{name} = 'Konqueror';
            $browser->{version}->{v} = $1;
            ($browser->{version}->{major}, $browser->{version}->{minor}) = split /\./, $browser->{version}->{v};
        };

        /\bCamino\/([0-9.]+)/ and do {
            $browser->{name} = 'Camino';
            $browser->{version}->{v} = $1;
            ($browser->{version}->{major}, $browser->{version}->{minor}) = split /\./, $browser->{version}->{v}, 2;
        } and last;

        if (m!^Opera Mini/([0-9.]+)!) {
            $browser->{name} = 'Opera Mini';
            $browser->{version}->{v} = $1;
            ($browser->{version}->{major}, $browser->{version}->{minor}) = split /\./, $browser->{version}->{v};
        }

        if (/^Win/) {
            $browser->{os} = $_;
            $browser->{ostype} = 'Windows';
            if (/Windows NT\s*((\d+)(\.\d+)?)/ || /^WinNT((\d+)(\.\d+)?)/) {
                $browser->{ostype} = 'Windows NT';
                $version = $1;
                if ($version >= 10) {
                    $browser->{osvers} = '10';
                }
                elsif ($version >= 6.3 && $version < 7) {
                    $browser->{osvers} = '8.1';
                } elsif ($version >= 6.2) {
                    $browser->{osvers} = '8';
                } elsif ($version >= 6.1) {
                    $browser->{osvers} = '7';
                } elsif ($version >= 6.06) {
                    $browser->{osvers} = 'Server 2008';
                } elsif ($version >= 6.0) {
                    $browser->{osvers} = 'Vista';
                } elsif ($version >= 5.1) {
                    $browser->{osvers} = 'XP';
                } elsif ($version >= 5.0) {
                    $browser->{osvers} = '2000';
                } else {
                    $browser->{osvers} = $version;
                }
            }
            elsif (/Windows (\d+(\.\d+)?)/) {
                $browser->{osvers} = $1;
            } elsif (/Win(\w\w)/i) {
                $browser->{osvers} = $1;
            }
        }

        if (/^Mac/) {
            $browser->{os} = $_;
            $browser->{ostype} = 'Macintosh';
            (undef, $browser->{osvers}) = split /[ _]/, $_, 2;
        }

        if (/^PPC$/) {
            $browser->{osarc} = 'PPC';
        }

        if (/Android\s([\.0-9]+)/) {
            $browser->{os}     = 'Android';
            $browser->{ostype} = 'Linux';
            $browser->{osvers} = $1;
        } elsif (/^Linux/) {
            my $lstr = $_;
            $browser->{os}     = 'Linux';
            $browser->{ostype} = 'Linux';
            if ($lstr =~ s/(i386|mips|amd64|sparc64|ppc|i686|i586|armv51|x86|x86-64|x86_64|ppc64|x64|x64_64)\b//) {
                $browser->{osarc} = $1;
            }
            if ($lstr =~ / (\d+\.\S+)/) {
                $browser->{osvers} = $1;
            }
        }

        if (/^(SunOS|Solaris)/i) {
            $browser->{os} = $_;
            $browser->{ostype} = 'Solaris';
            if (/(sun4[a-z]|i86pc)/) {
                $browser->{osarc} = $1;
            }
            if (/^SunOS\s*([0-9\.]+)/) {
                $browser->{osvers} = $1;
            }
        }

        if (/^($langRE)-/ || /^($langRE)$/) {
            my $langCode = $1;
            push(@{$browser->{languages}}, $lang{$langCode});
            push(@{$browser->{langs}}, $langCode);
        }
    }

    if (defined($browser->{name}) && exists $name_map{ $browser->{name} }) {
        $browser->{name} = $name_map{ $browser->{name} };
    }

    $browser->{name} ||= $useragent;

    if ($browser->{name} eq 'Konqueror') {
        $browser->{ostype} ||= 'Linux';
    }

    my %langs_in;

    for (@{$browser->{langs}}) {
        $langs_in{$_}++;
    }

    if (int(keys %langs_in) > 0) {
        ($browser->{lang}) = sort {$langs_in{$a} <=> $langs_in{$b}} keys %langs_in;
        $browser->{language} = $lang{$browser->{lang}} || $browser->{lang};

    }

    my $strOriginalUserAgent = $browser->{user_agent};

    if (exists $browser->{os})
    {
        my $strOS = $browser->{os};

        if ($strOriginalUserAgent =~ m/(Windows Phone)\s+([^);]*)/i)
        {
            $strOS = $1;
            $browser->{osvers} = $2;
        }
        else
        {
            if ($strOS =~ m/Win(?>NT-(?>EV|A|PA)|TSI|dows-Media-Player|64)/i)
            {
                if ($strOriginalUserAgent =~ m/(Windows\s+NT\s+\d+\.\d+)/i)
                {
                    $strOS = $1;
                    $strOS =~ s/NT 5\.1/XP/i;
                    $strOS =~ s/NT 5\.2/XP/i;
                    $strOS =~ s/NT 6\.0/Vista/i;
                    $strOS =~ s/NT 6\.1/7/i;
                    $strOS =~ s/NT 6\.2/8/i;
                    $strOS =~ s/NT 6\.3/8.1/i;
                    $strOS =~ s/NT 10/10/i;

                    $browser->{osvers} = "";
                }
            }
            if ($strOS =~ m/NT/)
            {
                $strOS =~ s/NT 5\.0/2000/i;
                $strOS =~ s/NT 5\.1/XP/i;
                $strOS =~ s/NT 5\.2/XP/i;
                $strOS =~ s/NT 6\.0/Vista/i;
                $strOS =~ s/NT 6\.1/7/i;
                $strOS =~ s/NT 6\.2/8/i;
                $strOS =~ s/NT 6\.3/8.1/i;
                $strOS =~ s/NT 10/10/i;

                $browser->{osvers} = "";
            }
            elsif ($strOS =~ m/9x\s+[\d.]+/i)
            {
                $strOS = "Windows ME";

                $browser->{osvers} = "";
            }
            elsif ($strOS =~ m/Macintosh/i)
            {
                if ($strOriginalUserAgent =~ m/(Mac\s+[^);]*)/i)
                {
                    $strOS = $1;
                    $strOS =~ s/_/\./g;
                }
            }

            elsif ($strOS =~ m/Mac/i)
            {
                if ($strOriginalUserAgent =~ m/(Mac\s+.*?);/i)
                {
                    $strOS = $1;
                    $strOS =~ s/_/\./g;
                }
            }
            elsif ($strOS =~ m/Linux/i)
            {
                if ($strOriginalUserAgent =~ m/(Ubuntu(?:\/\d+(?:\.\d+)*))/i)
                {
                    $strOS = $1;
                }
            }
        }

        $browser->{os} = $strOS;
    }
    else
    {
        if ($strOriginalUserAgent =~ m/CrOS/i)
        {
            $browser->{os} = 'Chrome OS';
        }
    }

    return $browser;
}

1;




























package lite;
require 5.002;











$lite::VERSION = '2.0';




sub new
{
    my $self;

    $self = {
            multipart_dir    =>    undef,
            default_dir      =>    '/tmp',
            file_type        =>    'name',
            platform         =>    'Unix',
            buffer_size      =>    1024,
            timestamp        =>    1,
        filter           =>    undef,
            web_data         =>    {},
        ordered_keys     =>    [],
        all_handles      =>    [],
            error_status     =>    0,
            error_message    =>    undef,
        file_size_limit     =>    2097152,
        };

    $self->{convert} = {
                       'text/html'    => 1,
                       'text/plain'   => 1
                   };

    $self->{file} = { Unix => '/',    Mac => ':',    PC => '\\'       };
    $self->{eol}  = { Unix => "\012", Mac => "\015", PC => "\015\012" };

    bless $self;
    return $self;
}

sub Version
{
    return $lite::VERSION;
}

sub set_directory
{
    my ($self, $directory) = @_;

    stat ($directory);

    if ( (-d _) && (-e _) && (-r _) && (-w _) ) {
    $self->{multipart_dir} = $directory;
    return (1);

    } else {
    return (0);
    }
}

sub add_mime_type
{
    my ($self, $mime_type) = @_;

    $self->{convert}->{$mime_type} = 1 if ($mime_type);
}

sub remove_mime_type
{
    my ($self, $mime_type) = @_;

    if ($self->{convert}->{$mime_type}) {
    delete $self->{convert}->{$mime_type};
    return (1);

    } else {
    return (0);
    }
}

sub get_mime_types
{
    my $self = shift;

    return (sort keys %{ $self->{convert} });
}

sub set_platform
{
    my ($self, $platform) = @_;

    if ($platform =~ /(?:PC|NT|Windows(?:95)?|DOS)/i) {
        $self->{platform} = 'PC';

    } elsif ($platform =~ /Mac(?:intosh)?/i) {


        $self->{platform} = 'Mac';

    } else {
    $self->{platform} = 'Unix';
    }
}

sub set_file_type
{
    my ($self, $type) = @_;

    if ($type =~ /^handle$/i) {
    $self->{file_type} = 'handle';
    } else {
    $self->{file_type} = 'name';
    }
}

sub add_timestamp
{
    my ($self, $value) = @_;

    if ( ($value < 0) || ($value > 2) ) {
    $self->{timestamp} = 1;
    } else {
    $self->{timestamp} = $value;
    }
}

sub filter_filename
{
    my ($self, $subroutine) = @_;

    $self->{filter} = $subroutine;
}

sub set_buffer_size
{
    my ($self, $buffer_size) = @_;
    my $content_length;

    $content_length = $ENV{CONTENT_LENGTH} || return (0);

    if ($buffer_size < 256) {
    $self->{buffer_size} = 256;
    } elsif ($buffer_size > $content_length) {
    $self->{buffer_size} = $content_length;
    } else {
    $self->{buffer_size} = $buffer_size;
    }

    return ($self->{buffer_size});
}

sub parse_new_form_data


{
    my ($self, @param) = @_;

    $self->close_all_files();

    $self->{web_data}    = {};
    $self->{ordered_keys}     = [];
    $self->{all_handles}     = [];
    $self->{error_status}     = 0;
    $self->{error_message}     = undef;

    $self->parse_form_data(@param);
}

sub parse_form_data
{
    my ($self, $user_request) = @_;
    my ($request_method, $content_length, $content_type, $query_string,
    $boundary, $post_data, @query_input);

    $request_method = $user_request || $ENV{REQUEST_METHOD} || '';
    $content_length = $ENV{CONTENT_LENGTH};
    $content_type   = $ENV{CONTENT_TYPE};

    if ($request_method =~ /^(get|head)$/i) {

    $query_string = $ENV{QUERY_STRING};
    $self->_decode_url_encoded_data (\$query_string, 'form');

    return wantarray ?
        %{ $self->{web_data} } : $self->{web_data};

    } elsif ($request_method =~ /^post$/i) {

    if (!$content_type ||
        ($content_type eq 'application/x-www-form-urlencoded') ||
         $content_type eq 'application/x-www-form-urlencoded; charset=UTF-8') {

        local $^W = 0;

        read (STDIN, $post_data, $content_length);
        $self->_decode_url_encoded_data (\$post_data, 'form');

        return wantarray ?
        %{ $self->{web_data} } : $self->{web_data};

    } elsif ($content_type =~ /multipart\/form-data/) {
        ($boundary) = $content_type =~ /boundary=(\S+)$/;
        $self->_parse_multipart_data ($content_length, $boundary);

        return wantarray ?
        %{ $self->{web_data} } : $self->{web_data};

    } else {
        $self->_error ('Invalid content type!');
    }

    } else {





    print "[ Reading query from standard input. Press ^D to stop! ]\n";

    @query_input = <>;
    chomp (@query_input);

    $query_string = join ('&', @query_input);
    $query_string =~ s/\\(.)/sprintf ('%%%x', ord ($1))/eg;

    $self->_decode_url_encoded_data (\$query_string, 'form');

    return wantarray ?
        %{ $self->{web_data} } : $self->{web_data};
    }
}

sub parse_cookies
{
    my $self = shift;
    my $cookies;

    $cookies = $ENV{HTTP_COOKIE} || return;

    $self->_decode_url_encoded_data (\$cookies, 'cookies');

    return wantarray ?
        %{ $self->{web_data} } : $self->{web_data};
}

sub get_ordered_keys
{
    my $self = shift;

    return wantarray ?
    @{ $self->{ordered_keys} } : $self->{ordered_keys};
}

sub print_data
{
    my $self = shift;
    my ($key, $value, $eol);

    $eol = $self->{eol}->{$self->{platform}};

    foreach $key (@{ $self->{ordered_keys} }) {
    $value = $self->{web_data}->{$key};

    if (ref $value) {
        print "$key = @$value$eol";
    } else {
        print "$key = $value$eol";
    }
    }
}

sub print_mime_type
{
    my ($self, $field) = @_;

    return($self->{'mime_types'}->{$field});
}

*print_form_data = *print_cookie_data = \&print_data;

sub wrap_textarea
{
    my ($self, $string, $length) = @_;
    my ($new_string, $platform, $eol);

    $length     = 70 unless ($length);
    $platform   = $self->{platform};
    $eol        = $self->{eol}->{$platform};
    $new_string = $string || return;

    $new_string =~ s/[\0\r]\n?/ /sg;
    $new_string =~ s/(.{0,$length})\s/$1$eol/sg;

    return $new_string;
}

sub get_multiple_values
{
    my ($self, $array) = @_;

    return (ref $array) ? (@$array) : $array;
}

sub create_variables
{
    my ($self, $hash) = @_;
    my ($package, $key, $value);

    $package = $self->_determine_package;

    while (($key, $value) = each %$hash) {
    ${"$package\:\:$key"} = $value;
    }
}

sub is_error
{
    my $self = shift;

    if ($self->{error_status}) {
    return (1);
    } else {
    return (0);
    }
}

sub get_error_message
{
    my $self = shift;

    return $self->{error_message} if ($self->{error_message});
}

sub return_error
{
    my ($self, @messages) = @_;

    print "@messages\n";

    exit (1);
}




sub browser_escape
{
    my $string = shift;

    $string =~ s/([<&"#%>])/sprintf ('&#%d;', ord ($1))/ge;

    return $string;
}

sub url_encode
{
    my $string = shift;

    $string =~ s/([\x00-\x20"#%;<>?{}|\\\\^~`\[\]\x7F-\xFF])/
                 sprintf ('%%%x', ord ($1))/eg;

    return $string;
}




sub url_decode
{
    my $string = shift;

    $string =~ s/%([\da-fA-F]{2})/chr (hex ($1))/eg;

    return $string;
}

sub is_dangerous
{
    my $string = shift;

    if ($string =~ /[;<>\*\|`&\$!#\(\)\[\]\{\}:'"]/) {
        return (1);
    } else {
        return (0);
    }
}

sub escape_dangerous_chars
{
    my $string = shift;

    $string =~ s/([;<>\*\|`&\$!#\(\)\[\]\{\}:'"])/\\$1/g;

    return $string;
}




sub _error
{
    my ($self, $message) = @_;

    $self->{error_status}  = 1;
    $self->{error_message} = $message;
}

sub _determine_package
{
    my $self = shift;
    my ($frame, $this_package, $find_package);

    $frame = -1;
    ($this_package) = split (/=/, $self);

    do {
    $find_package = caller (++$frame);
    } until ($find_package !~ /^$this_package/);

    return ($find_package);
}




sub _decode_url_encoded_data
{
    my ($self, $reference_data, $type) = @_;
    my $code;

    $code = <<'End_of_URL_Decode';

    my (@key_value_pairs, $delimiter, $key_value, $key, $value);

    @key_value_pairs = ();

    return unless ($$reference_data);

    if ($type eq 'cookies') {
    $delimiter = ';\s+';
    } else {
    $delimiter = '&';
    }

    $$reference_data =~ tr/+/ /;
    @key_value_pairs = split (/$delimiter/, $$reference_data);

    foreach $key_value (@key_value_pairs) {
    ($key, $value) = split (/=/, $key_value, 2);

    $value = '' unless defined $value;

    $key   =~ s/%([\da-fA-F]{2})/chr (hex ($1))/eg;
    $value =~ s/%([\da-fA-F]{2})/chr (hex ($1))/eg;

    if ( defined ($self->{web_data}->{$key}) ) {
        $self->{web_data}->{$key} = [$self->{web_data}->{$key}]
            unless ( ref $self->{web_data}->{$key} );

        push (@{ $self->{web_data}->{$key} }, $value);
    } else {
        $self->{web_data}->{$key} = $value;
        push (@{ $self->{ordered_keys} }, $key);
    }
    }

End_of_URL_Decode

    eval ($code);
    $self->_error ($@) if $@;
}




sub _parse_multipart_data
{
    my ($self, $total_bytes, $boundary) = @_;
    my ($code, $files);

    local $^W = 0;
    $files    = {};

    $code = <<'End_of_Multipart';

    my ($seen, $buffer_size, $byte_count, $platform, $eol, $handle,
    $directory, $bytes_left, $buffer_size, $new_data, $old_data,
    $current_buffer, $changed, $store, $disposition, $headers,
        $mime_type, $convert, $field, $file, $new_name, $full_path);

    $seen        = {};
    $buffer_size = $self->{buffer_size};
    $byte_count  = 0;
    $platform    = $self->{platform};
    $eol         = $self->{eol}->{$platform};
    $handle      = 'CL00';
    $directory   = $self->{multipart_dir} || $self->{default_dir};

    while (1) {
    if ( ($byte_count < $total_bytes) &&
         (length ($current_buffer) < ($buffer_size * 2)) ) {

        $bytes_left  = $total_bytes - $byte_count;
        $buffer_size = $bytes_left if ($bytes_left < $buffer_size);

        read (STDIN, $new_data, $buffer_size);
            $self->_error ("Oh, Oh! I'm upset! Can't read what I want.")
        if (length ($new_data) != $buffer_size);

        $byte_count += $buffer_size;

        if ($old_data) {
        $current_buffer = join ('', $old_data, $new_data);
        } else {
        $current_buffer = $new_data;
        }

    } elsif ($old_data) {
        $current_buffer = $old_data;
        $old_data = undef;

    } else {
        last;
    }

    $changed = 0;







    if ($current_buffer =~
            /(.*?)(?:\015?\012)?-*$boundary-*[\015\012]*(?=(.*))/os) {

        ($store, $old_data) = ($1, $2);

            if ($current_buffer =~
             /[Cc]ontent-[Dd]isposition: ([^\015\012]+)\015?\012  # Disposition
              (?:([A-Za-z].*?)(?:\015?\012){2})?                  # Headers
              (?:\015?\012)?                                      # End
              (?=(.*))
             /xs) {

        ($disposition, $headers, $current_buffer) = ($1, $2, $3);
        $old_data = $current_buffer;

        ($mime_type) = $headers =~ /[Cc]ontent-[Tt]ype: (\S+)/;

        $self->_store ($platform, $file, $convert, $handle, $eol,
                   $field, \$store, $seen);

        close ($handle) if (fileno ($handle));

        if ($mime_type && $self->{convert}->{$mime_type}) {
            $convert = 1;
        } else {
            $convert = 0;
        }

        $changed = 1;

        ($field) = $disposition =~ /name="([^"]+)"/;
        ++$seen->{$field};

        $self->{'mime_types'}->{$field} = $mime_type;

                if ($seen->{$field} > 1) {
                    $self->{web_data}->{$field} = [$self->{web_data}->{$field}]
                        unless (ref $self->{web_data}->{$field});
                } else {
                    push (@{ $self->{ordered_keys} }, $field);
                }

                if (($file) = $disposition =~ /filename="(.*)"/) {
                    $file =~ s|.*[:/\\](.*)|$1|;

                    $new_name = $self->_get_file_name ($platform,
                                                       $directory, $file);

                    $self->{web_data}->{$field} = $new_name;

                    $full_path = join ($self->{file}->{$platform},
                                       $directory, $new_name);

                    open (++$handle, ">$full_path")
                    || $self->_error ("Can't create file: $full_path!");

                    $files->{$new_name} = $full_path;
                }
            }

    } elsif ($old_data) {
            $store    = $old_data;
            $old_data = $new_data;

    } else {
        $store          = $current_buffer;
            $current_buffer = $new_data;
        }

        unless ($changed) {
           $self->_store ($platform, $file, $convert, $handle, $eol,
                          $field, \$store, $seen);
        }
    }

    close ($handle) if (fileno ($handle));

End_of_Multipart

    eval ($code);
    $self->_error ($@) if $@;

    $self->_create_handles ($files) if ($self->{file_type} eq 'handle');
}

sub _store
{
    my ($self, $platform, $file, $convert, $handle, $eol, $field,
    $info, $seen) = @_;

    if ($file) {
    if ($convert) {
        $$info =~ s/\015\012/$eol/og  if ($platform ne 'PC');
        $$info =~ s/\015/$eol/og      if ($platform ne 'Mac');
        $$info =~ s/\012/$eol/og      if ($platform ne 'Unix');
    }

        print $handle $$info;

    } elsif ($field) {
    if ($seen->{$field} > 1) {
        $self->{web_data}->{$field}->[$seen->{$field}-1] .= $$info;
    } else {
        $self->{web_data}->{$field} .= $$info;
        }
    }
}

sub _get_file_name
{
    my ($self, $platform, $directory, $file) = @_;
    my ($filtered_name, $filename, $timestamp, $path);

    $filtered_name = &{ $self->{filter} }($file)
        if (ref ($self->{filter}) eq 'CODE');

    $filename  = $filtered_name || $file;
    $timestamp = time . '__' . $filename;

    if (!$self->{timestamp}) {
    return $filename;

    } elsif ($self->{timestamp} == 1) {
    return $timestamp;

    } elsif ($self->{timestamp} == 2) {
    $path = join ($self->{file}->{$platform}, $directory, $filename);

    return (-e $path) ? $timestamp : $filename;
    }
}

sub _create_handles
{
    my ($self, $files) = @_;
    my ($package, $handle, $name, $path);

    $package = $self->_determine_package;

    while (($name, $path) = each %$files) {
    $handle = "$package\:\:$name";
    open ($handle, "<$path")
            || $self->_error ("Can't read file: $path!");

    push (@{ $self->{all_handles} }, $handle);
    }
}

sub close_all_files
{
    my $self = shift;
    my $handle;

    foreach $handle (@{ $self->{all_handles} }) {
    close $handle;
    }
}

1;


package htmlentity;

%htmlentity::subst;
@htmlentity::multibyte = ();
$htmlentity::multibytecnt = 0;

sub encode
{
    return undef unless defined $_[0];
    my $ref;
    if (defined wantarray)
    {
        my $x = $_[0];
        $ref = \$x;
    }
    else
    {
        $ref = \$_[0];
    }

    my %char2entity = ('&' => '&amp;',
                   '>' => '&gt;',
               '<' => '&lt;',
               "'" => '&apos;',
               '"' => '&quot;');

    if (defined $_[1] && length($_[1]))
    {
        unless (exists $htmlentity::subst{$_[1]})
        {
            my $chars = $_[1];

            $chars =~ s { (?<!\\) ([]/]) } { \\$1 }gox;
            $chars =~ s { (?<!\\) \\\z } { \\\\ }gox;

            my $code = "sub {\$_[0] =~ s/([$chars])/\$char2entity{\$1} || num_entity(\$1)/ge";

            $htmlentity::subst{$_[1]} = eval $code;
            if ($@)
            {
                die("$@ while trying to turn range: \"$_[1]\"\n into code: $code\n");
            }
            &{$htmlentity::subst{$_[1]}}($$ref);
        }
    }
    else
    {

        $$ref =~ s/([^\n\r\t !\#\$%\(-;=?-~])/$char2entity{$1} || num_entity($1)/ge;
    }
    return $$ref;
}

sub num_entity
{
    my $var = $_[0];

    if ($htmlentity::multibytecnt == 0)
    {
        my $int = ord($var);






        if (194 <= $int && $int <= 223)
        {
            push (@htmlentity::multibyte, $var);
            $htmlentity::multibytecnt = 2;
        }

        elsif (224 <= $int && $int <= 239)
        {
            push (@htmlentity::multibyte, $var);
            $htmlentity::multibytecnt = 3;
        }
        elsif (240 <= $int && $int <= 255)
        {
            push (@htmlentity::multibyte, $var);
            $htmlentity::multibytecnt = 4;
        }
        else
        {

            return sprintf("&#x%X", $int);
        }
    }
    else
    {
        push (@htmlentity::multibyte, $var);
        if (@htmlentity::multibyte == $htmlentity::multibytecnt)
        {
            my %codepoint = (2 => 0x1F, 3 => 0x0F, 4 => 0x07);
            my $firstbitmask = $codepoint{$htmlentity::multibytecnt};
            my $remainingbitmask = 0x3F;
            my $int = ord($htmlentity::multibyte[0]) & $firstbitmask;

            for (my $i = 1; $i < $htmlentity::multibytecnt; $i++)
            {
                $int <<= 6;
                $int |= ($remainingbitmask & ord($htmlentity::multibyte[$i]));
            }
            $htmlentity::multibytecnt = 0;
            @htmlentity::multibyte = ();
            return sprintf("&#x%X;", $int);
        }
    }
    return "";
}
