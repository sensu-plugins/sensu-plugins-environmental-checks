require_relative '../../bin/check-temperature.rb'
describe CheckTemperature do
  it "should work" do
    sensors = File.read('spec/bin/sensors_intel')
    check = CheckTemperature.new
    expect(check.process_sensors(sensors)).to eq(0)
  end
end
