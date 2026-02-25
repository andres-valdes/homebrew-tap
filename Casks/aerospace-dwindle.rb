cask "aerospace-dwindle" do
  version "0.1.1"
  sha256 "38fcd59b5726cae365ce7a89ec531cbea033476b03a982916e7bb22df91dd966"

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
