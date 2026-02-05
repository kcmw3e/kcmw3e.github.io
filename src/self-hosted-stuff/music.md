# Music

I recently (Feb 2026) started the journey of self-hosting my music streaming.
The simple answer for why I've gone down this road is "to not pay the big
  corporations" (e.g. Spotify), but that's more just a convenient lie I've
  told myself to justify a hobby.
So in other words, I set this up so I could spend more money buying music, more
  effort managing my music library, more time and money keeping my personal
  infrastucture maintained, and limit my music library.
It's so worth it.

All jokes aside, it's actually taught me a lot, about the music industry,
  copyright, myself (in terms of what I value and what kind of music I really
  actually enjoy), networking, and containers (the software kind—i.e.
  Docker/Podman).

## Where I'm buying music

For a quick reference these are the current stores from which I buy my music:

| Website                        |
|--------------------------------|
| [Bandcamp][bandcamp]           |
| [Qobuz][qobuz]                 |
| [Juno Download][juno-download] |

## Setup

The basic setup is just [Navidrome][navidrome].
I looked around for some other open source projects and found Jellyfin, but I
  both wanted something specific to music and I saw a lot of people recommended
  Navidrome over [Jellyfin][jellyfin].
It's still early days, so I'll probably try both out before completely settling
  on one.
I do also want to check out [LMS][lms-gh], but haven't gotten around to it yet.

To access remotely, I've got [Tailscale][tailscale] set up on my PC and phone so
  I don't need to forward any ports or set up a reverse proxy.
I'm trying out [Symfonium][symfonium] based on the many recommendations I saw on
  Reddit (though it does cost $5.99 after the free trial).
I'm also looking at [Yuzic][yuzic-gh], which is FOSS.

<!------------------------------------------------------------------------------
Links

NOTE: The list is kept in alphabetical order, so add new links in the
      appropriate location!
------------------------------------------------------------------------------->
[bandcamp]:
  https://bandcamp.com/
  "Bandcamp"

[jellyfin]:
  https://jellyfin.org/
  "Jellyfin"

[juno-download]:
  https://www.junodownload.com/
  "Juno Download

[lms-gh]:
  https://github.com/epoupon/lms
  "Lightweight Media Server (LMS) on GitHub"

[navidrome]:
  https://www.navidrome.org/
  "Navidrome"

[qobuz]:
  https://www.qobuz.com/us-en/discover
  "Qobuz"

[symfonium]:
  https://www.symfonium.app/
  "Symfonium"

[tailscale]:
  https://tailscale.com/
  "Tailscale"

[yuzic-gh]:
  https://github.com/eftpmc/yuzic/
  "Yuzic on GitHub"
