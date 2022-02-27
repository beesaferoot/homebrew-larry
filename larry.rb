require "language/go"

class Larry < Formula
  desc "Larry 🐦 is a really simple Twitter bot generator that tweets random repositories from Github built in Go"
  homepage "https://github.com/ezeoleaf/larry"
  url "https://github.com/ezeoleaf/larry/archive/refs/tags/0.4.0.tar.gz"
  sha256 "5bd34b2f1f3e124fd66a62b55e3b97d7af3c830f0c49de785b05cec50d111585"
  license "MIT"

  depends_on "go" => :build

  def install
      ENV["GOPATH"] = buildpath
      path = buildpath/"src/github.com/ezeoleaf/larry"
      path.install Dir["*"]
      cd path do
        system "go", "build", "-o", "#{bin}/larry", "./cmd/larry"
      end
  end

  test do
    assert_match /Twitter bot that publishes random information from providers/, shell_output("#{bin}/larry","-h")
  end
end
