require_relative 'test_base'
require 'json'
require 'net/http'

class TrafficLightsTest < TestBase

  def self.hex
    '71F44'
  end

  def setup
    dir = '/app/start_point'
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
    puts 'talking to http://runner_server:4557/'
    json = new_avatar(test_id, 'salmon')
    puts json
    #post run(red-files)
    #  assert regex -> red
    assert_equal 1, 1
  end

=begin
  test 'D04',
  'amber traffic light' do
    #post new_avatar
    #post run(amber-files)
    #  assert regex -> amber
  end

  test '2BE',
  'green traffic light' do
    #post new_avatar
    #post run(green-files)
    #  assert regex -> green
  end

  test '7D6',
  'timeout traffic light' do
    #post new_avatar
    #post run(timeout-files)
    #  assert regex -> timeout
  end
=end

  def new_avatar(kata_id, avatar_name)
    post(:new_avatar, { kata_id:kata_id, avatar_name:avatar_name })
  end

  def post(method, args)
    net_http(method, args) { |uri| Net::HTTP::Post.new(uri) }
  end

  def get(method, args)
    net_http(method, args) { |uri| Net::HTTP::Get.new(uri) }
  end

  def net_http(method, args)
    uri = URI.parse('http://runner_server:4557/' + method.to_s)
    http = Net::HTTP.new(uri.host, uri.port)
    request = yield uri.request_uri
    request.content_type = 'application/json'
    request.body = args.to_json
    response = http.request(request)
    JSON.pretty_unparse(response.body)
  end

end

