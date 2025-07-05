function bin-dump
    find -s ~/Applications/ /Applications/ -type d -name "*.app" > ~/.applist

    if test -d ~/.binenv
        l1l ~/bin > ~/.binfile
    end

    if test -d ~/go/bin
        l1l ~/go/bin > ~/.gobinfile
    end

    if test -d ~/.cargo/bin
        l1l ~/.cargo/bin > ~/.cargobinfile
    end

    if test -d ~/.binenv
        l1l ~/.binenv/binaries > ~/.binenvfile
    end

    if command -q brew
        brew-deps > ~/Brewfile-deps
    end

    chezmoi add -v ~/.applist ~/.binfile ~/.gobinfile ~/.cargobinfile ~/.binenvfile ~/Brewfile*
end
