if (( $+commands[kubectl-evict] )); then
    _fzf_complete_kubectl_evict() {
        kubectl_options_argument_required+=(
            -l
            --selector
        )

        _fzf_complete_kubectl_parse_resource_and_name 2
        _fzf_complete_kubectl_parse_completing_option
        _fzf_complete_kubectl_parse_kubectl_arguments

        if [[ -n $completing_option ]]; then
            return 1
        fi

        if [[ -z $resource ]]; then
            resource_suffix=/
            _fzf_complete_kubectl-resources '' "$@"
            return
        fi

        _fzf_complete_kubectl-resource-names '' "$@"
        return
    }
fi
