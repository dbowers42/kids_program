require 'hashie'
require './talker'

# Class that defines DSL for read stories
class Story
  include Talker

  def initialize
    self.phonetic_rules = {}
  end

  def page
    yield
  end

  def pronounce(map)
    phonetic_rules.merge!(map)
  end

  def character(map)
    name = map.keys.first
    voice = map.values.first

    define_singleton_method(name) do |message = '', &block|
      message = clean_text(block.call) unless block.nil?
      say clean_text(message), voice: voice
    end
  end

  def template(name, &block)
    define_singleton_method(name) do |**values|
      block.call(Hashie::Mash.new(values))
    end
  end

  def build(&block)
    instance_eval(&block)
  end

  protected

  attr_accessor :phonetic_rules

  def clean_text(text)
    apply_phonetic_rules(text.gsub(/\n/, ''))
  end

  def apply_phonetic_rules(text)
    transformed = text.dup
    phonetic_rules.each do |(from, to)|
      transformed.gsub!(from, to)
    end

    transformed
  end
end
