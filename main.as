// Fit Window: in windowed mode with a border, the game saves the size its picture had while the window was maximized,
// and at the next start opens a window of that size, not maximized: with the title bar and borders it's taller than
// the screen's usable part, so the title bar goes above the top and the bottom over the taskbar. This maximizes it at
// startup, as double-clicking its title bar does.
//
// The host does it as the window appears, seconds before plugins run, once this plugin has asked it to
// (Host::MaximizeAtStart, kept for the next starts while the plugin is installed and on). The check here is for the
// first start after installing: in the first seconds, and only once, so un-maximizing it later is left alone.
// Fullscreen and borderless windows are never touched.

[Setting name="Always maximize" description="Maximize the window at startup even when it fits the screen"]
bool AlwaysMaximize = false;

const double WATCH_FOR = 15;          // seconds after the start the window is watched (the game may resize it late)
double started = -1;
bool done = false;

void Main()
{
    started = Host::Time();
    OnSettingsChanged();
}

void OnSettingsChanged()
{
    Host::MaximizeAtStart(AlwaysMaximize ? 2 : 1);
}

void Update(float dt)
{
    if (done || Host::Time() - started > WATCH_FOR)
        return;
    if (Host::WindowMaximized())
        return;
    if (!AlwaysMaximize && Host::WindowFitsScreen())
        return;
    done = true;
    if (Host::MaximizeWindow())
        Log::Info("the window didn't fit the screen: maximized");
    else
        Log::Warn("the window didn't fit the screen, and couldn't be maximized");
}
