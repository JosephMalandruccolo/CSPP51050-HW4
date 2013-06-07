# => author: Joseph Malandrucco
# => view and controller classes
# => representing a traffic light system
# => MVC architecture based on Pattern Oriented Software Architecture - Buschman pg. 129
require_relative 'model'

# => abstract super class that defines the interface for the view and controller
class Observer

	def new
		raise "Cannot instantiate abstract class 'Observer'"
	end

	def update
		raise "Abstract method 'update' must be defined in subclasses"
	end

end


# => command line view
# => when update is called, fetch and present the model data
# => based on MVC as described by Pattern Oriented Software Architecture - Bushman pg. 129
class TrafficView < Observer


	# => bind the view to a model and add itself as an observer
	def initialize model
		@model = model
		@model.attach self
	end


	# => show the model
	def update
		output = ""
		@model.lights.each_with_index do |light, index|
			output << "#{light.label}: #{light.state}"
			output << ", " unless index == @model.lights.count - 1
		end

		output << "\n"

		puts output

	end

end


# => controller
# => assembles the views and models
class TrafficController < Observer


	def initialize

		# instantiate models
		@model1 = CarSignalModel.new
		@model2 = PedestrianSignalModel.new

		# instantiate views
		@view1 = TrafficView.new @model1
		@view2 = TrafficView.new @model2

	end


	def update
		@model1.change
		@model2.change
	end


	def run

		puts "Status:\nTraffic Light 1:\n"
		@view1.update
		@view2.update

		while true

			puts "\nPress any key to change light... <enter>\n"
			gets.chomp

			puts "Status:\nTraffic Light 1:\n"
			update

		end

	end

end