ls -a | rg -v "^\.+$" | awk '{print "\"" $0 "\""}' | xargs -I {} du -sh {} | sort -h
