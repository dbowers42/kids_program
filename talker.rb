module Talker
  def say(message, voice: 'tom', rate: 0)
    parts = message.split

    if rate > 0
      parts.each do |part|
        print "#{part} "
        system "say -r #{rate} -v #{voice} #{part}"
      end
    else
      system "say -v #{voice} #{message}"
    end
  end
end