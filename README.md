# JSchwartz Simple Spectral Filter — Lucky Edition

A drawable stereo spectral-damage JSFX for REAPER. Its signal path is:

**stereo pre-delay → drawable FFT filter/damage → stereo post-delay**

The custom panel is unapologetically rainbow-leprechaun themed: emerald
surfaces, rainbow frequency bands and response trace, shamrocks, a lucky hat,
gold controls, and the mandatory pot of gold.

The stereo FFT workspaces are isolated on REAPER-aligned memory pages, so the
16,384- and 32,768-sample modes remain stereo and do not mute the effect.

## Drawing and automation

- Left-drag in the graph to draw the selected response; right-drag restores
  parts of it to 0 dB.
- Draw two independent shapes with the **A** and **B** buttons.
- **COPY** copies the selected shape to the other slot. **FLAT** resets only
  the selected shape.
- The drawings are saved in the REAPER project.
- **Morph A to B**, **Shift**, **Auto Sweep Depth**, and **Auto Sweep Rate**
  are standard REAPER-automatable parameters. This keeps the freehand curves
  expressive without creating hundreds of automation lanes.

Controls:

- **Low Cut**: removes spectrum below the selected frequency.
- **High Cut**: removes spectrum above the selected frequency.
- **Edge Width**: softens both filter edges in octaves.
- **Spectral Tilt**: rotates the response around 1 kHz.
- **Output**: post-filter gain.
- **FFT Size**: 1,024 to 32,768 samples. Larger settings deliberately trade
  transient precision for long, smeared spectral grains.
- **Transient Smear**: averages each bin's magnitude across FFT frames, making
  attacks bloom and decays hang behind the source.
- **Spectral Grain**: quantizes bin magnitudes in increasingly coarse dB steps.
- **Phase Scatter**: randomizes spectral phase while preserving real stereo
  output; high settings become hollow, noisy and washed out.
- **Frame Repeat**: reuses an FFT frame for up to four hops. At large FFT sizes
  this becomes an obvious spectral stutter or freeze.

Each stereo delay has independent left/right time, feedback, crossfeed
(from straight stereo to ping-pong), high-frequency damping, and wet mix.
The pre-delay's repeats are processed by the FFT filter; the post-delay echoes
the already-filtered result.

For the ReaFIR-style long-window effect, start with **FFT Size 32768** and
raise **Transient Smear**. Add **Spectral Grain** around 20–50% for a crushed,
unstable texture, then introduce **Phase Scatter** or one repeated frame for
more extreme damage.

For a moving drawn-filter effect, draw contrasting A and B curves, automate
**Morph A to B**, then add 0.5–2 octaves of **Auto Sweep Depth**. Turn up the
pre-delay when you want every repeat to be re-smeared by the spectral stage;
turn up the post-delay for clearer echoes of the damaged sound.

On macOS, run `./install.command`. Or copy
`JSchwartz/JSchwartz_Simple_Spectral_Filter.jsfx` manually to REAPER's
`Effects/JSchwartz` resource folder, then rescan JS effects or restart REAPER.

## Install and update

### ReaPack — recommended

Import this repository URL once in ReaPack:

`https://raw.githubusercontent.com/janschwartzmusic/lucky-spectral-filter/main/index.xml`

After that, ReaPack's normal synchronize/update command installs every future
version when the user wants it.

### macOS installer

Download the repository or a release, then double-click `install.command`.
After the first installation, `update.command` downloads the latest published
JSFX from GitHub and installs it directly.

Repository: https://github.com/janschwartzmusic/lucky-spectral-filter

## Collaborating

Jan and Colin share this repository directly. Keep `main` as the stable,
published plug-in; make changes on personal branches and merge them through a
pull request after testing the branch in REAPER. See
[CONTRIBUTING.md](CONTRIBUTING.md) for the exact commands and listening checks.
