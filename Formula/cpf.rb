# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Cpf < Formula
  desc "A CLI tool to validate, format and generate Brazilian CPF numbers"
  homepage "https://github.com/diegopeixoto/go-cpf-cli"
  version "1.12.0"
  license "MIT"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/aquarela-io/go-cpf-cli/releases/download/v1.12.0/go-cpf-cli_Darwin_x86_64.zip"
      sha256 "cc585acef696a051b3d6af762c17fd11d54b4168d271e7a4717a14228da66988"

      def install
        bin.install "cpf"
      end
    end
    on_arm do
      url "https://github.com/aquarela-io/go-cpf-cli/releases/download/v1.12.0/go-cpf-cli_Darwin_arm64.zip"
      sha256 "1cf257ca8915be1870ed3add3bc6fd0e8e05d48602bd6a28cdfaa7a3d47ce18a"

      def install
        bin.install "cpf"
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/aquarela-io/go-cpf-cli/releases/download/v1.12.0/go-cpf-cli_Linux_x86_64.tar.gz"
        sha256 "9878a64e719b816834f501348c271ca8c5d294746b6f822e5cef1fbdff7d5f81"

        def install
          bin.install "cpf"
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/aquarela-io/go-cpf-cli/releases/download/v1.12.0/go-cpf-cli_Linux_arm64.tar.gz"
        sha256 "748a3b341bc27ed35cf3e182c095f01f5e0885ec4d512133da9816beec3b79a7"

        def install
          bin.install "cpf"
        end
      end
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
