#!/usr/bin/expect -f

        set timeout 20
        set IPaddress [lindex $argv 0]
        set Username "netadmin"
        set Password "Syntegra1"
        set Directory ~/Desktop/logs

        log_file -a $Directory/session_$IPaddress.log

        # "### /START-TELNET-SESSION/ IP: $IPaddress @ [exec date] ###\r"

        spawn ssh $IPaddress

	expect "*ser: "

	send "$Username\r"

        expect "*assword: "

        send "$Password\r"

#        expect "*>"

#        send "show client wlan 1\r"

        expect "*>"

        send "show client wlan 2\r"

        expect "*>"

        send "show client wlan 3\r"

 #       expect "*>"

 #       send "show client wlan 4\r"

        expect "*>"

        send "logout\r"

        sleep 1

        # echo "\r### /END-TELNET-SESSION/ IP: $IPaddress @ [exec date] ###\r"

exit
