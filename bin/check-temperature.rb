#! /usr/bin/env ruby
#
#   check-temperature
#
# DESCRIPTION:
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: socket
#   lm-sensors
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Jordan Beauchamp beauchjord@gmail.com
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require 'socket'

#
# Sensors
#
class CheckTemperature < Sensu::Plugin::Check::CLI
  #
  # Setup variables
  #
  def initialize
    super
    @crit_temp = []
    @warn_temp = []
  end

  #
  # Generate output
  #

  def usage_summary
    (@crit_temp + @warn_temp).join(', ')
  end

  #
  # Main function
  #
  def process_sensors(sensors)
    raw = sensors
    sections = raw.split("\n\n")
    metrics = {}
    sections.each do |section|
	    puts section
    end
  end

  def run
    sensors = `sensors`
    process_sensors(sensors)
  end
end
