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

For streaming on my computer, instead of the built-in web page interface that
  Navidrome considers, I'm trying out [Feishin][feishin-gh].

### Server setup

I set up Navidrome using its [Docker][navidrome-docker-install] image, though I
  use [Podman][podman] to run it instead of Docker.

Since I'm on Fedora with SELinux enabled, I did have some issues that I didn't
  realize I'd encounter—mostly having to do with SELinux labels.
Basically, I just had to add a `Z` to the volume mounting options.

This is the command I used to start the container with Podman:

```sh
  podman run -d \
  --name navidrome \
  -v /path/to/music:/music:ro,Z \
  -v /path/to/data:/data:Z \
  -e ND_DATADIR=/data \
  -e ND_MUSICFOLDER=/music \
  -p 4533:4533 \
  deluan/navidrome:latest
```

Note the `,Z` for the `/music` volume.
This one tripped me up at first because I wasn't sure how to format the options
  after `:ro`.
It's just `:ro,Z`—a comma-separated list of options (documentation
  [here][podman-volume-mount-doc]).
For writable mounts, just appending `:Z` after the container mount point
  does the trick (since read-write is default).
Another random note: it seems like Podman doesn't like trailing `/` characters
  at the end of the directory paths (I had this at first and it kept failing).

I have also had issues with putting music into the `/path/to/music` directory.
Again, it seems to be related to SELinux labels.
Basically, if I just `mv` a file into `/path/to/music`, it doesn't take on the
  `container_file_t` label, but if I `cp` the file in it does.
I'm assuming (since I haven't investigated this much) that this has to do with
  how SELinux contexts are inherited—I'm guessing it's taken from the parent
  directory on file creation by default, and doesn't change when files are moved
  around.
That would at least explain what I have observed.

The setup for tailscale is pretty easy (assuming Tailscale is already installed
  on the server and client devices).
It's a one-liner to open the server up to the rest of the Tailnet:

```sh
tailscale serve 4533
```

This will run in the foreground, but to get a persistent service to run (even
  across reboots):

```sh
tailscale serve --bg --set-path /music 4533
```

There's also a cool way to set up paths instead of requiring ports using
  `--set-path`.
So for Navidrome I use

```sh
tailscale serve --bg --set-path /music 4533
```

This lets me access my Navidrome server from my phone using
  `https://server-hostname.tailnet-name.ts.net/music` instead of
  `https://server-hostname.tailnet-name.ts.net:4533`, which will be helpful for
  when I set up more self-hosted services.


<!------------------------------------------------------------------------------
Links

NOTE: The list is kept in alphabetical order, so add new links in the
      appropriate location!
------------------------------------------------------------------------------->
[bandcamp]:
  https://bandcamp.com/
  "Bandcamp"

[feishin-gh]:
  https://github.com/jeffvli/feishin
  "Feishin on GitHub"

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

[navidrome-docker-install]:
  https://www.navidrome.org/docs/installation/docker/
  "Navidrome Docker installation"

[podman]:
  https://podman.io/
  "Podman"

[podman-volume-mount-doc]:
  https://docs.podman.io/en/latest/markdown/podman-run.1.html#volume-v-source-volume-host-dir-container-dir-options
  "Podman documentation for volume mounting"

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
