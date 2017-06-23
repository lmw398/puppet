class puppet {
	file { '/usr/local/bin/papply':
	   source => 'puppet:///modules/puppet/papply.sh',
	   mode => '0755',
	}
	
	file { '/usr/local/bin/pull-updates':
	   source => 'puppet:///modules/puppet/pull-updates.sh',
	   mode => '0755',
	}
	file { '/home/puppet/.ssh/id_rsa.pub':
           source => 'puppet:///modules/puppet/puppet.pub',
           mode => '0600',
        }
	file { '/home/puppet/.ssh/id_rsa':
           source => 'puppet:///modules/puppet/puppet.priv',
           mode => '0600',
        }
        file { '/home/puppet/test.txt':
           source => 'puppet:///modules/puppet/puppet.priv',
           mode => '0600',
        }

	cron { 'run-puppet':
	    ensure => present,
	    user => 'puppet',
 	    command =>'/usr/local/bin/pull-updates',
	    minute => '*/10',
	    hour => '*',
	}
}
