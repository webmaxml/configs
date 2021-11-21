# ~/.config/i3/config

# ---------- variables


set $mod Mod1

set $ws1 "1. "
set $ws2 "2. "
set $ws3 "3. "
set $ws4 "4. "
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10. "


# ---------- main config

# font
font pango:DejaVu Sans Book 10

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# hide borders adjacent to the screen edges
hide_edge_borders smart

gaps inner 15
# gaps outer 15

# disable title bar
default_border pixel 1

# ---------- maps

# kill focused window
bindsym $mod+Shift+q kill

# lock screen with i3lock
bindsym $mod+shift+x exec i3lock -i /home/webmaxml/static/pictures/hacker.png

# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# Use pactl to adjust volume in PulseAudio.
set $refresh_i3status killall -SIGUSR1 i3status
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status

# A more modern dmenu replacement is rofi:
bindsym $mod+d exec rofi -show drun

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+semicolon split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# switch to workspace
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10
bindsym $mod+period workspace next         
bindsym $mod+comma workspace prev

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

bindsym $mod+p exec --no-startup-id maim --select ~/static/pm/$(date +%s).jpg


# ---------- assigning to workspaces


# assign [class="Google-chrome"] $ws1
# assign [class="VirtualBox Manager"] $ws4
# assign [class="TelegramDesktop"] $ws8
# assign [class="Rhythmbox"] $ws10


# ---------- execute commands


# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet

# display settings
exec --no-startup-id xrandr --output eDP-1 --primary --mode 1920x1080 --rate 60.00 --output HDMI-1 --mode 1920x1080 --rate 60.00 --same-as eDP-1 

# set caps as ctrl
exec --no-startup-id setxkbmap -model "pc105" -layout "us,ru" -option "ctrl:nocaps"
bindsym $mod+slash exec pkill -SIGRTMIN+11 i3blocks

# set bg image
exec_always --no-startup-id feh --bg-scale /home/webmaxml/static/pictures/city1.jpg

# execute compton for fading and opacity
exec compton --backend glx --vsync --fading --fade-delta=3

# startup applications

# ---------- panel

set $accent #40e6ff
set $text #ffffff
set $unfocused #000000
set $indicator #00ff00

# title border, title background, title text, indicator, border
client.focused $accent $accent $unfocused $indicator $accent
client.unfocused $unfocused $unfocused $text $indicator $unfocused

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)

bar {
  status_command i3blocks
	# i3bar_command i3bar --transparency
	position top
 	colors {
 		background $unfocused
 		separator $accent
 		# border background text
 		focused_workspace $unfocused $unfocused $accent
 		inactive_workspace $unfocused $unfocused $text
 		urgent_workspace #00ff00 #00ff00 #ffffff
 	}
 }



