if pidof -s redis-server > /dev/null; then
    echo 'Redis is already running!'
else
    echo 'process not found...'
    systemctl start redis
fi
echo "$(date) Finished processing Redis check ..."
# End of Script
