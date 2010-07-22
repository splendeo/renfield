require 'vlad'

namespace :vlad do

  class << self
    { :red => "\e[31m",
      :green => "\e[32m",
      :yellow => "\e[33m",
      :blue => "\e[34m",
      :magenta => "\e[35m",
      :cyan => "\e[36m",
      :bold_red => "\e[1;31m",
      :bold_green => "\e[1;32m",
      :bold_yellow => "\e[1;33m",
      :bold_blue => "\e[1;34m",
      :bold_magenta => "\e[1;35m",
      :bold_cyan => "\e[1;36m"
    }.each do |color, code|

      define_method(color) do |text|
        "#{code}#{text}\e[0m"
      end
    end
  end

  def info(text)
    puts bold_green(text)
  end
  
  def warning(text)
    puts "#{bold_yellow('WARNING')}: #{text}"
  end
  
  def error(text)
    puts "#{bold_red('ERROR')}: #{text}"
  end

  def remote_rake(command)
    run "cd #{current_path}; rake RAILS_ENV='production' #{command}"
  end

  desc "changes the owner of the complete directory to the group 'rails'"
  remote_task :chown do
    info "Changing owner to ???"
  end

  desc "Touch tmp/restart.txt"
  remote_task :restart do
    info "Touching tmp/restart.txt"
    run "cd #{current_path}; touch tmp/restart.txt"
  end

  desc "Prompt the user before updating the server"
  task :confirm do
    puts bold_blue("Please confirm action in #{domain} server (yes/no):")
    answer = STDIN.gets.chomp
    if answer != 'yes'
      raise "Cancelled by user"
    end
  end

  desc "Re-creates the database and migrates"
  remote_task :clean_migrate do
    remote_rake('db:reset db:migrate')
  end

  namespace :maintenance do
    desc 'Set maintenance mode'
    remote_task :set do
      info "Seting maintenance mode"
      begin
        run "cp #{current_path}/public/maintenance.html #{current_path}/public/system/maintenance.html"
      rescue Exception => ex
        warning ex.to_s
      end
    end

    desc 'Remove maintenance mode'
    remote_task :remove do
      info "Removing maintenance mode"
      run "rm -f #{current_path}/public/system/maintenance.html"
    end
  end

end
