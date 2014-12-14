require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts 'Initializing...'
    @client = JumpstartAuth.twitter
  end

  def tweet message
    @client.update message
  end

  def run
    puts "Welcome to the JSL Twitter Client!"

    command = ""
    while command != "q"
      printf "enter command: "
      input = gets.chomp.split(" ")
      command = input[0].downcase

      case command
        when 'q' then puts "Goodbye!"
        when 't' then tweet(input[1..-1].join(' '))
        when 'dm' then dm(input[1],input[2..-1].join(" "))
        when 'help' then puts "q -- Quit, t -message -- Send Tweet, dm -user -message -- Send a direct message"
        else
          puts "Sorry, I don't know how to #{command}"

      end
    end
  end

  def dm(target, message)
    puts "Trying to send #{target} this direct message: "
    puts message
    new_msg = "d @#{target} #{message}"
    tweet(new_msg)
  end
end

blogger = MicroBlogger.new
blogger.run
