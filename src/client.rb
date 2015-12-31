Dir[File.join(File.dirname(__FILE__), '**', '*.rb')].each { |f| require f unless f == __FILE__ }
require 'bundler'

Bundler.setup
Bundler.require

class Client
  attr_reader :base_url, :last_response, :raw_response

  def initialize base_url = 'http://vindinium.org/api', bot_type = 'BaseBot'
    @base_url = base_url
    @bot_type = Object.const_get bot_type
  end

  def start args = { mode: 'training', key: ENV['VINDINIUM_KEY'], turns: 300 }
    @args = args
    @bot = @bot_type.new
    send "start_#{args[:mode]}"
  end

  def run url, params
    @raw_response = get_raw url, params
    unless @raw_response.match /is finished/
      @last_response = Hashie::Mash.new JSON.parse(@raw_response)
      @bot.update @last_response
    end
    self
  rescue
    raise "Parse error. Raw: #{@raw_response}"
  end

  def play
    while !@last_response.finished && @raw_response != 'Vindinium - The game is finished'
      run @last_response.playUrl, { key: @args[:key], dir: @bot.move }
    end
    self
  end

  private

  def start_training
    params = {
      key: @args[:key],
      turns: @args[:turns],
      map: @args[:map]
    }.reject { |k, v| v.nil? }

    url = @base_url + '/training'
    run url, params
  end

  def start_arena
    params = {
      key: @args[:key],
      games: @args[:games],
    }.reject { |k, v| v.nil? }

    url = @base_url + '/arena'
    run url, params
  end

  def start_
    raise "args[:mode] should be training or arena, but you passed in: #{@args[:mode].inspect}"
  end

  def get_raw url, params
    HTTParty.post(url,
                  :headers => { 'Content-Type' => 'application/json' },
                  :body => params.to_json,
                 ).body
  rescue
    raise "error with HTTParty.post(url, :body => #{params}.to_json}).body"
  end
end
