#
class profiles::rkhunter {

  include ::rkhunter

  if ::rkhunter::cron_check {

  cron { 'rkhunter check':
    command => 'rkhunter --check --sk | logger -t RKHUNTER_CHECK',
    user    => root,
    hour    => '2',
    minute  => '20',
  }

  }

}