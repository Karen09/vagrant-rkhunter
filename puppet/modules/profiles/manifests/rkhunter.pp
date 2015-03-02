#
class profiles::rkhunter {

  include ::rkhunter

 if ::rkhunter::cron_propupd {

  cron { 'rkhunter propupd':
    command => 'rkhunter --propupd | logger -t RKHUNTER_PROPUPD',
    user    => root,
    hour    => '2',
    minute  => '10',
  }

  }

  if ::rkhunter::cron_rpm {

  cron { 'rkhunter pkgmgr RPM':
    command => 'rkhunter --propupd --pkgmgr RPM | logger -t RKHUNTER_RPM',
    user    => root,
    hour    => '2',
    minute  => '15',
  }

  }

  if ::rkhunter::cron_check {

  cron { 'rkhunter check':
    command => 'rkhunter --check --sk | logger -t RKHUNTER_CHECK',
    user    => root,
    hour    => '2',
    minute  => '20',
  }

  }

}