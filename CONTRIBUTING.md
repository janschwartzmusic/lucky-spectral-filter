# Working on Lucky Spectral Filter together

`main` is the stable version distributed by ReaPack and `update.command`. Do
feature work on a branch and merge it through a pull request so Jan and Colin
can test each other's changes before they become the published plug-in.

## Get ready

Clone the shared repository once:

```bash
git clone https://github.com/janschwartzmusic/lucky-spectral-filter.git
cd lucky-spectral-filter
```

Before starting new work, update `main` and create a short-lived branch:

```bash
git switch main
git pull --ff-only
git switch -c jan/short-description
```

Use `colin/short-description` for Colin's branches. Keeping names personal
makes it obvious who owns work that is still in progress.

## Edit and test

The plug-in source is:

`JSchwartz/JSchwartz_Simple_Spectral_Filter.jsfx`

On macOS, install the branch being tested with:

```bash
./install.command
```

Restart REAPER or rescan JS effects, then check:

- both input channels still reach the matching output channels;
- 16,384- and 32,768-sample FFT modes remain stereo and audible;
- existing saved projects reopen with sensible settings;
- drawing, automation, pre-delay, post-delay, and bypass still behave;
- there are no unexpected level jumps, feedback runaway, or severe CPU spikes.

If a user-facing change is ready to publish, update `@version` and
`@changelog` at the top of the JSFX. Do not add recordings, REAPER projects,
installed plug-in copies, or build artifacts to the repository.

## Share the branch

```bash
git add JSchwartz/JSchwartz_Simple_Spectral_Filter.jsfx
git commit -m "Describe the plug-in change"
git push -u origin HEAD
```

Open a pull request into `main`, describe what changed, and say how it sounded
in REAPER. The other collaborator should install and test the branch before
merging it. GitHub runs the ReaPack package check on every pull request.

After the pull request is merged, both collaborators update their copy:

```bash
git switch main
git pull --ff-only
```

The repository's publishing workflow then refreshes the ReaPack index. Users
of `update.command` receive the file currently on `main`.
