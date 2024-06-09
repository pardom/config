{
  home = {
    sessionVariables = {
      ANDROID_HOME = "$HOME/Library/Android/sdk";
      ANDROID_SDK_HOME = "$HOME/Library/Android/sdk";
      ANDROID_NDK = "$ANDROID_HOME/ndk/25.1.8937393";
      ANDROID_NDK_HOME = "$ANDROID_HOME/ndk/25.1.8937393";
      PATH = "$PATH:$ANDROID_HOME/platform-tools:$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/darwin-x86_64/bin/";
    };

    shellAliases = {
      emulator = "$ANDROID_HOME/emulator/emulator";
    };
  };
}
