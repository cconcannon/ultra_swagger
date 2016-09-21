require 'rails_helper'
require_relative '../../app/helpers/strava_data_formatter'

include StravaDataFormatter

describe StravaDataFormatter do
  it "#get_avg_weekly_distance" do
    result = helper.get_avg_weekly_distance(api_return[:ytd_run_totals][:distance])
    
    expect(result).to eq(49)
  end
  
  it "#get_avg_weekly_time" do
    result = helper.get_avg_weekly_time(api_return[:ytd_run_totals][:moving_time])
    
    expect(result).to eq(7.0)
  end
  
  it "#get_avg_weekly_elevation_gain" do
    result = helper.get_avg_weekly_elevation_gain(api_return[:ytd_run_totals][:elevation_gain])
    
    expect(result).to eq(4465)
  end
  
  it "#format_to_mi" do
    result = helper.format_to_mi(50000)
    
    expect(result).to eq(31)
  end
  
  it "#format_to_hrs" do
    result = helper.format_to_hrs(360000)
    
    expect(result).to eq(100)
  end
  
  it "#format_to_ft" do
    result = helper.format_to_ft(1000)
    
    expect(result).to eq(3280)
  end
end


def api_return
  {
    "biggest_ride_distance": 31045.4,
    "biggest_climb_elevation_gain": 544.48,
    "recent_ride_totals": {
      "count": 1,
      "distance": 17463.099609375,
      "moving_time": 4207,
      "elapsed_time": 4500,
      "elevation_gain": 233.6999969482422,
      "achievement_count": 0
    },
    "recent_run_totals": {
      "count": 24,
      "distance": 426157.30029296875,
      "moving_time": 152999,
      "elapsed_time": 181964,
      "elevation_gain": 8494.645753860474,
      "achievement_count": 112
    },
    "recent_swim_totals": {
      "count": 0,
      "distance": 0,
      "moving_time": 0,
      "elapsed_time": 0,
      "elevation_gain": 0,
      "achievement_count": 0
    },
    "ytd_ride_totals": {
      "count": 26,
      "distance": 57055,
      "moving_time": 149231,
      "elapsed_time": 149914,
      "elevation_gain": 1532
    },
    "ytd_run_totals": {
      "count": 201,
      "distance": 2946318,
      "moving_time": 997910,
      "elapsed_time": 1170859,
      "elevation_gain": 50390
    },
    "ytd_swim_totals": {
      "count": 0,
      "distance": 0,
      "moving_time": 0,
      "elapsed_time": 0,
      "elevation_gain": 0
    },
    "all_ride_totals": {
      "count": 26,
      "distance": 57055,
      "moving_time": 149231,
      "elapsed_time": 149914,
      "elevation_gain": 1532
    },
    "all_run_totals": {
      "count": 599,
      "distance": 8472086,
      "moving_time": 2902024,
      "elapsed_time": 3234883,
      "elevation_gain": 104734
    },
    "all_swim_totals": {
      "count": 0,
      "distance": 0,
      "moving_time": 0,
      "elapsed_time": 0,
      "elevation_gain": 0
    }
  }
end