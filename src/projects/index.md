# Projects

## Current projects

Here are the projects I am actively working on:

| Resource                           | Short                                  |
|------------------------------------|----------------------------------------|
| [Resumania][resumania-gh]          | Typst resume template/library          |
| [Storyteller][storyteller-gh]      | Typst package to help writing stories  |
| [version-utils][version-utils-gh]  | CLI tools for version synchronization  |
| [Rollerbot][rollerbot-gh]          | A robot inspired by BB-8               |

### Resumania

Resumania is a Typst template that I wrote so that I could maintain my resume
  easier.
There are lots of other Resume templates on Typst Universe, but I wanted to have
  something more script-focused rather than just a template.
The idea behind Resumania is to basically make a modular resume and be able to
  put a set of tailored resumes together that reuse a lot of the same base
  stuff.
Plus, I wanted to learn more about Typst.

### Storyteller

Storyteller is another Typst project that I work on occasionally.
It's geared toward making a more "fool-proof" writing workflow (writing as in
  creative prose).
The idea is to set up some primitive "annotations" that authors can use to
  remind themselves of things to return to.

It also has a safeguard against compiling a "production-ready" document with
  outstanding references/unresolved marked sections (like things marked for
  rework, incomplete sections, etc.).
There's a "non-production-ready" compilation option that will instead show the
  annotations and produce a list/summary of them, as well as give
  within-document links.

### version-utils

`version-utils` is a set of developer tools that are meant to help keep
  software versions synchronized during development.
Basically, it arose out of a desire to have a scriptable way to bump versions
  across a project since there are often multiple places where a version number
  for a project is stored/referenced.

It's written in Rust, mostly because I enjoy Rust and want to get more practice
  with it.

<!------------------------------------------------------------------------------
Links

NOTE: The list is kept in alphabetical order, so add new links in the
      appropriate location!
------------------------------------------------------------------------------->
[resumania-gh]:
  https://github.com/kcmw3e/resumania
  "Resumania on GitHub"

[rollerbot-gh]:
  https://github.com/kcmw3e/rollerbot
  "Rollerbot on GitHub"

[storyteller-gh]:
  https://github.com/kcmw3e/storyteller
  "Storyteller on GitHub"

[version-utils-gh]:
  https://github.com/kcmw3e/version-utils
  "version-utils on GitHub"
