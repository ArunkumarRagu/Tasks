require 'faraday'
require 'json'
require 'pdfkit'
require 'axlsx'
# $VERBOSE = nil

def get_weather_for_location(location)
  url = "https://weather-by-api-ninjas.p.rapidapi.com/v1/weather?city=#{location}"
  api_key = 'f20d8b3cedmsh4135e9a8d8406f2p1ac6b8jsnb4a18bb037e3'

  conn = Faraday.new(url: url) do |faraday|
    faraday.adapter Faraday.default_adapter
    faraday.headers["X-RapidAPI-Key"] = api_key
    faraday.headers["Accept"] = 'application/json'
  end

  response = conn.get

  if response.status == 200
    weather_data = JSON.parse(response.body)
    return weather_data
  else
    puts "Error: Unable to get weather data for #{location}."
    return nil
  end
end

def display_weather(location, weather_data,name)
  temperature = weather_data['temp']
  wind_speed = weather_data['wind_speed']
  humidity = weather_data['humidity']

  puts "Weather report for the #{name} of #{location} is: "
  puts "|Temperature: #{temperature}°C | Wind Speed: #{wind_speed} m/s | Humidity: #{humidity}%|"
 
end

user_weather_data = {}

users = [
  { id: 1, name: "Vasanthkumar", location: "Erode" },
  { id: 2, name: "Prabanjan", location: "Hosur" },
  { id: 3, name: "Rajapandi", location: "Salem" },
  { id: 3, name: "Jayabarathi", location: "Cuddalore" },
]
# Fetch weather data for each user's location and store it in the user_weather_data hash
users.each do |user|
  location = user[:location]
  weather_data = get_weather_for_location(location)
  if weather_data
    display_weather(location, weather_data,user[:name])
    user_weather_data[user[:name]] = {
      location: location,
      temperature: weather_data['temp'],
      wind_speed: weather_data['wind_speed'],
      humidity: weather_data['humidity']
    }
  end
end
# puts user_weather_data

# Create a PDF report with weather data
html_content = <<-HTML
<!DOCTYPE html>
<html>
<head>
  <title>Weather Data Report</title>
  <style>
    table {
      border-collapse: collapse;
      width: 100%;
    }

    th, td {
      border: 1px solid black;
      padding: 8px;
    }

    th {
      background-color: rgba(150, 212, 212, 0.4);
    }
    h1{
        text-align: center;
    }
    tr:nth-child(odd) {
      background-color: rgba(150, 212, 212, 0.4);
    }

  </style>
</head>
<body>
  <h1>Weather Data Report</h1>
  <table>
    <tr>
      <th>Username</th>
      <th>Location</th>
      <th>Temperature (°C)</th>
      <th>Wind Speed (m/s)</th>
      <th>Humidity (%)</th>
    </tr>
HTML

# Add weather data to the HTML table
user_weather_data.each do |username, weather_info|
  html_content += <<-HTML
    <tr>
      <td>#{username}</td>
      <td>#{weather_info[:location]}</td>
      <td>#{weather_info[:temperature]}</td>
      <td>#{weather_info[:wind_speed]}</td>
      <td>#{weather_info[:humidity]}</td>
    </tr>
  HTML
end

# Close the HTML content
html_content += <<-HTML
  </table>
</body>
</html>
HTML

pdf = PDFKit.new(html_content)

pdf_file_name = "weather_data_report.pdf"
pdf.to_file(pdf_file_name)

puts "Weather data PDF report saved to #{pdf_file_name}."

xlsx_file_name = "weather_data_report.xlsx"
Axlsx::Package.new do |p|
  p.workbook.add_worksheet(name: "Weather Data") do |sheet|
    sheet.add_row(["Username", "Location", "Temperature (°C)", "Wind Speed (m/s)", "Humidity (%)"])
    user_weather_data.each do |username, weather_info|
      sheet.add_row([username, weather_info[:location], weather_info[:temperature], weather_info[:wind_speed], weather_info[:humidity]])
    end
  end
  p.serialize(xlsx_file_name)
end

puts "Weather data Excel report saved to #{xlsx_file_name}."
