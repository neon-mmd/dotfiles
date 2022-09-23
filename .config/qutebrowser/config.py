# imports
import os

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# productivity
c.content.autoplay = False
c.colors.webpage.darkmode.enabled = True
c.scrolling.smooth = True
c.search.ignore_case = "always"
c.downloads.location.directory = os.path.expanduser("~/Downloads")
c.auto_save.session = False
c.tabs.mousewheel_switching = False

mySearchEngine = "https://search.disroot.org/"  # --> change this :)
searchQuery = mySearchEngine + "/?q={}"

## search engine list
c.url.searchengines = {
    "DEFAULT": searchQuery,
    "yt": "https://www.youtube.com/results?search_query={}",
    "aw": "https://wiki.archlinux.org/title/{}",
}

# aesthetics
c.statusbar.show = "never"
c.fonts.default_family = "FiraCode Nerd Font Mono"
c.content.user_stylesheets = os.path.expanduser(
    "~/.config/qutebrowser/stylesheets/stylesheet.css"
)

## startup page
startpage = "file://" + os.path.expanduser("~/.config/qutebrowser/index.html")
c.url.start_pages = [startpage]
c.url.default_page = mySearchEngine

# privacy
c.content.webrtc_ip_handling_policy = "disable-non-proxied-udp"
c.content.webgl = True
c.content.javascript.enabled = True
c.content.images = True
c.content.geolocation = False
c.qt.chromium.sandboxing = "enable-all"
c.content.cookies.accept = "no-3rdparty"
c.content.canvas_reading = False
c.content.headers.custom = {
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
}
c.content.headers.user_agent = (
    "Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101 Firefox/100.0"
)
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.do_not_track = True
# c.content.private_browsing = True

## Tor
# c.content.proxy = 'socks://localhost:9050/'

# adblock
c.content.blocking.method = "both"
c.content.blocking.enabled = True
c.content.blocking.hosts.lists = [
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts"
]

# performance
c.content.dns_prefetch = True
c.content.notifications.enabled = False
c.scrolling.smooth = True

# Bindings for normal mode
config.bind("M", "hint links spawn mpv {hint-url}")
config.bind("Z", "hint links spawn st -e youtube-dl {hint-url}")
config.bind("t", "set-cmd-text -s :open -t")
config.bind("xt", "config-cycle tabs.show always never")
