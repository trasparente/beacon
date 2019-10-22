$("[datetime]").each ->
  diff = new Date().getTime() - new Date($(@).attr("datetime")*1000)
  minute = 1000 * 60
  hour = minute * 60
  day = hour * 24
  week = day * 7
  month = day * 30
  year = month * 12
  decimals = $(@).data("decimals") || 0
  if diff > 0
    if diff < hour
      moment = "#{(diff / minute).toFixed decimals} minutes ago"
    else if diff < day
      moment = "#{(diff / hour).toFixed decimals} hours ago"
    else if diff < week
      moment = "#{(diff / day).toFixed decimals} days ago"
    else if diff < month
      moment = "#{(diff / week).toFixed decimals} weeks ago"
    else if diff < year
      moment = "#{(diff / month).toFixed decimals} months ago"
    else moment = "#{(diff / year).toFixed decimals} years ago"
  else
    if -diff < hour
      moment = "in #{(-diff / minute).toFixed decimals} minutes"
    else if -diff < day
      moment = "in #{(-diff / hour).toFixed decimals} hours"
    else if -diff < week
      moment = "in #{(-diff / day).toFixed decimals} day"
    else if -diff < month
      moment = "in #{(-diff / week).toFixed decimals} weeks"
    else if -diff < year
      moment = "in #{(-diff / month).toFixed decimals} months"
    else moment = "in #{(-diff / year).toFixed decimals} years"
  if $(@).data "embed"
    $(@).append " (#{moment})"
  else
    $(@).attr "title", moment