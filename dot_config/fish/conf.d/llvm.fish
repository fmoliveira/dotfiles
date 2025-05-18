if command -q brew
    set -l llvm_path "$(brew --prefix)/opt/llvm"
    if test -d "$llvm_path"
        set -a PATH "$llvm_path/bin"
        set -x LLVM_CONFIG "$llvm_path/bin/llvm-config"
        set -x LLVM_ROOT "$llvm_path"
        set -x LLVM_BUILD_ROOT "$llvm_path"
        set -x DYLD_FRAMEWORK_PATH "/Applications/Xcode.app/Contents/SharedFrameworks"
    end
end
