# Fit Window

A plugin for the [Ballest plugin manager](https://github.com/AnythingGoes-ballest/ballest-plugin-manager).

Playing in windowed mode with a border, the game remembers the size its picture had while the window was maximized,
and at the next start opens a window that size without maximizing it. With the title bar and borders that's taller
than the screen: the title bar goes above the top of the screen and the bottom hangs over the taskbar, until you
double-click the title bar.

Fit Window does that double-click for you, as soon as the window appears: the plugin manager does it at the very start,
before the game has finished loading. (The first start after installing it, it happens a few seconds in, once the
plugin has run.) Only at the start, so un-maximizing it afterwards stays that way. Fullscreen and borderless windows
are left alone.

## Settings

- **Always maximize**: maximize the window at startup even when it fits.

## Install

In the game: footer **plugins** > **browse** > Fit Window > **install**. Needs the plugin manager host 0.15.1 or newer.

## License

MIT
