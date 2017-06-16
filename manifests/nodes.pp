node 'kfdbtest' {
	file { '/tmp/hello':
		content => "hello,world\n",
	}
}

