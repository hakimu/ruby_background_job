require 'json'
#require 'newrelic_rpm'
require 'new_relic/agent/method_tracer'
NewRelic::Agent.manual_start(:sync_startup => true)

class Background
	include ::NewRelic::Agent::Instrumentation::ControllerInstrumentation
	def greeting
		#sleep(1)
		puts "Hello"		
	end
	add_transaction_tracer :greeting, :category => :task
end

Background.new.greeting
::NewRelic::Agent.shutdown

