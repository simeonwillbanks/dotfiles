require 'rake'
require 'erb'

desc "Install the dot files into user's home directory. If task invoked by rake install[true], all dot files will be replaced by default."
task :install, [:replace_all] do |t, args|
  args.with_defaults(:replace_all => "false")
  replace_all = args.replace_all == "true" ? true : false

  Dir['*'].each do |file|
    next if %w[Rakefile ssh].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end

  # ssh config
  # link ssh/config into ~/.ssh/config
  link_file('ssh/config')

end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def link_folder(folder)
  puts "linking ~/.#{folder}"
  system %Q{echo ln -s "$PWD/#{folder}/" "$HOME/.#{folder}"}
end
