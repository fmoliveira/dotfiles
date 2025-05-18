set -x ANDROID_HOME $HOME/Library/Android/sdk

if test -d "$ANDROID_HOME"
    if test -d "$ANDROID_HOME/build-tools/"
        set -l build_tools_version $(find $ANDROID_HOME/build-tools -type d -d 1 | sed 's|^.*/||' | sort -r | head -n 1)
        ln -snf $ANDROID_HOME/build-tools/$build_tools_version $ANDROID_HOME/build-tools/latest
        set -a PATH $ANDROID_HOME/build-tools/latest
    end

    if test -d "$ANDROID_HOME/cmdline-tools/"
        set -a PATH $ANDROID_HOME/cmdline-tools/latest/bin
    end

    if test -d "$ANDROID_HOME/platform-tools/"
        set -a PATH $ANDROID_HOME/platform-tools
    end
end
