touch_id=`xsetwacom list devices | grep Finger | awk '{print $9}'`
pad_id=`xsetwacom list devices | grep pad | awk '{print $9}'`
xsetwacom set $touch_id touch off
xsetwacom set $pad_id Button "1" "key tab"
xsetwacom set $pad_id Button "2" "key ctrl z"
xsetwacom set $pad_id Button "3" "key ctrl shift z"
xsetwacom set $pad_id Button "8" "key ctrl"
xsetwacom set $pad_id Button "9" "key e"
xsetwacom set $pad_id Button "10" "key shift"

