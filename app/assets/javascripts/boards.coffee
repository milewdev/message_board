format_day_of_week = (timestamp) ->
  names = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  names[ timestamp.getDay() ]

format_time = (timestamp) ->
  hours24 = timestamp.getHours()
  minutes = timestamp.getMinutes()
  "#{format_hours(hours24)}:#{format_minutes(minutes)} #{format_am_pm(hours24)}"

format_hours = (hours24) ->
  if hours24 > 12 then hours24 - 12 else hours24

format_minutes = (minutes) ->
  if minutes > 9 then minutes else "0#{minutes}"

format_am_pm = (hours24) ->
  if hours24 > 12 then 'pm' else 'am'

format_date = (timestamp) ->
  "#{timestamp.getDate()} #{format_month(timestamp)} #{timestamp.getFullYear()}"

format_month = (timestamp) ->
  names = [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December' ]
  names[ timestamp.getMonth() ]

refresh_clock = ->
  now = new Date
  $('.clock #day-of-week').text( format_day_of_week(now) )
  $('.clock #time').text( format_time(now) )
  $('.clock #date').text( format_date(now) )

can_refresh_page = ->
  6 <= (new Date()).getHours()

refresh = ->
  if can_refresh_page()
    location.reload()
  else
    refresh_clock()

one_minute = 60 * 1000

$ ->
  refresh_clock()
  setInterval(refresh, one_minute)
