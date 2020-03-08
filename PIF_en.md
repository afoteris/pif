# Naming order of photos (PIF)

Version 0.2.0^

***

## Abbreviation explanation

**PIF** (Russian: **ПИФ** [pif]) — **П**орядок **И**менования **Ф**отографий.

## Copyright

This Order is licensed under the Creative Commons Attribution-ShareAlike 4.0 International License. To view a copy of this license, visit [http://creativecommons.org/licenses/by-sa/4.0/](http://creativecommons.org/licenses/by-sa/4.0/ "Creative Commons Attribution-ShareAlike 4.0 International").

## Prerequisites

- Need for unique photo names for eliminating of threat of loss or damage of photos themselves or information about them because of the same names in the environments of control digital systems (operating, file, database…) based on the uniqueness of file names.
- Need for unified and clear naming order of individual subsets of photos for ensuring of productivity when shared using and maintaining of them.

## Direction of the solution

The solution should strive for the most possible freedom of use. This is possible if it is built on just initial technical parameters of photo creation (date and time, camera model, frame number…), but not descriptive ones (names of people, names of places or events…).

Only initial technical parameters for all in its essence are constant, clear and unambiguous in time and space. At the same time there should be a minimum of these parameters for reducing of length of photo name, but enough for its uniqueness.

## Solution

The order is based on chronology, because it is inherent in everything, strictly linear, and therefore unambiguous and clear. But chronology is not able to ensure the uniqueness of photo name independently, therefore it is used in combination with other initial technical parameters.

The order aims to ensure the uniqueness of photo name on a global scale for any shooting parameters, if reliable values of parameters are used for composing of photo name.

Only values of following initial technical parameters are used:

**date** — YYYYMMDD;  
**time** — HHMMSS in the 24-hour notation;  
**time zone** — fHHMM or bHHMM where **f** — forward, **b** — backward;  
**camera model**;  
**camera serial number**;  
**frame designation** — simple designation, for example, original name, or composite designation, for example, composed of intracamera folder number and serial frame number;  
**addition** — simple addition, for example, version, purpose, or composite addition, for example, composed of color space and version. Recommended only for derivative files, if necessary.
  
Only the following symbols are used:

**a-Z** (Latin);  
**0-9** (Arabic numerals);  
**_** (underscore) — only for visually separating of structure parts of photo name from each other; several underscores in a row are prohibited.

This allows to make photo names uniform and with distinguishable structure for visual perception, and also enables to simplify the writing of scripts using these names.

At desire, digressions from strict adherence to the order are permissible under user's personal responsibility.

### Sample of naming scheme

```
DATE_TIME_TIMEZONE_CAMERAMODEL_CAMERASERIALNUMBER_FRAMEDESIGNATION_ADDITION.EXTENSION
```

### Recommended metadata tags for storing name data

```
exif:datetimeoriginal   | DATE_TIME_TIMEZONE | xmp
xmp:createdate          | DATE_TIME_TIMEZONE | xmp
datetimeoriginal        | DATE_TIME          | exif
offsettimeoriginal      | TIMEZONE           | exif
model                   | CAMERAMODEL        | exif
tiff:model              | CAMERAMODEL        | xmp
xmp:creatortool         | CAMERAMODEL        | xmp
bodyserialnumber        | CAMERASERIALNUMBER | exif
exifex:bodyserialnumber | CAMERASERIALNUMBER | xmp
crs:rawfilename         | FRAMEDESIGNATION   | xmp
xmp:nickname            | FRAMEDESIGNATION   | xmp
usercomment             | ADDITION           | exif
exif:usercomment        | ADDITION           | xmp
dc:identifier           | Photo name         | xmp
iptc4xmpext:digimagegui | Photo name         | xmp
xmp:identifier          | Photo name         | xmp
xmp:label               | Photo name         | xmp
```

Tags belong to the following standards:

- CIPA DC-010-2017 (Exif 2.31 metadata for XMP)
- IPTC Photo Metadata Standard 2019.1
- PLUS Version 1.2.2
- XMP SPECIFICATION PART 1: DATA MODEL, SERIALIZATION, AND CORE PROPERTIES. April 2012
- XMP SPECIFICATION PART 2: ADDITIONAL PROPERTIES. August 2016

If necessary, using of other well-known tags is available, for example, for addition in name.

## Examples

### Values for the tags

```
exif:datetimeoriginal
xmp:createdate
"2019-07-21T00:25:22.00+03:00"

datetimeoriginal
"2019-07-21T00:25:22"

offsettimeoriginal
"+03:00"

model
tiff:model
xmp:creatortool
"Canon EOS 600D"

bodyserialnumber
exifex:bodyserialnumber
"163066096287"

crs:rawfilename
xmp:nickname
"_IMG_9966"

usercomment
exif:usercomment
"v2"
"grayscale"

dc:identifier
iptc4xmpext:digimagegui
xmp:identifier
xmp:label
"20190721_002522_f0300_CanonEOS600D_163066096287_IMG9966_v2"
```

### Naming with full compliance with the order

```
20190721_002522_f0300_CanonEOS600D_163066096287_IMG9966.cr2

20190721_002522_f0300_CanonEOS600D_163066096287_IMG9966_v2.psd

20190721_002522_f0300_CanonEOS600D_163066096287_IMG9966_grayscale.jpg
```

### Naming with custom digressions

```
20190721_002522_IMG9966_f0300_CanonEOS600D_163066096287.cr2

20190721_002522f0300_CanonEOS600D163066096287_IMG9966.cr2

20190721_002522_IMG9966_CanonEOS600D163066096287.cr2

20190721_002522_IMG9966.cr2

20190721_002522_IMG9966_v2.jpg

20190721_002522f0300_1009966.cr2
```

***

© A. P. Korzhyts, 2019–2020  
© E. V. Abrazhevich, translating into English, 2019–2020  
gmail: andreikorzhyts