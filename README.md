# zabbix-https-checker
Simple scripts for monitoring state of ssl certificates and http codes via zabbix.

### Provides

Auto discovery from `domains.txt`.
###### Items prototypes
* **ssl status for {#DOMAIN}** - BAD/GOOD
* **ssl ttl for {#DOMAIN}** - number of days before the expiration date
* **http code for {#DOMAIN}** - http result code of / page.

###### Trigger prototypes
* **bad ssl certificate for {#DOMAIN}**
* **low ttl for ssl certificate for {#DOMAIN}** - expires in 7 days or less
* **Bad http code for {#DOMAIN}** - code < 200 || code > 401

___

### Installation

``` bash
# cd /opt
# git clone https://github.com/tarwirdur/zabbix-https-checker
# echo "google.com" > zabbix-https-checker/domains.txt # add some domains
# chown -R zabbix:zabbix zabbix-https-checker
# echo "UserParameter=sslchecker[*],/opt/zabbix-https-checker/zabbix.sh "$1" "$2" > /etc/zabbix/zabbix_agentd.d/userparameter_zabbix_https_checker.conf
# crontab -u zabbix -l | (cat - ; echo "10 * * * * /opt/zabbix-https-checker/cron.sh &> /dev/null") | crontab -u zabbix -
```

Import `template_zabbix-https-checker.xml` to zabbix server and link with your host.

