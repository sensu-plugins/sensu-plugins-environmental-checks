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
  def run
    raw = `sensors`
    sections = raw.split("\n\n")
    metrics = {}
    sections.each do |section|
      section.split("\n").drop(1).each do |line|
        begin
          key, value = line.split(':')
          key = key.downcase.gsub(/\s/, '')
          if key.start_with?('temp', 'core', 'loc', 'physical')
            current, high, critical = value.scan(/\+(\d+\.\d+)/i)
            metrics[key] = [current[0], high[0], critical[0]].map(&:to_f)
          end
        rescue
          print "malformed section from sensors: #{line}" + "\n"
        end
      end
    end
    metrics.each do |k, v|
      current, high, critical = v
      if current > critical
        @crit_temp << "#{k} has exceeded CRITICAL temperature @ #{current}°C"
      elsif current > high
        @warn_temp << "#{k} has exceeded WARNING temperature @ #{current}°C"
      end
    end

    critical usage_summary unless @crit_temp.empty?
    warning usage_summary unless @warn_temp.empty?

    ok 'All sensors are reporting safe temperature readings.'
  end
end
