
require_relative './test_base'

class TrafficLightsTest < TestBase

  def self.hex
    '71F44'
  end

  def setup
    # read app/src/starting/manifest.json
    # get regex lambda
    # get files
  end

  test 'DC3',
  'red-traffic-light' do
    #post start
    #post run(red-files)
    #  assert regex -> red
  end

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
    assert_equal 1, 2
  end

  test '7D6',
  'timeout traffic light' do
    #post start
    #post run(timeout-files)
    #  assert regex -> timeout
    assert_equal 1, 1
  end

end

