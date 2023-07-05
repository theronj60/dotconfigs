#!/bin/sh
# weekly clean php-fpm logs
# min - hour - doy/month - month - day/week
#
# crontab -e <- open crontab file, insert line below
# 0 9 * * 5 sh /Users/scripts/example.sh <- path to script
# above cron is set to friday at 9am

LOGFILE=/opt/homebrew/var/log/php-fpm.log

if test -f "$LOGFILE"; then
    echo "$LOGFILE exists."
    echo "" > "$LOGFILE"
    echo "$LOGFILE cleared."
    tail "$LOGFILE"
else
    echo "$LOGFILE does not exist."
fi
