require 'password_generator/version'
require 'securerandom'

# Built-in String class, monkey patch for insert_random
class String
  def insert_random(set)
    random_char = SecureRandom.random_number(set.length)
    random_pos = SecureRandom.random_number(length)
    self[0..random_pos] + set[random_char] + self[random_pos + 1..length]
  end

  def insert_random!(set)
    replace insert_random(set)
  end
end

module PasswordGenerator
  # Password Generator class
  # This is setup to allow us to specify different password requirements for differnet systems
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

      raise 'You must enter at least one character set!' if @sets.empty?
    end

    def generate(len)
      build_full_set if @full_set.empty?
      generated = ''
      (len - @sets.length).times do
        generated += @full_set[SecureRandom.random_number(@full_set.length)]
      end
      @sets.each do |set|
        generated.insert_random!(set)
      end
      generated
    end
  end
end
