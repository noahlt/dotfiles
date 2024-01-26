Noah's Configuration Files
--------------------------

This repo is a menagerie of my configuration files from various times in my life.  Right now it most notably contains my bash and keyboard configurations.

## Noah Dvorak

Noah Dvorak is my custom keyboard layout for macOS, which is a variant of the Dvorak layout
with customizations for special characters when holding down the ⌥ (Option) key.

### Letter keys

The letters in Noah Dvorak are the same as Dvorak, except the I, U, and K keys are rotated.
(U -> I, I -> K, and K -> U). This is based on two observations:

 1. `i` is much more frequently used in English than `u`.
 2. The `k` key's position (`v` in QWERTY) is actually ergonomically easier to reach than
    the default `i` key position (`g` in QWERTY).

I find this much more comfortable to type.

### Modifier keys

Noah Dvorak also includes alternate layouts for modifier keys:

 - `Caps Lock` is `^ Control`
 - Right `⌘ Command` is right `⌥ Option`
 - Right `⌥ Option` is right `⌘ Command`

With this layout, `⌘ Command` shortcuts are typed with the left thumb next to the `Space` bar,
and `⌥ Option` shortcuts are typed with the right thumb to the right of the `Space` bar.

### ⌥ Option character keys

Noah Dvorak also includes several alternate keys to insert special characters with the
`⌥ Option` key. I don't find the default macOS Option key shortcuts particularly useful.
All of the following descriptions are for when the `⌥ Option` key is held down:

 - Parentheses: the three inner fingers on home row produce brace characters `{([])}`.
   By default, these keys involve reaching over with your left pinky and holding shift.
   But as a programmer, they are often used. Putting them on home row is much more ergonomic.
 - Right shift: `12345',.` produce `!@#$%"<>` as if the `⇧ Shift` key is held down. This way
   you don't have to scrunch up your right hand to reach the right Shift key.
 - Math symbols: the adjacent keys `⌥k` and `⌥d` produce `∫` and `∂`. `⌥⇧A` produces `∀` and
   `⌥⇧E` produces `∃`. `⌥g` -> `∇`, `⌥j` -> `∆`, and `⌥s` -> `∑`. `⌥x` -> `×`, the
   multiplication x.
 - Greek letters: `abpl` produce `αβπλ`.
 - Apple keyboard: when holding down `⌥⇧`, `cosu` produce `⌘⌥⇧`
 - Number sets: when holding down `⌥⇧`, `rnqz` -> `ℝℕℚℤ`

## Bash configuration

 1. Custom prompt shows time, cwd, and git branch
 2. A few aliases to make things more convenient
 3. Git branch tab-completion
 4. Extra commands:
     - `killport` kills the process at the specified port
     - `clean_branches.sh` deletes local git branches that have been merged to master

## Installation

To use these configurations, run:

    $ ./install.sh

After `install.sh` finishes, you'll have to reboot, and then run:

    $ ./setup.sh

Then you'll need to open System Preferences > Language & Text and change your input source to 'Noah Dvorak'.
