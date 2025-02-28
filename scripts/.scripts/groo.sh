#

function groo() {
    local filename=$1
    local base_name="${filename%.*}"
    if [[ ! -d ./binaries ]]; then
        echo "Creating directory ./binaries"
        mkdir "./binaries/"
    fi
    [[ -f "./binaries/${base_name}" ]] && rm "./binaries/${base_name}"

    gcc -g -lstdc++ -std=c++20 -pedantic "${base_name}.cpp" -o "./binaries/${base_name}" -time
}
