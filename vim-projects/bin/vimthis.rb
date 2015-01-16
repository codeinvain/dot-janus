#!/usr/bin/env ruby

require 'io/console'
require 'fileutils'
template_name=ARGV[0]
path = File.symlink?(__FILE__) ? File.readlink(__FILE__) : __FILE__
path  = File.dirname(path)

if (template_name=='--list' || template_name.nil?)

  list_dir =File.join(File.absolute_path(path),'..',"templates")
  puts "Available Templates:"
  puts Dir.entries(list_dir).select {|entry| File.directory? File.join(list_dir,entry) and !(entry =='.' || entry == '..') }
  exit
end

def copy_from_template(source,dest)
  backup_timestamp = Time.now.getutc.to_s.gsub(/[^\d]/,'')
  if File.exists?(dest)
    FileUtils.cp(dest, "#{dest}.#{backup_timestamp}.bak")
  end
  FileUtils.cp(source,dest)
end

template_dir =File.join(File.absolute_path(path),'..',"templates",template_name)
puts template_dir
has_template = Dir.exist?(template_dir)

if (!has_template)
  puts "Template [#{template_name}] does not exist"
else
  current_dir = Dir.pwd
  Dir.entries(template_dir).each do |entry| 
    if File.file?(File.join(template_dir,entry))
      if File.exist?(File.join(current_dir,entry))
        puts "#{entry} already exists overwrite y(es) n(o) q(uit)? "
        while(input = STDIN.getch)
          input.downcase! 
          if ('ynq'.include?(input))
            case input
            when 'q'
              exit
            when 'y'
              copy_from_template(File.join(template_dir,entry),File.join(current_dir,entry))
            end
            break
          end
        end
      else
        copy_from_template(File.join(template_dir,entry),File.join(current_dir,entry))
      end
    end
  end 

  puts "#{template_name} Template Project Initialized"
end
