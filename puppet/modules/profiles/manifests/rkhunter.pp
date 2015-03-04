#
class profiles::rkhunter {

  include ::rkhunter

  exec { "cron propupd":
    path        => ["/usr/bin", "/usr/sbin"],
    command     => 'rkhunter --propupd | logger -t RKHUNTER_PROPUPD',
    subscribe   => Package["$rkhunter::params::packageCommon"],
    refreshonly => true,
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