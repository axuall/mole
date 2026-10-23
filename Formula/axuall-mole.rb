class AxuallMole < Formula
  desc "SSH port forwarder for dev workflows"
  homepage "https://github.com/axuall/mole"
  license "MIT"
  head "https://github.com/axuall/mole.git", branch: "main"

  depends_on "go" => :build

  def install
    # Formula name is axuall-mole, so std_go_args writes bin/axuall-mole.
    # Homebrew Core already ships an unrelated `mole` cleanup tool.
    system "go", "build", *std_go_args, "./cmd/mole"
  end

  def caveats
    <<~EOS
      The command is `axuall-mole`. Homebrew Core already uses `mole`
      for an unrelated macOS cleanup tool.

      To use mole's documented commands, add this to your shell config:
        alias mole=axuall-mole
    EOS
  end

  test do
    assert_match "mole v", shell_output("#{bin}/axuall-mole version")
  end
end
