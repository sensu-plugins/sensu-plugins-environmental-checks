## sensu-plugins-environmental-checks

[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-environmental-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-environmental-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-environmental-checks.svg)](http://badge.fury.io/rb/sensu-plugins-environmental-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-environmental-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-environmental-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-environmental-checks)

## Functionality

Plugin to collect environmental metrics (e.g. temperatures, power draw).

### metrics-temperature.rb

#### parameters

- `--scheme`: The scheme to concatenate the metrics with (default: `HOSTNAME.sensors`)

#### metrics

Multiple chips are supported and labelled by the chip name (e.g. `sensors.coretemp-isa-0000.core0`, `sensors.i350bb-pci-8100.loc1`). Depending on the chip you will get different metrics.

- `sensors.CHIPNAME.coreCORE_NUMBER`: Temperature of the core (Degree Celsius)
- `sensors.CHIPNAME.locLOCATION_NUMBER`: Temperature of the location (Degree Celsius)
- `sensors.CHIPNAME.physicalidCPU_NUMBER`: Temperature of the CPU as a whole (Degree Celsius)
- `sensors.CHIPNAME.powerNUMBER`: Power draw of the machine (Watt)

*If you do not get all of the listed values, your mainboard probably does not support the features. To check, you can query it yourself by running* `sensors` *or* `sensors -A` *respectively.*

### check-temperature.rb

#### checks

Maps *high* and *crit* values as reported by `lm-sensors` to warning and critical status respectivley.

## Usage

To collect metrics with the scheme of your choice:

```plain
metrics-temperature.rb --scheme YOUR_SCHEME_HERE
```

## Installation

```plain
sensu-install --plugin sensu-plugins-environmental-checks
``` 

In order to use this plugin you will the need [sensors](https://github.com/groeck/lm-sensors) installed. Prepackaged versions exist, e.g. the Ubuntu package is named `lm-sensors`.

For more help see [Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html).

