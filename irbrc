begin
  require 'pry'
rescue LoadError
  puts "WARN: couldn't load pry. `gem install pry`"

  require 'irb/completion'
  IRB.conf[:AUTO_INDENT]=true
  IRB.conf[:PROMPT_MODE]=:SIMPLE
else
  Pry.start
  exit
end
