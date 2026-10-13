{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 6,
      "revision": 5,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      100,
      100,
      1150,
      1020
    ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            30,
            15,
            720,
            28
          ],
          "text": "CORELESS FIELD / 360  |  v0.4  |  SOFT MESH + VISIBLE SPEAKERS + STEREO MOTION",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "note",
          "maxclass": "comment",
          "patching_rect": [
            30,
            44,
            1000,
            22
          ],
          "text": "PROVISIONAL DOME: 1 zenith + 7 upper + 10 middle + 10 horizon + 8 lower. Fixed speakers outside field.",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "run",
          "maxclass": "toggle",
          "patching_rect": [
            30,
            96,
            24,
            24
          ]
        }
      },
      {
        "box": {
          "id": "runlabel",
          "maxclass": "comment",
          "patching_rect": [
            65,
            98,
            165,
            22
          ],
          "text": "RUN visualisation",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "metro",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            136,
            90,
            22
          ],
          "text": "qmetro 50"
        }
      },
      {
        "box": {
          "id": "trigger",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            170,
            80,
            22
          ],
          "text": "t b b"
        }
      },
      {
        "box": {
          "id": "js",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            216,
            220,
            22
          ],
          "text": "js coreless_field.js"
        }
      },
      {
        "box": {
          "id": "world",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            135,
            670,
            22
          ],
          "text": "jit.world dome @size 1080 760 @floating 1 @enable 1 @fsaa 1 @erase_color 1 1 1 1"
        }
      },
      {
        "box": {
          "id": "camera",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            169,
            540,
            22
          ],
          "text": "jit.gl.camera dome @position 0 1.1 5.5 @lookat 0 0.1 0"
        }
      },
      {
        "box": {
          "id": "field",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            212,
            640,
            22
          ],
          "text": "jit.gl.mesh dome @draw_mode lines @lighting_enable 0 @blend_enable 1 @depth_enable 0 @color 0.65 0.67 0.7 0.23"
        }
      },
      {
        "box": {
          "id": "speakers",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            246,
            650,
            22
          ],
          "text": "jit.gl.mesh dome @draw_mode points @point_size 15 @lighting_enable 0 @color 0.015 0.015 0.015 1."
        }
      },
      {
        "box": {
          "id": "activity",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            280,
            650,
            22
          ],
          "text": "jit.gl.mesh dome @draw_mode lines @line_width 3 @lighting_enable 0 @color 0.07 0.07 0.07 0.96"
        }
      },
      {
        "box": {
          "id": "path",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            314,
            650,
            22
          ],
          "text": "jit.gl.mesh dome @draw_mode line_strip @line_width 4 @lighting_enable 0 @color 0.84 0.62 0.0 1."
        }
      },
      {
        "box": {
          "id": "head",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            348,
            650,
            22
          ],
          "text": "jit.gl.mesh dome @draw_mode points @point_size 14 @lighting_enable 0 @color 0.95 0.67 0.03 1."
        }
      },
      {
        "box": {
          "id": "lb",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            56,
            90,
            22
          ],
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "init",
          "maxclass": "message",
          "patching_rect": [
            131,
            57,
            125,
            22
          ],
          "text": "setcount 36"
        }
      },
      {
        "box": {
          "id": "num",
          "maxclass": "number",
          "patching_rect": [
            30,
            280,
            66,
            22
          ]
        }
      },
      {
        "box": {
          "id": "numlabel",
          "maxclass": "comment",
          "patching_rect": [
            115,
            282,
            320,
            22
          ],
          "text": "LOUDSPEAKERS  2...40 (start with 36)",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "lim",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            312,
            95,
            22
          ],
          "text": "clip 2 40"
        }
      },
      {
        "box": {
          "id": "countmsg",
          "maxclass": "message",
          "patching_rect": [
            30,
            341,
            120,
            22
          ],
          "text": "setcount $1"
        }
      },
      {
        "box": {
          "id": "speed",
          "maxclass": "flonum",
          "patching_rect": [
            30,
            398,
            73,
            22
          ]
        }
      },
      {
        "box": {
          "id": "speedlabel",
          "maxclass": "comment",
          "patching_rect": [
            116,
            400,
            160,
            22
          ],
          "text": "speed  |  0.018 default (animated)",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "speedmsg",
          "maxclass": "message",
          "patching_rect": [
            30,
            429,
            130,
            22
          ],
          "text": "setspeed $1"
        }
      },
      {
        "box": {
          "id": "width",
          "maxclass": "flonum",
          "patching_rect": [
            30,
            477,
            73,
            22
          ]
        }
      },
      {
        "box": {
          "id": "widthlabel",
          "maxclass": "comment",
          "patching_rect": [
            116,
            479,
            240,
            22
          ],
          "text": "angular panning width (0.37)",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "widthmsg",
          "maxclass": "message",
          "patching_rect": [
            30,
            507,
            135,
            22
          ],
          "text": "setwidth $1"
        }
      },
      {
        "box": {
          "id": "deform",
          "maxclass": "flonum",
          "patching_rect": [
            30,
            554,
            73,
            22
          ]
        }
      },
      {
        "box": {
          "id": "deformlabel",
          "maxclass": "comment",
          "patching_rect": [
            116,
            556,
            250,
            22
          ],
          "text": "folding  |  0.55 default",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "deformmsg",
          "maxclass": "message",
          "patching_rect": [
            30,
            584,
            142,
            22
          ],
          "text": "setdeform $1"
        }
      },
      {
        "box": {
          "id": "reset",
          "maxclass": "message",
          "patching_rect": [
            30,
            627,
            90,
            22
          ],
          "text": "reset"
        }
      },
      {
        "box": {
          "id": "diagnostics",
          "maxclass": "message",
          "patching_rect": [
            360,
            386,
            340,
            22
          ],
          "text": ""
        }
      },
      {
        "box": {
          "id": "soundlabel",
          "maxclass": "comment",
          "patching_rect": [
            360,
            444,
            750,
            22
          ],
          "text": "AUDIO: mono test signal -> 40 gain controls -> stereo PREVIEW. No physical 40-channel routing by default.",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "noise",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            480,
            90,
            22
          ],
          "text": "noise~"
        }
      },
      {
        "box": {
          "id": "dupe",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            516,
            110,
            22
          ],
          "text": "mc.dup~ 40"
        }
      },
      {
        "box": {
          "id": "amplist",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            479,
            183,
            22
          ],
          "text": "mc.list~ @chans 40"
        }
      },
      {
        "box": {
          "id": "mul",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            555,
            96,
            22
          ],
          "text": "mc.*~"
        }
      },
      {
        "box": {
          "id": "master",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            594,
            132,
            22
          ],
          "text": "mc.*~ 0.035"
        }
      },
      {
        "box": {
          "id": "mixdown",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            627,
            156,
            22
          ],
          "text": "mc.mixdown~ 2"
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "newobj",
          "patching_rect": [
            360,
            697,
            91,
            22
          ],
          "text": "ezdac~"
        }
      },
      {
        "box": {
          "id": "safety",
          "maxclass": "comment",
          "patching_rect": [
            560,
            704,
            550,
            22
          ],
          "text": "NOTE: audio is an audition of the spatial activity, NOT VBAP or calibrated room output.",
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "unpackaudio",
          "maxclass": "newobj",
          "text": "mc.unpack~ 2",
          "patching_rect": [
            360,
            661,
            150,
            22
          ]
        }
      },
      {
        "box": {
          "id": "auditionL",
          "maxclass": "newobj",
          "patching_rect": [
            480,
            800,
            190,
            24
          ],
          "text": "mc.list~ @chans 40"
        }
      },
      {
        "box": {
          "id": "auditionR",
          "maxclass": "newobj",
          "patching_rect": [
            705,
            800,
            190,
            24
          ],
          "text": "mc.list~ @chans 40"
        }
      },
      {
        "box": {
          "id": "multL",
          "maxclass": "newobj",
          "patching_rect": [
            480,
            836,
            90,
            24
          ],
          "text": "mc.*~"
        }
      },
      {
        "box": {
          "id": "multR",
          "maxclass": "newobj",
          "patching_rect": [
            705,
            836,
            90,
            24
          ],
          "text": "mc.*~"
        }
      },
      {
        "box": {
          "id": "sumL",
          "maxclass": "newobj",
          "patching_rect": [
            480,
            870,
            130,
            24
          ],
          "text": "mc.mixdown~ 1"
        }
      },
      {
        "box": {
          "id": "sumR",
          "maxclass": "newobj",
          "patching_rect": [
            705,
            870,
            130,
            24
          ],
          "text": "mc.mixdown~ 1"
        }
      },
      {
        "box": {
          "id": "masterL",
          "maxclass": "newobj",
          "patching_rect": [
            480,
            905,
            100,
            24
          ],
          "text": "*~ 0.08"
        }
      },
      {
        "box": {
          "id": "masterR",
          "maxclass": "newobj",
          "patching_rect": [
            705,
            905,
            100,
            24
          ],
          "text": "*~ 0.08"
        }
      },
      {
        "box": {
          "id": "meter40",
          "maxclass": "newobj",
          "patching_rect": [
            110,
            760,
            350,
            140
          ],
          "text": "mc.meter~",
          "numinlets": 1,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "meterlabel",
          "maxclass": "comment",
          "patching_rect": [
            110,
            730,
            550,
            20
          ],
          "text": "40-CHANNEL ACTIVITY: actual signal levels (first N active)"
        }
      },
      {
        "box": {
          "id": "stereolabel",
          "maxclass": "comment",
          "patching_rect": [
            480,
            765,
            540,
            30
          ],
          "text": "HEADPHONE / MACBOOK STEREO AUDITION: azimuth-preserving, summed L/R"
        }
      },
      {
        "box": {
          "id": "helptext",
          "maxclass": "comment",
          "patching_rect": [
            90,
            930,
            940,
            36
          ],
          "text": "1. RUN -> moving mesh.  2. Click ezdac~ -> audio.  3. Noise~ is built-in test sound.  4. No VBAP or calibrated speaker output in this version."
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "run",
            0
          ],
          "destination": [
            "metro",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "metro",
            0
          ],
          "destination": [
            "trigger",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "trigger",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "trigger",
            1
          ],
          "destination": [
            "world",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            0
          ],
          "destination": [
            "speakers",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            1
          ],
          "destination": [
            "field",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            2
          ],
          "destination": [
            "path",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            3
          ],
          "destination": [
            "head",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            4
          ],
          "destination": [
            "amplist",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            5
          ],
          "destination": [
            "diagnostics",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "js",
            6
          ],
          "destination": [
            "activity",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "num",
            0
          ],
          "destination": [
            "lim",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lim",
            0
          ],
          "destination": [
            "countmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "countmsg",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "speed",
            0
          ],
          "destination": [
            "speedmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "speedmsg",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "width",
            0
          ],
          "destination": [
            "widthmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "widthmsg",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "deform",
            0
          ],
          "destination": [
            "deformmsg",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "deformmsg",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "reset",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "lb",
            0
          ],
          "destination": [
            "init",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init",
            0
          ],
          "destination": [
            "js",
            0
          ]
        }