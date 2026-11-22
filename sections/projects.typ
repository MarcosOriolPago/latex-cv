#import "../lib/cv.typ": *

= Projects

#project(
  "sEMG-Controlled Prosthetic Hand",
  tagline: "Robotics Team Lead · ETHRC, 17-person team",
  date: "Sep 2026 – Feb 2027",
)[
  - Led software and model training for a prosthetic hand built from scratch.
  - Co-designed a low-cost 64-electrode sEMG array (custom amplifiers, compact PCB).
  - Chose the smallest MCU able to run the model while sampling 64 channels at 2~kHz.
  - Managed a silicone feedback armband (vibrotactile, skin-stretch, pressure) fed by the hand over BLE.
]

#project(
  "In-Ear Wearable for Sleep Fragmentation",
  tagline: "Neuroengineering - UPC",
)[
  - Designed an in-ear wearable around a low-power nRF MCU with haptics and battery.
  - Trained sleep-stage and fragmentation detection models and wrote a Zig inference runtime
    fitting in under 14~KB of RAM and 100~KB of flash.
]
