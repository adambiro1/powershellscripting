get-date -format d
$date = get-date -format d                  # formatting
$date = $date.ToString().Replace("/", "-")  # replace / with -
$time = get-date -format t    # only show time
$time = $time.ToString().Replace(":", "-") # replace : with -
$time = $time.ToString().Replace(" ", "")

$m = get-date
$month = $m.month  #getting month
$year = $m.year  #getting year