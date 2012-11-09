# Arduino Build Notifier

A Continuous Integration Server Monitor made it over an Arduino board

# Warning
At this moment this only works with Cruise Control servers

# Installation

1. Install the ruby gem

		gem install arduino_build_notifier

2. Wire your Arduino (Picks later)
	- Success led: pin 13
	- Failure led: pin 12
	- Building led: pin 11
	- Error led: pin 10
3. Plug the Arduino board to the computer
4. If you don't have your arduino ready to work with ruby, follow the [dino gem instructions](https://github.com/austinbv/dino#get-started-in-no-time)
5. run the command ard-notifier

		Usage: ard-notifier --server 'http://...' --project foo --user foo --password bar
    	-s, --server SERVER              CI server URL
    	-j, --project PROJECT            Project name
    	-u, --user USER                  CI server username
    	-p, --password PASS              CI server password
    	-t, --time [TIME]                Request frequency (secs)
    	-h, --help                       Show this message 