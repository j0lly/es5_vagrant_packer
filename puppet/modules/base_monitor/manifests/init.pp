class base_monitor {
  file {
    "/tmp/hello":
      ensure => file,
      source => "puppet:///modules/base_monitor/hello";
  }
}
