# Sources for the Lato font family

- Version 3.100.dev2; Latin+Cyrillic+Greek+IPA opensource
- Created by: tyPoland Lukasz Dziedzic
- Designed by: Łukasz Dziedzic with Adam Twardoch and Botio Nikoltchev
- Creation year: 2020
- Copyright (c) 2010-2020 by tyPoland Lukasz Dziedzic with Reserved Font Name “Lato”. Licensed under the Licensed under the [SIL Open Font License, Version 1.1](./LICENSE.txt).
- Lato is a trademark of tyPoland Lukasz Dziedzic.
- Website URL: http://www.latofonts.com/

Lato is a sanserif typeface family designed in the Summer 2010 and extended in the Summer 2013 by Warsaw-based designer Lukasz Dziedzic ("Lato" means "Summer" in Polish). It tries to carefully balance some potentially conflicting priorities: it should seem quite "transparent" when used in body text but would display some original traits when used in larger sizes. The classical proportions, particularly visible in the uppercase, give the letterforms familiar harmony and elegance. At the same time, its sleek sanserif look makes evident the fact that Lato was designed in the 2010s, even though it does not follow any current trend. The semi-rounded details of the letters give Lato a feeling of warmth, while the strong structure provides stability and seriousness. In 2013-2014, the family was greatly extended (with the help of Adam Twardoch and Botio Nikoltchev) to cover 3000+ glyphs over nine weights with italics. It now supports 100+ Latin-based languages, 50+ Cyrillic-based languages as well as Greek and IPA phonetics. The Lato fonts are available free of charge under the SIL Open Font License from https://www.latofonts.com/

## Contact

To contact the Lato team, create a Github account and open a [Github issue](https://github.com/latofonts/lato-source/issues) on this repository.

## Building

1. Download or clone this repo
2. Download and install most recent [FontLab 7](https://download.fontlab.com/)
3. Install Python 3
4. Run:

```
python3 -m pip install --user --upgrade git+https://github.com/fonttools/fonttools/@feaLib-STAT#egg=fonttools[interpolatable,lxml,plot,symfont,type1,ufo,unicode,woff] git+https://github.com/googlefonts/fontmake afdko psautohint
```

5. Go to the [`tools`](tools) folder
6. Run FontLab 7
7. In FontLab 7, open the [`01_export_fontlab_lato.vfpy`](tools/01_export_fontlab_lato.vfpy) script. Wait until it exports the fonts as DesignSpace + UFO and quits
8. In Terminal, go to the [`tools`](tools) folder and run:

```
python3 03_build_lato_fontmake.py
```

## Changelog

### Version 3.100.dev2 (2020-08-16)

- The [`sources`](sources) are now [FontLab 7](https://www.fontlab.com/7) VFJ, with 2 masters (Hairline, Black) in 2 fonts (Upright, Italic)
- Added a few more `.ss05` glyphs
- Redesigned the `_i` ligatures to have a dot, and moved them to `liga`
- Added the `ss06` feature for Serbian localized glyphs
- Renamed glyphs in source to use `.glyphs`-compatible names
- Added scripted build system (see Building)
- Improved anchors for `mark` & `mkmk` (WIP)
- Added `table STAT` definition in FEA

### Version 3.002.dev1 (2019-10-14)

- Added the sources in FontLab VI VFC & VFJ format (`20-VFC-2M-designsource` folder has 2 masters, `30-VFC-3M-production` has 3 masters, needed for VF export)
- Renamed glyphs for more consistent experience
- Updated OpenType feature definitions
- Moved ligatures that involve `i` and `j` to `dlig` feature (by popular demand)
- Added accented “legible” `.ss05` forms

### Version 3.001.dev0 (2018-09-28)

- **Note: This is work in progress**
- Published the sources in FontLab Studio 5 VFB format
- Updated the design of the `Bsmall` glyph in Italic
- Updated the design of the `fourfifths` glyph
- Updated the design of the `aturned` glyph in Upright
- Updated the design of the `Ismall` glyph
- Added the glyphs `I.ss05` and `l.ss05` and the associated `ss05` “legible forms” feature

### Version 2.015 (2015-08-06)

- Initial implementation of mark positioning (should work for most glyphs)
- Autohinted using ttfautohint 1.3.

### Version 2.015 (2015-08-06)

- Initial implementation of mark positioning (should work for most glyphs)
- Autohinted using ttfautohint 1.3.

### Version 2.010 (2014-09-01)

- Improved some contour bugs and diacritics positioning.
- Improved outline quality.
- Revised OTL features so that they work in browsers (ot-sanitise).
- Autohinted using ttfautohint 1.1.
- Interpolated the Medium weight differently so it provides more visual - difference from Regular.

### Version 2.007 (2014-02-27)

- Greatly expanded character set, revised metrics, four additional weights.

### Version 1.104 (2011-11-08)

- Merged the distribution again
- Autohinted with updated ttfautohint 0.4 (which no longer causes Adobe and iOS problems) except the Hai and Lig weights which are hinted in FLS 5.1.

### Version 1.102 (2011-10-28)

- Added OpenType Layout features
- Split between desktop and web versions
- Desktop version: all weights autohinted with FontLab Studio
- Web version autohinted with ttfautohint 0.4 except the Hai and Lig weights

### Version 1.101 (2011-09-30)

- Fixed OS/2 table Unicode and codepage entries

### Version 1.100 (2011-09-12)

- Added Polish diacritics to the character set
- Weights Hai and Lig autohinted with FontLab Studio
- Other weights autohinted with ttfautohint 0.3

### Version 1.011 (2010-12-29)

- Added the soft hyphen glyph

### Version 1.010 (2010-12-13)

- Initial version released under SIL Open Font License
- Western character set
