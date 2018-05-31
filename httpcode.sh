#!/bin/bash
DOMAIN=$1

CODE="$(curl -s -o /dev/null -w "%{http_code}" -k -m 5 https://$DOMAIN 2> /dev/null)"
[ "x$CODE" = "x000" ] && CODE="$(curl -s -o /dev/null -w "%{http_code}" -k -m 10 https://$DOMAIN 2> /dev/null)"
[ "x$CODE" = "x000" ] && CODE="$(curl -s -o /dev/null -w "%{http_code}" -k -m 10 https://$DOMAIN 2> /dev/null)"
echo $CODE
