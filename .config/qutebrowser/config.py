# imports

# Change the argument to True to still load settings configured via autoconfig.yml
from os.path import expanduser


config.load_autoconfig(False)

# productivity
c.content.autoplay = False
c.colors.webpage.darkmode.enabled = True
c.scrolling.smooth = True
c.search.ignore_case = "always"
c.downloads.location.directory = expanduser("~/Downloads")
c.auto_save.session = False
c.tabs.mousewheel_switching = False
c.tabs.mode_on_change = "persist"
c.downloads.remove_finished = 10
c.content.mute = True

mySearchEngine = "https://duckduckgo.com"  # --> change this :)
searchQuery = mySearchEngine + "/?q={}"

## search engine list
c.url.searchengines = {
    "DEFAULT": searchQuery,
    "yt": "https://piped.kavin.rocks/results?search_query={}",
    "aw": "https://wiki.archlinux.org/title/{}",
}

# aesthetics
c.window.hide_decoration = False
c.statusbar.show = "never"
c.fonts.default_family = "VictorMono Nerd Font Mono"
c.content.user_stylesheets = expanduser(
    "~/.config/qutebrowser/stylesheets/stylesheet.css"
)

## startup page
startpage = "file://" + expanduser("~/.config/qutebrowser/index.html")
c.url.start_pages = [startpage]
c.url.default_page = mySearchEngine

# privacy
c.content.webrtc_ip_handling_policy = "disable-non-proxied-udp"
c.content.webgl = True
c.content.javascript.enabled = True
c.content.headers.referer = "never"
c.content.images = False
c.content.geolocation = False
c.qt.chromium.sandboxing = "enable-all"
c.content.cookies.accept = "no-unknown-3rdparty"
c.content.canvas_reading = False
c.content.javascript.clipboard = "access"
# c.content.javascript.can_access_clipboard = True
c.content.headers.custom = {
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8"
}
c.content.headers.user_agent = (
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0"
)
c.content.headers.accept_language = "en-US,en;q=0.5"
c.content.headers.do_not_track = True
c.content.private_browsing = False

## Proxy
# c.content.proxy = "http://localhost:8118/"

# adblock
c.content.blocking.method = "both"
c.content.blocking.enabled = True
c.content.blocking.hosts.lists = [
    "https://easylist-downloads.adblockplus.org/liste_ar.txt",
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts",
    "https://big.oisd.nl/",
    "https://nsfw.oisd.nl/",
]

# Fixes
c.content.site_specific_quirks.enabled = True

# performance
c.content.default_encoding = "utf-8"
c.content.dns_prefetch = True
c.content.cache.appcache = True
c.content.cache.size = int(((1024**3) * 0.5))
c.content.notifications.enabled = False
c.scrolling.smooth = True
c.content.prefers_reduced_motion = True
c.completion.timestamp_format = ""
# c.completion.web_history.max_items

# Bindings for normal mode
config.bind("M", "hint links spawn mpv {hint-url}")
config.bind("Z", "hint links spawn st -e youtube-dl {hint-url}")
config.bind("t", "set-cmd-text -s :open -t")
config.bind("xt", "config-cycle tabs.show always never")
