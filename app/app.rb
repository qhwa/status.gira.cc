require 'net/ping'

module Main
  class App < Sinatra::Base

    include Net

    dir = File.dirname(File.expand_path(__FILE__))

    set :public_folder, "#{dir}/frontend/public"
    set :static, true

    get '/' do
      haml :index
    end

    get '/web/primary' do
      ping_result Net::Ping::HTTP.new('http://web1.gira.cc/ping')
    end

    get '/web/secondary' do
      ping_result Net::Ping::HTTP.new('http://web2.gira.cc/ping')
    end

    get '/tunnel/primary' do
      ping_result Net::Ping::TCP.new('hz1.gira.cc', 10816)
    end

    get '/tunnel/secondary' do
      ping_result Net::Ping::TCP.new('hz3.gira.cc', 10816)
    end

    get '/shadow/primary' do
      ping_result Net::Ping::TCP.new('sg5.gira.cc', 80)
    end

    get '/shadow/secondary' do
      ping_result Net::Ping::TCP.new('hk2.gira.cc', 80)
    end

    def ping_result ping
      ping.ping? ? 'online' : 'offline'
    end

  end
end
