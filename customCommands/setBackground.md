https://github.com/PRATAP-KUMAR/ubuntu-gdm-set-background

there are four options

background with image
background with color
background with gradient horizontal ( requires two valid hex color inputs)
background with gradient vertical ( requires two valid hex color inputs)
tip: be ready with valid hex color code in place of below example like #aAbBcC or #dDeEfF. Change them to your preffered hex color codes. you may choose colors from https://www.color-hex.com/

Example Commands:

sudo ./ubuntu-gdm-set-background --image /home/user/backgrounds/image.jpg
sudo ./ubuntu-gdm-set-background --color \#aAbBcC
sudo ./ubuntu-gdm-set-background --gradient horizontal \#aAbBcC \#dDeEfF
sudo ./ubuntu-gdm-set-background --gradient vertical \#aAbBcC \#dDeEfF
sudo ./ubuntu-gdm-set-background --reset
./ubuntu-gdm-set-background --help
RESCUE_MODE, Example Commands:

sudo ./ubuntu-gdm-set-background --image /home/user/backgrounds/image.jpg rescue
sudo ./ubuntu-gdm-set-background --color \#aAbBcC rescue
sudo ./ubuntu-gdm-set-background --gradient horizontal \#aAbBcC \#dDeEfF rescue
sudo ./ubuntu-gdm-set-background --gradient vertical \#aAbBcC \#dDeEfF rescue
Why RESCUE_MODE? It is when you try to change the background with some other scripts and then interacted with this script, there will be some conflicts. In case you ran other scripts to change the background and then tried this script, found conflicts? then add 'rescue' to the end of the command as mentiond above.
