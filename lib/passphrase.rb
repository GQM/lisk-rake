module CryptiKit
  class Passphrase
    def initialize(passphrase)
      @passphrase = passphrase.to_s.strip
    end

    def self.gets
      self.new(STDIN.noecho(&:gets).chomp).to_s
    end

    def self.to_s(passphrase = nil)
      self.new(passphrase).to_s
    end

    def to_s
      @passphrase
    end
  end
end
