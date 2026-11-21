// =============================================================================
//  lib/cv.typ — layout + components for a classic, single-column CV
// -----------------------------------------------------------------------------
//  Everything visual lives here. Content lives in `sections/`, and the
//  order/selection of sections lives in `cv.typ`.
//
//  Public API
//    cv(..)          document template (use with `#show: cv.with(..)`)
//    = Heading       level-1 headings are rendered as section titles
//    entry(..)       experience / education item
//    project(..)     project item (title, link, tagline, stack, body)
//    skills(..)      label → values table
//    summary(..)     short centred profile paragraph
// =============================================================================

#let _muted = luma(105)

// --- helpers -----------------------------------------------------------------

// "https://github.com/x" → "github.com/x" (what is printed on the page)
#let _pretty-url(url) = url.replace(regex("^https?://(www\.)?"), "").trim("/", at: end)

// Accept "github.com/x" or "https://github.com/x"
#let _full-url(url) = if url.starts-with("http") or url.starts-with("mailto:") or url.starts-with("tel:") { url } else { "https://" + url }

// Apply `f` only when `x` is set.
#let _opt(f, x) = if x != none { f(x) }

#let _sep = h(0.5em) + text(fill: _muted, sym.dot.c) + h(0.5em)

// Two-column row: content left, small detail flush right.
#let _row(lhs, rhs) = grid(
  columns: (1fr, auto),
  column-gutter: 1em,
  lhs, align(right + bottom, rhs),
)

// --- document template -------------------------------------------------------

#let cv(
  name: "",
  // Small line under the name, e.g. "Neuroengineer · Software Engineer".
  tagline: none,
  // Array of contact items. Each is a string, or (text, url).
  contacts: (),
  // Turn the centred name block off entirely if you want no header at all.
  show-name: true,
  // Libertinus Serif ships with Typst, so the CV builds anywhere.
  // For a Garamond look, drop EB Garamond .ttf files in `fonts/`
  // and use ("EB Garamond", "Libertinus Serif").
  font: "Libertinus Serif",
  font-size: 10pt,
  accent: rgb("#1f2a44"),
  margin: (x: 2.1cm, top: 1.6cm, bottom: 1.6cm),
  lang: "en",
  body,
) = {
  set document(title: name + " — Curriculum Vitae", author: name)

  set page(
    paper: "a4",
    margin: margin,
    // Page numbers appear only when the CV spills onto a second page.
    footer: context {
      let total = counter(page).final().first()
      if total > 1 {
        set text(8pt, fill: _muted)
        align(center, smallcaps(name) + _sep + counter(page).display() + " / " + str(total))
      }
    },
  )

  set text(font: font, size: font-size, lang: lang, fill: luma(20), number-type: "old-style")
  set par(justify: false, leading: 0.6em, spacing: 0.85em)
  set list(marker: text(fill: accent, sym.bullet), indent: 0.2em, body-indent: 0.55em, spacing: 0.5em)

  // Section titles: small caps, letter-spaced, hairline underneath.
  show heading.where(level: 1): it => block(above: 1.25em, below: 0.6em, sticky: true, width: 100%, {
    set text(size: 1.12em, weight: "regular", tracking: 0.09em, fill: accent)
    smallcaps(it.body)
    v(-0.75em)
    line(length: 100%, stroke: 0.5pt + accent)
  })

  if show-name {
    set align(center)
    set par(justify: false)
    block(below: 0.55em, text(size: 2.1em, tracking: 0.06em, smallcaps(name)))
    if tagline != none {
      block(below: 0.6em, text(style: "italic", fill: _muted, tagline))
    }
    if contacts.len() > 0 {
      block(below: 1.1em, text(size: 0.88em, contacts
        .map(c => if type(c) == array { link(_full-url(c.at(1)), c.at(0)) } else { c })
        .join(_sep)))
    }
  }

  body
}

// Quiet small-caps technology line: "Python · PyTorch · Docker"
#let _stack(items) = if items.len() > 0 {
  block(above: 0.5em, text(size: 0.88em, fill: _muted, tracking: 0.03em, smallcaps(items.join(_sep))))
}

// --- components --------------------------------------------------------------

// Short profile paragraph, set slightly narrower and in italics.
#let summary(body) = align(center, block(width: 88%, {
  set par(justify: false)
  set text(style: "italic")
  body
}))

// Experience / education item (optional `stack` like in `project`).
//   #entry(org: "ACME", location: "Barcelona", title: "Engineer", date: "2024 – now")[ - bullets ]
#let entry(org: none, title: none, location: none, date: none, stack: (), body) = block(
  breakable: false, width: 100%, above: 0.95em, below: 0.4em,
  {
    set par(justify: false, spacing: 0.45em)
    if org != none or location != none { _row(_opt(strong, org), location) }
    if title != none or date != none { _row(_opt(emph, title), _opt(text.with(fill: _muted), date)) }
    if body != [] {
      v(0.15em)
      body
    }
    _stack(stack)
  },
)

// Project item — the visual centre of this CV.
//   name     project name (bold)
//   url      optional link; printed without "https://", flush right
//   tagline  one-line italic description
//   stack    array of technologies, printed as a quiet small-caps line
//   date     optional, shown under the link
#let project(name, url: none, tagline: none, stack: (), date: none, body) = block(
  breakable: false, width: 100%, above: 1em, below: 0.4em,
  {
    set par(justify: false, spacing: 0.45em)
    _row(
      strong(name),
      if url != none { text(size: 0.9em, link(_full-url(url), _pretty-url(url))) },
    )
    if tagline != none or date != none { _row(_opt(emph, tagline), _opt(text.with(fill: _muted), date)) }
    if body != [] {
      v(0.15em)
      body
    }
    _stack(stack)
  },
)

// Label → values table, e.g. for skills or languages.
//   #skills(("Languages", "Python, C, TypeScript"), ("Tools", "Docker, Git"))
#let skills(..rows) = block(above: 0.9em, breakable: false, grid(
  columns: (auto, 1fr),
  column-gutter: 1.2em,
  row-gutter: 0.55em,
  ..rows.pos().map(((label, value)) => (strong(label), value)).flatten(),
))
