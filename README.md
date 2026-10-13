# CORELESS FIELD / 360 — v0.4 (experimental)

Max/MSP/Jitter prototype for an incomplete spherical speaker dome. The layout is **provisional**, currently 1 + 7 + 10 + 10 + 8 = 36 loudspeakers in five rings. Speaker count is selectable from 2 to 40. Their positions stay fixed as sound moves.

## Start

1. Keep `coreless_field.js` beside `coreless_field_360_v04.maxpat`.
2. Open the Max patch and toggle **RUN**. The light-grey folded wire field should move slowly. Yellow indicates the source path. Black points are stationary speakers, activity crosses change size.
3. Click `ezdac~` to hear the internal `noise~` test signal on the MacBook's stereo outputs. Watch the 40-channel `mc.meter~` activity display. **Start with a low system output volume.**
4. Change speaker count (2–40), speed, deformation and panning width. Number changes regenerate the provisional dome.

## Design choices and limitations

* The mesh is a compact artistic parameterization of curved tubular surfaces; it is **not an MHD or magnetostatic solution**. Do not describe it as a physically simulated magnetic field.
* The fold curves and their cross-sections borrow legitimate differential-geometric language, but no Biot–Savart field is calculated.
* `mc.meter~` reflects 40-channel pre-preview signal levels; unused channels receive zero gain. Stereo preview weights the virtual speakers by x-coordinate so motion is audible on two speakers.
* Spatial preview is **not VBAP**. The actual loudspeaker spatializer, true measured ring elevations/azimuths, output mapping, room calibration and gain/safety limits must be designed before using a venue installation.
* Matrices are reused. Mesh has 3 thin tubular curves, 94 segments and 6 cross-section subdivisions. Frame update is `qmetro 50`.
* All 40 channels are calculated continuously. The routing is intended only for a stereo test until the venue output mapping is confirmed.

## Reference / algorithms

For real 3D VBAP in Max: [nwolek/vbap](https://github.com/nwolek/vbap). It requires real speaker positions, ideally specified in azimuth/elevation, and a careful 3D triangulation.

## Debug

If nothing moves, ensure RUN is on and both `.maxpat` and `.js` are in the same folder; inspect Max Console for JavaScript/Jitter errors. Turn DSP on separately for sound. Only Max itself can verify installed-package compatibility.