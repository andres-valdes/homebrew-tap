cask "aerospace-dwindle" do
  version "0.1.0"
  sha256 "d19ee0aba31a1826c71a37c7bef30e2c61d8c6009b3aa51710db1396a3a2a1ec"

  url "https://github.com/andres-valdes/AeroSpace/releases/download/v#{version}/AeroSpace-v#{version}.zip"
  name "AeroSpace (Dwindle Fork)"
  desc "i3-like tiling window manager for macOS with dwindle layout support"
  homepage "https://github.com/andres-valdes/AeroSpace"

  depends_on macos: ">= :ventura"

  postflight do
    system "xattr -d com.apple.quarantine #{staged_path}/AeroSpace-v#{version}/bin/aerospace"
    system "xattr -d com.apple.quarantine #{appdir}/AeroSpace.app"
  end

  app "AeroSpace-v#{version}/AeroSpace.app"
  binary "AeroSpace-v#{version}/bin/aerospace"

  binary "AeroSpace-v#{version}/shell-completion/zsh/_aerospace",
      target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_aerospace"
  binary "AeroSpace-v#{version}/shell-completion/bash/aerospace",
      target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/aerospace"
  binary "AeroSpace-v#{version}/shell-completion/fish/aerospace.fish",
      target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/aerospace.fish"
end
