# imports
import os

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# productivity
c.content.autoplay = False
c.colors.webpage.darkmode.enabled = True
c.scrolling.smooth = True
c.search.ignore_case = 'always'
c.downloads.location.directory = os.path.expanduser("~/Downloads")

mySearchEngine = "https://4aeb-94-29-227-225.in.ngrok.io/" # --> change this :) 
searchQuery = mySearchEngine + "/?q={}"

## search engine list
c.url.searchengines = {
    'DEFAULT': searchQuery,
    'yt': 'https://www.youtube.com/results?search_query={}',
    'aw': 'https://wiki.archlinux.org/title/{}'
}

# aesthetics
c.statusbar.show = 'never'

## startup page
startpage = "file://" + os.path.expanduser("~/.config/qutebrowser/index.html")
c.url.start_pages = [startpage]
c.url.default_page = mySearchEngine

# privacy
c.content.webrtc_ip_handling_policy = 'disable-non-proxied-udp'
c.content.webgl = True
c.content.javascript.enabled = True
c.content.images = True
c.content.geolocation = False
c.qt.chromium.sandboxing = 'enable-all'
c.content.cookies.accept = 'no-3rdparty'

## Tor
# c.content.proxy = 'socks://localhost:9050/'

# adblock
c.content.blocking.method = 'both'
c.content.blocking.enabled = True
c.content.blocking.hosts.lists = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts"]

# performance
c.content.dns_prefetch = True

# Bindings for normal mode
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('Z', 'hint links spawn st -e youtube-dl {hint-url}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xt', 'config-cycle tabs.show always never')
