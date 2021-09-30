from qutebrowser.api import interceptor

# Youtube
def filterYoutube(info: interceptor.Request):
    """Block the given request if necessary."""
    # and url.path() == "/get_video_info"

    url = info.request_url
    if "youtube.com" in url.host() and "&adformat=" in url.query():
        info.block()


interceptor.register(filterYoutube)

# Enable the ad/host blocker
# This setting supports URL patterns.
# Type: Bool
c.content.blocking.enabled = True

# Which method of blocking ads should be used.
# Valid values:
# auto    : Use Brave’s ABP-style adblocker if available, host blocking otherwise
# adblock : Use Brave’s ABP-style adblocker
# hosts   : Use hosts blocking
# both    : Use both hosts blocking and Brave’s ABP-style adblocker
# Default: auto
# Type: String
c.content.blocking.method = "both"

# List of URLs to ABP-style adblocking rulesets.
# Type: List of Url
c.content.blocking.adblock.lists = [
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://raw.githubusercontent.com/ABPindo/indonesianadblockrules/master/subscriptions/abpindo.txt",
    "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/nocoin.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/annoyances.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badlists.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/badware.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2020.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters-2021.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/filters.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/legacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/privacy.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/resource-abuse.txt",
    "https://raw.githubusercontent.com/uBlockOrigin/uAssets/master/filters/unbreak.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists//master/brave-lists/brave-firstparty-cname.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists//master/brave-lists/brave-firstparty.txt",
    "https://raw.githubusercontent.com/brave/adblock-lists//master/brave-lists/brave-social.txt",
]


# List of URLs to host blocklists for the host blocker.
# Type: List of Url
c.content.blocking.hosts.lists = []
