# => author: Joseph Malandrucco
# => model class
# => representing a traffic light system
# => MVC architecture based on Pattern Oriented Software Architecture - Buschman pg. 129


# => abstract class that represents a traffic signal
class TrafficSignalModel

	attr_reader :lights # => array of lights used to control traffic

	def new
		raise "Cannot instantiate abstract class 'TrafficLightModel'"
	end


	def initialize
		@observers = []
	end


	# => traffic lights change according to the logic defined in this method
	def change
		raise "Must define abstract method 'change' in subclass"
	end


	# => attach an observer to the model
	def attach observer
		@observers << observer
	end


	# => notify each observer attached to the model
	def notify
		@observers.each do |o|
			o.update
		end
	end

end



# => model that represents an automobile traffic signal
class CarSignalModel < TrafficSignalModel


	def initialize
		super

		@red_light = Light.new "red", "ON", "Red"
		@yellow_light = Light.new "yellow", "OFF", "Yellow"
		@green_light = Light.new "green", "OFF", "Green"

		@lights = []
		@lights << @red_light
		@lights << @yellow_light
		@lights << @green_light

	end


	# => auto traffic lights rotate according to the following logic
	def change

		temp_state = @green_light.state
		@green_light.state = @red_light.state
		@red_light.state = @yellow_light.state
		@yellow_light.state = temp_state

		notify

	end

end



# => model that represents a pedestrian traffic signal
class PedestrianSignalModel < TrafficSignalModel


	def initialize
		super

		@walk_light = Light.new "white", "OFF", "Walk"
		@dont_walk_light = Light.new "orange", "ON", "Don't Walk"

		@lights = []
		@lights << @walk_light
		@lights << @dont_walk_light

	end


	def change

		if @dont_walk_light.state.eql? "ON"

			@dont_walk_light.state = "OFF"
			@walk_light.state = "ON"

		elsif @dont_walk_light.state.eql? "FLASHING"

			@dont_walk_light.state = "ON"
			@walk_light.state = "OFF"

		else
			@dont_walk_light.state = "FLASHING"
			@walk_light.state = "OFF"
		end

		notify

	end

end



# => class that represents a light
# => lights have a color and a state
# => valid states are defined in Light::STATES
class Light

	attr_reader :color, :state, :label
	attr_accessor :color, :state, :label

	# => the valid states that a light may be in
	STATES = ["ON", "OFF", "FLASHING"]

	def initialize color, state, label

		raise "#{state} is an illegal state" unless STATES.include? state
		@color = color
		@state = state
		@label = label

	end

end