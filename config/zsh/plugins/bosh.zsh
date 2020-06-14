if [[ -a /var/vcap/instance ]]; then
    HOST=$(cat /var/vcap/instance/name)/$(cat /var/vcap/instance/id)
fi
