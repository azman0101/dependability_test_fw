

node /^node1/ {

include sources::persistent

exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

Exec["apt-update"] -> Package <| |>

	#ensure git is installed
	package { 'git':
		ensure 		=> 'present',
	}

	#ensure yum is installed
	package { 'yum':
		ensure 		=> 'present',
	}

	#ensure vim is installed
	package { 'vim':
		ensure 		=> 'present',
	}

        #ensure sshpass is installed
	package { 'sshpass':
		ensure 		=> 'present',
	}

	#ensure drbd8-utils is installed
	package { 'drbd8-utils':
		ensure 		=> 'present',
	}

        #ensure postgresql is installed
	package { 'postgresql':
		ensure 		=> 'present',
	}
	package { 'postgresql-9.1':
		ensure 		=> 'present',
	}
	package { 'postgresql-contrib-9.1':
		ensure 		=> 'present',
	}

	#ensure mysql is installed
	package { 'mysql-server':
		ensure 		=> 'present',
	}

        #ensure apache2 is installed
	package { 'apache2':
		ensure 		=> 'present',
	}

        #ensure xfsprogs is installed
	package { 'xfsprogs':
		ensure 		=> 'present',
	}

        #ensure heartbeat is installed
	package { 'heartbeat':
		ensure 		=> 'present',
	}

        #ensure corosync is installed
	package { 'corosync':
		ensure 		=> 'present',
	}

        #ensure pacemaker is installed
	package { 'pacemaker':
		ensure 		=> 'present',
	}

	#ensure cman is installed
	package { 'cman':
		ensure 		=> 'present',
	}

exec { "hosts-update1":
    command => "/bin/echo '192.168.22.11    node1 node1 precise64' >> /etc/hosts"
}

exec { "hosts-update2":
    command => "/bin/echo '10.1.1.31       node1 node1 precise64' >> /etc/hosts"
}

exec { "hosts-update3":
    command => "/bin/echo '10.1.1.32       node2 node2 precise64' >> /etc/hosts"
}

Exec["hosts-update1"] -> Exec["hosts-update2"] -> Exec["hosts-update3"]


#sed -i -e 's/writestate = 1/writestate = 0/g' test
#sudo sed -i -e 's/filter = \[ "a\/.*\/" \]/filter = \[ "r|\/dev\/sdb|", "r|\/dev\/disk\/*|", "r|\/dev\/block\/*|", "a|.*|" \]/g' /etc/lvm/lvm.conf

# filter = [ "a/.*/" ]

# filter = [ "r|/dev/sdb|", "r|/dev/disk/*|", "r|/dev/block/*|", "a|.*|" ]


# sudo sed -i -e 's/write_cache_state = 1/write_cache_state = 0/g' /etc/lvm/lvm.conf
#write_cache_state = 1
# write_cache_state = 0
# sudo update-initramfs -u

# sudo touch /etc/drbd.d/pg.res
#echo "resource pg {" >> /etc/drbd.d/pg.res
#echo "  device minor 0;" >> /etc/drbd.d/pg.res
#echo "  disk /dev/sdb;" >> /etc/drbd.d/pg.res

#echo "  syncer {" >> /etc/drbd.d/pg.res
#echo "    rate 150M;" >> /etc/drbd.d/pg.res
#echo "    verify-alg md5;" >> /etc/drbd.d/pg.res
#echo "  }" >> /etc/drbd.d/pg.res

#echo "  on node1 {" >> /etc/drbd.d/pg.res
#echo "    address 10.1.1.31:7788;" >> /etc/drbd.d/pg.res
#echo "    meta-disk internal;" >> /etc/drbd.d/pg.res
#echo "  }" >> /etc/drbd.d/pg.res
#echo "  on node2 {" >> /etc/drbd.d/pg.res
#echo "    address 10.1.1.32:7788;" >> /etc/drbd.d/pg.res
#echo "    meta-disk internal;" >> /etc/drbd.d/pg.res
#echo "  }" >> /etc/drbd.d/pg.res
#echo "}" >> /etc/drbd.d/pg.res

#update-rc.d drbd disable

#yes yes | sudo drbdadm create-md pg
#sudo drbdadm up pg

#pvcreate /dev/drbd0
#vgcreate VG_PG /dev/drbd0
#lvcreate -L 4800M -n LV_DATA VG_PG

#192.168.1.11    node1 node1 precise64
#10.1.1.31       node1 node1 precise64
#10.1.1.32       node2 node2 precise64


}
