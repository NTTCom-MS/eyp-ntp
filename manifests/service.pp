class ntp::service (
                        $manage_service        = true,
                        $manage_docker_service = true,
                        $ensure                = 'running',
                        $enable                = true,
                      ) inherits ntp::params {

  #
  validate_bool($manage_docker_service)
  validate_bool($manage_service)
  validate_bool($enable)

  validate_re($ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${ensure}")

  if(getvar('::eyp_docker_iscontainer')==undef or
      getvar('::eyp_docker_iscontainer')==false or
      getvar('::eyp_docker_iscontainer') =~ /false/ or
      $manage_docker_service)
  {
    if($manage_service)
    {
      #service or exec here
    }
  }
}
