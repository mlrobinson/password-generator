require 'password_generator/version'
require 'securerandom'

module PasswordGenerator
  # Password Generator class
  # This is setup to allow us to specify different password requirements
  # for differnet systems
  class PassGen
    def initialize(sets = nil)
      @sets = sets
      if @sets.nil?
        # Default password set contains lower, upper, numbers, and symbols,
        # and will ensure 1 character from each class is included
        @sets = [
          'abcdefghijklmnopqrstuvwxyz',
          'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
          '0123456789',
          '!"#$%&\'()*+,-./:;<=>?@[]^_`{}~|'
        ]
      end

      @full_set = ''
    end

    def build_full_set
      @sets.each do |set|
        @full_set += set
      end

      raise ArgumentError, 'No Character Sets defined.' if @sets.empty?
    end

    def random_pos(str)
      SecureRandom.random_number(str.length)
    end

    def random_char(str)
      str[random_pos(str)]
    end

    def generate(len)
      build_full_set if @full_set.empty?
      gen = ''
      (len - @sets.length).times do
        gen = gen.insert(random_pos(gen), random_char(@full_set))
      end
      @sets.each do |set|
        gen = gen.insert(random_pos(gen), random_char(set))
      end
      gen
    end
  end
end
