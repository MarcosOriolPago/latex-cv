#import "../lib/cv.typ": *

= Projects

#project(
  "mov2semg: Synthetic Forearm sEMG Generator",
  tagline: "ETHRC",
  page: "mov2semg",
)[
  - Simulates forearm sEMG from hand motion on a MuJoCo musculoskeletal model.
  - Generates training data for prosthetic control from camera hand tracking.
]

#project(
  "In-Ear Wearable for Sleep Fragmentation",
  tagline: "Neuroengineering - UPC",
  page: "in-ear-sleep-wearable",
)[
  - Designed an in-ear wearable around a low-power nRF MCU with haptics and battery.
  - Trained sleep-stage and fragmentation detection models and wrote a Zig inference runtime
    fitting in under 14~KB of RAM and 100~KB of flash.
]
