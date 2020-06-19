if [[ -a /var/vcap/instance ]]; then
    HOST=$(cat /var/vcap/instance/name)/$(cat /var/vcap/instance/id)
fi

if [[ -a /var/vcap/bosh ]]; then
    monit() {
        sudo /var/vcap/bosh/bin/monit $@
    }
fi

if [[ -a /var/vcap/jobs/bpm/bin ]]; then
    bpm() {
        sudo /var/vcap/jobs/bpm/bin/bpm $@
    }
fi
