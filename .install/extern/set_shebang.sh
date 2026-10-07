function install::extern::setShebang() {
    local -a target=(
        "${targetsyml}"

        "rootfs/debian_bookworm/install.sh"
        "rootfs/debian_bookworm/rootfs.sh"

        "rootfs/debian_bulleyes/install.sh"
        "rootfs/debian_bulleyes/rootfs.sh"

        "rootfs/debian_trixie/install.sh"
        "rootfs/debian_trixie/rootfs.sh"

        "rootfs/kali_last_snapshot/install.sh"
        "rootfs/kali_last_snapshot/rootfs.sh"

        "rootfs/kali_rolling/install.sh"
        "rootfs/kali_rolling/rootfs.sh"

        "rootfs/ubuntu_latest/install.sh"
        "rootfs/ubuntu_latest/rootfs.sh"
    )

    for f in "${target[@]}"; do
        local file="${opt}/${targetins}/${f}"
        if [[ ! -f "${file}" ]]; then
            continue
        fi

        local interpreter="$(
            command awk '
                NR<=3 && /\{\{ shebang::/ {
                    sub(/.*\{\{ shebang::/, "");
                    sub(/[ }].*/, "");
                    print;
                    exit
                }
            ' "${file}")"

        if [[ -n "${interpreter}" ]]; then
            local interpreter_path="$(
                command -v "${interpreter}" 2>/dev/null || \
                    true
            )"

            if [[ -n "${interpreter_path}" ]]; then
                local shebang_display="$(command basename "${interpreter_path}")"
                local file_display="${file##${opt}/${targetins}/}"

                local tmp_file="${file}.tmp"
                install::getinstall \
                    "
                        command awk \
                            -v inter=${interpreter} \
                            -v path=${interpreter_path} \
                            '
                                NR <= 3 {
                                    gsub(\"{{ shebang::\" inter \" *}}\", \"#!\" path)
                                }
                                { print }
                            ' ${file} > ${tmp_file} && \
                                command mv ${tmp_file} ${file}
                    " \
                    "Set shebang: ${color_GG}${shebang_display}${color_DG}:${color_GG}${file_display}${color_N}"
            else
                echo "✗ $file -> $interpreter tidak ditemukan"
            fi
        fi
    done
}; readonly -f install::extern::setShebang
