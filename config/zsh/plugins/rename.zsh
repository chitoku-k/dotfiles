rename-illustrations() {
    local dir file updating_file updating_filename
    dir=$(pwd)

    if [[ $# != 0 ]]; then
        dir=$1
        shift
    fi

    if [[ ! -d $dir ]]; then
        echo "[ERR] The directory is not found: $dir" >&2
        return 1
    fi

    if [[ -n $@ ]]; then
        echo "[ERR] Unknown option(s): $@" >&2
        return 1
    fi

    setopt local_options null_glob extended_glob

    local -A updating_files
    local files=($dir/*.{gif,jpg,jpeg,png,webp})

    for file in ${files[@]}; do
        local filename=${file##*/}
        case $filename in
            [0-9]#_p[0-9]#.*)
                updating_files[${filename%%_*}]+=" ${filename##*_}"
                ;;
        esac
    done

    for updating_filename in ${(k)updating_files[@]}; do
        local updating_file_suffixes=(${(z)updating_files[$updating_filename]})
        local count=1
        for updating_file in $updating_file_suffixes; do
            if (( ${#updating_file_suffixes[@]} == 1 )); then
                echo "mv -- $dir/${updating_filename}_${updating_file} $dir/pixiv_${updating_filename}.${updating_file##*.}"
                mv -- $dir/${updating_filename}_${updating_file} $dir/pixiv_${updating_filename}.${updating_file##*.} > /dev/null
                continue
            fi

            echo "mv -- $dir/${updating_filename}_${updating_file} $dir/pixiv_${updating_filename} ($count).${updating_file##*.}"
            mv -- $dir/${updating_filename}_${updating_file} "$dir/pixiv_${updating_filename} ($count).${updating_file##*.}" > /dev/null
            (( count ++ ))
        done
    done
}
