# == Class: hierabackend
#
# Simple drop in replacement to hiera() to specify the backend that
# should be used for the query
#
# === Functions
# hiera_has_backend(<backend>)
# Returns true or false if the argument <backend> is configured
#
# hiera_backend(<backend>, <query>, [ <default>, [ <override> ] ] )
# Perform a hiera lookup, first argument is the back end you wish to use
# followed by the usual hiera() args.
#
# === Examples
#
#  if hiera_has_backend('gpg') {
#    $password = hiera_backend('gpg', 'password')
#  }
#
# === Authors
#
# Craig Dunn <craig@craigdunn.org>
#
# === Copyright
#
# Copyright 2012 Craig Dunn
#
class hierabackend {

}
