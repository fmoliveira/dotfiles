if command -q atuin
  atuin init fish | source
end

if command -q zoxide
  zoxide init fish | source
end

if command -q starship
  starship init fish | source
end

if command -q fnm
  fnm env | source
end

