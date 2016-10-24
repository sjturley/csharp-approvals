
require_relative './test_base'
require 'json'

class TrafficLightsTest < TestBase

  def self.hex
    '71F44'
  end

  def setup
    dir = '/app/starting'
    manifest = JSON.parse(IO.read("#{dir}/manifest.json"))
    filenames = manifest['visible_filenames']
    @files = Hash[filenames.collect { |filename|
      [filename, IO.read("#{dir}/#{filename}")]
    }]
    @red_amber_green = manifest['red_amber_green']
  end

  attr_reader :files, :red_amber_green

  test 'DC3',
  'red-traffic-light' do
    #post start
    #post run(red-files)
    #  assert regex -> red
    assert_equal 1, 1
  end

=begin
  test 'D04',
  'amber traffic light' do
    #post start
    #post run(amber-files)
    #  assert regex -> amber
  end

  test '2BE',
  'green traffic light' do
    #post start
    #post run(green-files)
    #  assert regex -> green
  end

  test '7D6',
  'timeout traffic light' do
    #post start
    #post run(timeout-files)
    #  assert regex -> timeout
  end
=end

end

