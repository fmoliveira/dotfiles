if command -q brew
    set -l binutils_path "$(brew --prefix)/opt/binutils/bin"
    if test -d "$binutils_path"
        set -a PATH $binutils_path
    end
end
