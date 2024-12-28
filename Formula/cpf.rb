# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Cpf < Formula
  desc "A CLI tool to validate, format and generate Brazilian CPF numbers"
  homepage "https://github.com/diegopeixoto/go-cpf-cli"
  version "1.7.0"
  license "MIT"

  depends_on "go" => :build
  depends_on :macos

  on_intel do
    url "https://github.com/diegopeixoto/go-cpf-cli/releases/download/v1.7.0/go-cpf-cli_Darwin_x86_64.zip"
    sha256 "5f0e76a0a4ab75c80126f12f11830b40e33fd453307da81198eb4934b0fe1395"

    def install
      bin.install "cpf"
    end
  end
  on_arm do
    url "https://github.com/diegopeixoto/go-cpf-cli/releases/download/v1.7.0/go-cpf-cli_Darwin_arm64.zip"
    sha256 "fb5f18e667f61da1aa3a119825c37fa8ea3d82309249631e14759a7cc8087f3c"

    def install
      bin.install "cpf"
    end
  end

  def caveats
    <<~EOS
      To use cpf, you can run commands like:
        cpf validate 123.456.789-09
        cpf generate --count=5
        cpf format 12345678909
    EOS
  end

  test do
    system "#{bin}/cpf", "--version"
    output = shell_output("#{bin}/cpf generate --count=1")
    assert_match(/\d{3}\.\d{3}\.\d{3}-\d{2}/, output)
  end
end
