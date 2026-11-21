#import "../lib/cv.typ": *

= Projects

#project(
  "sEMG-Controlled Prosthetic Hand",
  tagline: "Robotics Team Lead · ETHRC, 17-person team",
  date: "Sep 2026 – Feb 2027",
)[
  - Led software and model training for a prosthetic hand built from scratch.
  - Co-designed a low-cost 64-electrode sEMG array with the electronics team (custom amplifiers, compact PCB).
  - Chose the smallest microcontroller able to run the model on-device while sampling 64 channels at 2~kHz.
  - Managed the development of a silicone sensory-feedback armband (vibrotactile, skin-stretch and pressure actuators) driven by the hand's data over BLE.
]

#project(
  "In-Ear Wearable for Sleep Fragmentation",
  tagline: "Neuroengineering - UPC",
)[
  - Designed an in-ear wearable around a low-power Nordic nRF microcontroller with haptic feedback and battery.
  - Trained sleep-stage and fragmentation detection models and wrote a Zig inference runtime
    fitting in under 14~KB of RAM and 100~KB of flash.
]
