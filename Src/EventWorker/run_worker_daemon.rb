require 'rubygems'
require 'daemons'

pdw = File.dirname(File.expand_path(__FILE__))
file = pwd + '/worker.rb'

Deamons.run_proc(
         'TellWorker',
        :log_output => true
    ) do
  exec "ruby #{file}"
end
