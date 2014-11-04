begin
  require 'pry'
rescue LoadError
  puts "WARN: couldn't load pry. `gem install pry`"

  require 'irb/completion'
  IRB.conf[:AUTO_INDENT]=true
  IRB.conf[:PROMPT_MODE]=:SIMPLE
else
  #begin
  #  require 'pry-debugger'
  #rescue LoadError
  #  puts "WARN: couldn't load pry-debugger. `gem install pry-debugger`"
  #end
  Pry.start
  exit
end
