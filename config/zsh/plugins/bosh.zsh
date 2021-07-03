if [[ -a /var/vcap/instance ]]; then
    HOST=$(cat /var/vcap/instance/name)/$(cat /var/vcap/instance/id)
fi

if [[ -a /etc/profile.d/cfdot.sh ]]; then
    source /etc/profile.d/cfdot.sh
fi

if [[ -a /var/vcap/bosh ]]; then
    monit() {
        sudo /var/vcap/bosh/bin/monit "$@"
    }
fi

if [[ -a /var/vcap/jobs/bpm/bin ]]; then
    bpm() {
        sudo /var/vcap/jobs/bpm/bin/bpm "$@"
    }
fi

if [[ -a /var/vcap/packages/cfdot/bin ]]; then
    cfdot() {
        /var/vcap/packages/cfdot/bin/cfdot "$@"
    }

    cfdot-runc() {
        local guid
        local address=$1
        local port=$2
        shift 2

        guid=$(cfdot actual-lrps |
            jq -r --slurp \
                --arg address "$address" \
                --arg port "$port" \
                '.[] | select(.address == $address and (.ports | any(.host_port | tostring == $port))) | .instance_guid')

        sudo /var/vcap/packages/runc/bin/runc --root \
            /run/containerd/runc/garden exec -t "$guid" /bin/bash
    }
fi
