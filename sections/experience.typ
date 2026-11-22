#import "../lib/cv.typ": *

= Experience

#entry(
  org: "Institute of Neuroinformatics — ETH Zürich & University of Zürich",
  page: "neocoral-studio",
  location: "Zürich, Switzerland",
  title: "Research Student",
  date: "Sep 2026 - Feb 2027",
)[
  - Built a PyTorch-style library to train and run spiking neural networks on a custom neuromorphic chip.
  - Developed a Zynq UltraScale+ FPGA control layer handling host-chip communication.
  - Designed a standard Zynq communication framework shared by the lab's neuromorphic chips.
]

#entry(
  org: "ETH Robotics Club (ETHRC)",
  page: "semg-prosthetic-hand",
  location: "Zürich, Switzerland",
  title: "Robotics Team Lead · 17-person team",
  date: "Sep 2026 - Feb 2027",
)[
  - Led software and model training for an sEMG-controlled prosthetic hand built from scratch.
  - Co-designed a low-cost 64-electrode sEMG array (custom amplifiers, compact PCB).
  - Chose the smallest MCU able to run the model while sampling 64 channels at 2~kHz.
  - Managed a silicone feedback armband (vibrotactile, skin-stretch, pressure) fed by the hand over BLE.
]

#entry(
  org: "IDNEO Technologies",
  location: "Barcelona, Spain",
  title: "AI / ML Engineer",
  date: "Nov 2024 - Jun 2026",
)[
  - Developed AI models for automotive embedded systems, from data collection to deployment.
  - Built an in-vehicle ROS~2 + Foxglove platform integrating 10+ sensors (radar, lidar, cameras, UWB),
    with a dedicated network switch for high-throughput acquisition.
  - Used it to record the team's datasets and run every ML demo live for clients in the car.
]

#entry(
  org: "PRBB — Hospital del Mar",
  page: "fuspine",
  location: "Barcelona, Spain",
  title: "Software Engineer (Collaboration)",
  date: "Sep 2024 - Dec 2024",
)[
  - Built software for a startup using focused ultrasound (FUS) for spinal-cord stimulation.
  - Developed T1/T2 MRI tissue segmentation models isolating the spinal cord for FUS targeting.
]

#entry(
  org: "i3S — Neuroengineering & Computational Neuroscience",
  page: "snn-ripples",
  location: "Porto, Portugal",
  title: "Research Intern · B.Sc. Thesis",
  date: "Feb 2024 - Jun 2024",
)[
  - Developed spiking neuron models detecting memory-related patterns in mouse hippocampus.
  - Deployed them on Intel's Loihi 2 neuromorphic chip
    (#link("https://github.com/MarcosOriolPago/lava-snn-ripples")[code]).
]
