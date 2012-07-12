puppet module for drbd
======================

DRBD is a distributed replicated blockdevice designed to form high availability
clusters by mirroring a whole blockdevice via network.
This module will help you to setup a simple DRBD cluster by generating various config files.

Basic usage
-----------

To install DRBD

	class {'drbd':
		service_ensure => 'running',
		service_enable => false,
	}


Setup the global_common.conf
------------------------

	class {'drbd::global_common':
		global => {
			'usage_count' => 'no'
		},
		common => {
			'proto'  => 'C',
			'syncer' => {
				'rate' => '100M'
			}
		}
	}


Configure a resource
------------------------

	drbd::resource {'r0':
		hosts         => [ 'drbd01','drbd02' ],
		ips           => [ '192.168.0.1', '192.168.0.2' ],
		disks         => [ '/dev/vstorage/misc', '/dev/vstorage/misc' ],
		dev           => '/dev/drbd0',
		rate          => '100M',
		port          => '7789',
	}

Caveats
-------

None so far.

Copyright and License
---------------------

Copyright (C) 2012 Patrick Ringl <patrick_@freenet.de>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


