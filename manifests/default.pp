# common tools
package {
  [
    'git',
    'wget', 
    'binutils',
    'build-essential',
  ]:
  ensure => latest,
}

# ctf tools
package {
  [
    'strace',
    'ltrace',    
  ]:
  ensure => latest,
}

# radare2
exec { 'radare2-clone':
  path    => ['/usr/bin'],
  command => 'git clone --depth 1 https://github.com/radare/radare2.git',
  cwd     => '/usr/local/src',
  creates => '/usr/local/src/radare2',
  require => Package['git'],
}

exec { 'radare2-install':
  path    => ['/bin', '/usr/bin'],
  command => 'sh -c sys/install.sh',
  cwd     => '/usr/local/src/radare2',
  creates => '/usr/bin/r2pm',
  require => Exec['radare2-clone'],
}

# gdb
package { 'gdb':
  ensure => latest,
}

file { '/home/vagrant/.gdbinit':
  owner   => 'vagrant',
  group   => 'vagrant',
  content => template('manifests/home/vagrant/.gdbinit'),
}

# peda
exec { 'peda-clone':
  path    => ['/usr/bin'],
  command => 'git clone --depth 1 https://github.com/longld/peda.git',
  cwd     => '/usr/local/src',
  creates => '/usr/local/src/peda',
  require => Package['git'],
}

