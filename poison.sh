#!/bin/bash
target='http://fbtores666.uw.hu/login.php'
delay="1s"

while :
do
	length=$(( $RANDOM % 7 + 5 ))
	password=$(pwgen -c $length 1)
	user_length=$(( $RANDOM % 3 + 2 ))
	
	user=$(sort -R userlist.txt | head -$user_length | tr -d '\n' | sed 's/^\./a/g' | sed 's/\.$/b/g')
	domain=$(sort -R domainlist.txt | head -1)

	email="$user@$domain"
	postdata="ppemail=$email&pppasswd=$password"
	wget --post-data "$postdata" --max-redirect=0 -O /dev/null "$target"
	sleep $delay
done
