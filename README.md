# CORELESS FIELD / 360 — v0.6

Experimental Max/MSP/Jitter spatial composition study for a **provisional** open-bottom loudspeaker dome of 2–40 channels (default: 36, rings 1+7+10+10+8).

## Run

Place the `.maxpat` and `coreless_field.js` in one folder. Open the patch, click **RUN**, then activate `ezdac~` with the MacBook output volume LOW. The score lasts **15 minutes** of patch time, measured from RUN clock bangs; click RESET to restart. The upper dynamic source is the moving gold marker, while the interwoven five-tube field is a separate slow visual system.

**40-channel meter:** look below the sound controls for the wide `mc.meter~` object. It displays the virtual 40-channel audition signal, while the real physical outputs remain **stereo only**.

## Piece outline (minutes)

* **0–2: Ground.** 47 Hz drone with beating, circulates along floor ring.
* **2–5: Ascension.** Ascending virtual source elevation from -22° to +90°; frequency slowly rises.
* **5–7: Zenith.** Held at top, narrow movements and sustained beating.
* **7–10: Descent.** Downward spiral and falling fundamental.
* **10–12:15: Instability.** Oscillating elevation, accelerated azimuth and detuning.
* **12:15–15: Return.** Source settles to ground, slowing contour.

## Important caveats

The tubular mesh is **not** a physically solved magnetic field; Biot–Savart and vector-potential ideas are inspiration, not algorithms being evaluated by this patch. Source panning uses a normalized Gaussian function of speaker angular distance and simple stereo downmix. **It is not VBAP**, and it does not produce acoustically correct vertical localization on two MacBook speakers; the elevation is visible in 3D and on the 40 virtual channel meters. A 3D VBAP external, correct venue speaker coordinates, output mapping and calibration are needed for the eventual physical installation.

The `mc.meter~` and all `jit.gl.mesh` objects must be tested in an installed Max/Jitter environment; this version was structurally validated, not executed in Max. Before using the real loudspeaker system, verify gain and audio channel mapping.
## v0.6 visual revision
Open `coreless_field_360_v06.maxpat` alongside `coreless_field.js`. The old v04/v05 files remain untouched. Five folded, wide tube meshes overlap into a dark wire sculpture, and a long gold line passes through the field. Camera is closer. Max/Jitter runtime validation still required. Stereo audition is not true VBAP.
