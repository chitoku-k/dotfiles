# hexium310/array_group_by_range.zsh
# https://gist.github.com/hexium310/76a40d80b7014ca29685350d46667335
group-by-range() {
    local number
    local numbers=(${(z)1})
    local separator=${2--}
    local tmp_separator=,
    local result=()

    local positives=(${(no)${numbers:#-*}})
    local negatives=(${(nO)${(M)numbers:#-*}})
    numbers=($negatives $positives)

    for number in ${(u)numbers}; do
        if [[ -n ${result[-1]} ]] && (( $number == ${${result[-1]}#*$tmp_separator} + 1 )); then
            result[-1]="${${result[-1]}%$tmp_separator*}$tmp_separator$number"
            continue
        fi

        result+=($number)
    done

    echo ${result//$tmp_separator/$separator}
}
