# Naming order of photos (PIF)

Version 0.4.3  
2020-03-28

***

## Abbreviation explanation

**PIF** (Russian: **ПИФ** [pif]) — **П**орядок **И**менования **Ф**отографий.

## Terms

**Order** (with a capital) — this document or the rules set forth in it, or both, depending on the context.

**Russian** — language represented by *ru* code in *ISO 639-1:2002*.

**English** — language represented by *en* code in *ISO 639-1:2002*.

## About this Order

The Order is officially supported in Russian and English only.

The original copy of the Order is set forth in Russian.

This copy of the Order is set forth in English.

When specifying the interpretation of the Order, the copy of the Order in Russian is priority.

The Order is originally intended for naming of digital photos, but it approves its use in other appropriate cases.

## Copyright

© A. P. Korzhyts, 2020  
© E. V. Abrazhevich, translating into English, 2020  

This Order is licensed under the *Creative Commons Attribution-ShareAlike 4.0 International* license. To view a copy of this license, visit [http://creativecommons.org/licenses/by-sa/4.0/](http://creativecommons.org/licenses/by-sa/4.0/ "Creative Commons Attribution-ShareAlike 4.0 International").

## Prerequisites

- Need for unique photo names for eliminating of threat of loss or damage of photos themselves or information about them because of the same names in the environments of digital control systems (operating, file, database…) based on the uniqueness of file names.
- Need for unified and clear naming order of individual subsets of photos for ensuring of productivity when shared using and maintaining of them.

## Direction of the solution

The solution should strive for the most possible freedom of use. This is possible if it is built on just initial technical parameters of photo creation (date and time, camera model, frame number…), but not descriptive ones (names of people, names of places or events…).

Only initial technical parameters for all in its essence are constant, clear and unambiguous in time and space. At the same time there should be a minimum of these parameters for reducing of length of photo name, but enough for its uniqueness.

## Solution

The Order is based on chronology, because it is inherent in everything, strictly linear, and therefore unambiguous and clear. But chronology is not able to ensure the uniqueness of photo name independently, therefore it is used in combination with other initial technical parameters.

The Order aims to ensure the uniqueness of photo name on a global scale for any shooting parameters, if reliable values of parameters are used for composing of photo name.

Only values of following initial technical parameters are used:

- **date** — YYYYMMDD;  
- **time** — HHMMSS in the 24-hour notation;  
- **time zone** — fHHMM or bHHMM, where *f* — forward, *b* — backward;  
- **camera model**;  
- **camera serial number**;  
- **frame designation** — simple designation, for example, original name, or composite designation, for example, composed of intracamera folder number and serial frame number;  
- **addition** — simple addition, for example, version, purpose, or composite addition, for example, composed of color space and version. Recommended only for derivative files, if necessary.
  
Only the following symbols are used:

- **a-Z** (Latin);  
- **0-9** (Arabic numerals);  
- **_** (underscore) — only for visually separating of structure parts of photo name from each other; several underscores in a row are prohibited.

This allows to make photo names uniform and with distinguishable structure for visual perception, and also enables to simplify the writing of scripts using these names.

At desire, digressions from strict adherence to the Order are permissible under user's personal responsibility.

### Sample of naming scheme

```
DATE_TIME_TIMEZONE_CAMERAMODEL_CAMERASERIALNUMBER_FRAMEDESIGNATION_ADDITION.EXTENSION
```

### Recommended metadata tags for storing name data

```
exif:datetimeoriginal    | DATE_TIME_TIMEZONE | xmp
xmp:createdate           | DATE_TIME_TIMEZONE | xmp
```
```
datetimeoriginal         | DATE_TIME          | exif
```
```
offsettimeoriginal       | TIMEZONE           | exif
```
```
model                    | CAMERAMODEL        | exif
tiff:model               | CAMERAMODEL        | xmp
xmp:creatortool          | CAMERAMODEL        | xmp
```
```
bodyserialnumber         | CAMERASERIALNUMBER | exif
exifex:bodyserialnumber  | CAMERASERIALNUMBER | xmp
```
```
crs:rawfilename          | FRAMEDESIGNATION   | xmp
xmp:nickname             | FRAMEDESIGNATION   | xmp
```
```
usercomment              | ADDITION           | exif
exif:usercomment         | ADDITION           | xmp
```
```
dc:identifier            | Photo name         | xmp
iptc4xmpext:digimageguid | Photo name         | xmp
xmp:identifier           | Photo name         | xmp
xmp:label                | Photo name         | xmp
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
----------------------------
2019-07-21T00:25:22.00+03:00
```
```
datetimeoriginal
-------------------
2019-07-21T00:25:22
```
```
offsettimeoriginal
------
+03:00
```
```
model
tiff:model
xmp:creatortool
--------------
Canon EOS 600D
```
```
bodyserialnumber
exifex:bodyserialnumber
------------
163066096284
```
```
crs:rawfilename
xmp:nickname
-------------
_IMG_9966.CR2
```
```
usercomment
exif:usercomment
---------
v2
grayscale
```
```
dc:identifier
iptc4xmpext:digimageguid
xmp:identifier
xmp:label
----------------------------------------------------------
20190721_002522_f0300_CanonEOS600D_163066096284_IMG9966_v2
```

### Naming with full compliance with the Order

```
20190721_002522_f0300_CanonEOS600D_163066096284_IMG9966.cr2
```
```
20190721_002522_f0300_CanonEOS600D_163066096284_IMG9966_v2.psd
```
```
20190721_002522_f0300_CanonEOS600D_163066096284_IMG9966_grayscale.jpg
```

### Naming with custom digressions

```
20190721_002522_IMG9966_f0300_CanonEOS600D_163066096284.cr2
```
```
20190721_002522f0300_CanonEOS600D163066096284_IMG9966.cr2
```
```
20190721_002522_IMG9966_CanonEOS600D163066096284.cr2
```
```
20190721_002522_IMG9966.cr2
```
```
20190721_002522_IMG9966_v2.jpg
```
```
20190721_002522f0300_1009966.cr2
```

## Feedback

gmail: andreikorzhyts