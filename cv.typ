// =============================================================================
//  cv.typ — entry point
//  Build:  typst compile cv.typ        (or `make`)
//  Live:   typst watch cv.typ          (or `make watch`)
// =============================================================================

#import "lib/cv.typ": *

#show: cv.with(
  name: "Marcos Oriol Pagonabarraga",
  tagline: "Neuroengineer · ML, Robotics & Neuromorphic Systems",
  contacts: (
    ("marcos.oriol.p@gmail.com", "mailto:marcos.oriol.p@gmail.com"),
    ("+34 626 027 986", "tel:+34626027986"),
    ("github.com/MarcosOriolPago", "github.com/MarcosOriolPago"),
    ("linkedin", "linkedin.com/in/marcos-oriol-pagonabarraga-a9a590143"),
    ("marcos.oriol-tech.com", "marcos.oriol-tech.com"),
  ),
  // show-name: false,          // no header at all
  accent: rgb("#7a1f2b"),    // e.g. a deep crimson instead of navy
  margin: (x: 1.6cm, top: 1.0cm, bottom: 1.0cm), // tighter than the default to keep it on one page
  font-size: 9.6pt,
)

// Reorder, add or comment out sections here.
#include "sections/summary.typ"
#include "sections/experience.typ"
#include "sections/projects.typ"
#include "sections/education.typ"
#include "sections/skills.typ"
