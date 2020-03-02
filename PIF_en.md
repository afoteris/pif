# Naming order of photos (PIF)

Version 0.1.2^

---

## Abbreviation explanation

**PIF** (Russian: **ПИФ** [pʲˈif]) — **П**орядок **И**менования **Ф**отографий.

## Prerequisites

- Need for unique photo names for eliminating of threat of loss of them when overwriting because of the same names in the environment of control digital systems (operating, file…) based on the uniqueness of file names.
- Need for unified naming system of individual subsets of photos for ensuring of productivity when shared using and maintaining of them.

## Direction of the solution

The solution should strive for the most possible freedom of use. This is possible if it is built using combination of just technical parameters of photo creation (date and time, camera model, frame number…), but not descriptive ones.

Only technical parameters for all in its essence are constant and unambiguous in time and space. At the same time there should be a minimum of these parameters for reducing of length of photo name, but enough for its uniqueness.

## Solution

- The system is based on chronology, because it is inherent in everything, strictly linear, and therefore unambiguous and clear. But chronology is not able to ensure the uniqueness of photo name independently, therefore it is used in combination with other technical parameters.
- The system is able to ensure the uniqueness of photo name on a global scale for any shooting parameters, if reliable values of technical parameters are used for composing of photo name.
- Only values of following technical parameters are used:

  **date** — YYYYMMDD;  
  **time** — HHMMSS (in the 24-hour notation);  
  **time zone** — fHHMM or bHHMM (**f** — forward, **b** — backward);  
  **camera model**;  
  **camera serial number**;  
  **original photo name** or **original photo number**;  
  **additional clarification of name** (for example, version) — added only for derived files to the end of the name, if necessary.
- Only the following characters are used:

  **a-Z** — Latin;  
  **0-9** — numbers;  
  **_** — underscore (only for visually separating of structure parts of photo name from each other).

  This allows to make folder names and photo names uniform and with distinguishable structure for visual perception, and also 
enables to simplify the writing of scripts using these names.
- The system covers both the relative photo name (name of file itself directly) and the absolute one, which includes the full path within storage medium additionally.
- If it is not possible to follow the system strictly, digressions are permissible under user's personal responsibility.

```сверить
STORAGEDEVICE:
  \YEAR
    \DATE
      \DATE_TIME_TIMEZONE_DEVICEMODEL_DEVICESERIALNUMBER_PHOTODESIGNATION_ADDITION.EXTENSION
```

```сверить
exif:datetimeoriginal   | DATE, TIME, TIMEZONE | xmp
xmp:createdate          | DATE, TIME, TIMEZONE | xmp
datetimeoriginal        | DATE, TIME           | exif
offsettimeoriginal      | TIMEZONE             | exif
model                   | DEVICEMODEL          | exif
tiff:model              | DEVICEMODEL          | xmp
xmp:creatortool         | DEVICEMODEL          | xmp
bodyserialnumber        | DEVICESERIALNUMBER   | exif
exifex:bodyserialnumber | DEVICESERIALNUMBER   | xmp
crs:rawfilename         | PHOTODESIGNATION     | xmp
xmp:nickname            | PHOTODESIGNATION     | xmp
usercomment             | ADDITION             | exif
exif:usercomment        | ADDITION             | xmp
dc:identifier           | Photo name           | xmp
iptc4xmpext:digimagegui | Photo name           | xmp
xmp:identifier          | Photo name           | xmp
xmp:label               | Photo name           | xmp
```

## Examples

### Full compliance with the system

```
D:
  \2019
    \20190718
      \20190718_032000_f0300_CanonEOS600D_163066096287_IMG0024.cr2
```

```
D:
  \2019
    \20190718
      \20190718_032000_f0300_CanonEOS600D_163066096287_IMG0024_v02.jpg
```

### Custom digressions


```
D:
  \2019
    \20190718
      \20190718_032000_163066096287_IMG0024.cr2
```

```
D:
  \2019
    \20190718
      \20190718_032000_IMG0024_v02.jpg
```

```
D:
  \2019
    \20190718_Minsk
      \20190718_032000_CanonEOS600D163066096287IMG0024.cr2
```

```
D:
  \2019
    \20190718
      \20190718_032000f0300_1020024.cr2
```

---

© Andrei Korzhyts, Elena Abrazhevich, 2019–∞  
gmail: andreikorzhyts