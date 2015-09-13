# to start:
# bundle exec thin start -R config.ru -e $RACK_ENV -p $PORT

require File.expand_path(File.dirname(__FILE__) + '/app/boot')

map('/') { run Main::App}
