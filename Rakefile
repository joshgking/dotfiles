require 'rake'
require 'erb'

desc "install the dot files into user's home directory"
task :install do
  install_zsh
  install_oh_my_zsh
  switch_to_zsh
  install_powerline_fonts
  replace_all = false
  files = Dir['*'] - %w[Rakefile README.rdoc LICENSE oh-my-zsh install_env]
  files << "oh-my-zsh/custom/plugins/rbates"
  files << "oh-my-zsh/custom/rbates.zsh-theme"
  files.each do |file|
    system %Q{mkdir -p "$HOME/.#{File.dirname(file)}"} if file =~ /\//
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}")
        puts "identical ~/.#{file.sub(/\.erb$/, '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub(/\.erb$/, '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          abort("Rake execution cancelled")
        else
          puts "skipping ~/.#{file.sub(/\.erb$/, '')}"
        end
      end
    else
      link_file(file)
    end
  end
end

task :new_system do
  Rake::Task["install"].execute
  Rake::Task["install_vs_code"].execute
end

task :install_vs_code do
  sh "curl -L https://go.microsoft.com/fwlink/?LinkID=620882 > /tmp/vscode.zip && unzip /tmp/vscode.zip"
  sh "mv 'Visual Studio Code.app/' ~/Applications && rm /tmp/vscode.zip"
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub(/\.erb$/, '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub(/\.erb$/, '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub(/\.erb$/, '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  elsif file =~ /zshrc$/ # copy zshrc instead of link
    puts "copying ~/.#{file}"
    system %Q{cp "$PWD/#{file}" "$HOME/.#{file}"}
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def install_zsh
  if `which zsh` =~ /zsh/
    puts "found zsh"
  else
    print "install zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing zsh"
      system %Q{apt install zsh}
    when 'q'
      abort("Rake execution cancelled")
    else
      puts "skipping zsh"
    end
  end
end

def switch_to_zsh
  if (`which $SHELL` =~ /zsh/) != nil
    puts "using zsh"
  else
    print "switch to zsh? (recommended) [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "switching to zsh"
      system %Q{chsh -s `which zsh`}
    when 'q'
      abort("Rake execution cancelled")
    else
      puts "skipping zsh"
    end
  end
end

def install_oh_my_zsh
  if File.exist?(File.join(ENV['HOME'], ".oh-my-zsh"))
    puts "found ~/.oh-my-zsh"
  else
    print "install oh-my-zsh? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing oh-my-zsh"
      system %Q{git clone https://github.com/robbyrussell/oh-my-zsh.git "$HOME/.oh-my-zsh"}
    when 'q'
      abort("Rake execution cancelled")
    else
      puts "skipping oh-my-zsh, you will need to change ~/.zshrc"
    end
  end
end

def install_powerline_fonts
  if File.exist?(File.join(ENV['HOME'], "/Library/Fonts/Source Code Pro for Powerline.otf"))
    puts "found powerline fonts"
  else
    print "install powerline fonts? [ynq] "
    case $stdin.gets.chomp
    when 'y'
      puts "installing powerline fonts"
      system %Q{git clone https://github.com/powerline/fonts.git --depth=1}
      system %Q{./fonts/install.sh}
      system %Q{rm -rf fonts}
    when 'q'
      abort("Rake execution cancelled")
    end
  end
end