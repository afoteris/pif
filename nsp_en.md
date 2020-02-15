# Naming system of photos

Version: 0.1.2^

---

## Reasons

In the environment of control digital systems based on the uniqueness of file names, there is a need:

1. for eliminating the possibility of appearing of photo files with the same names, because in these cases there is a threat of loss of them due to overwriting;
2. for eliminating of incompatibility of naming systems of individual subsets of photos, because in these cases the convenience and productivity of shared use and maintenance of them is reduced.

## Direction of the solution

Creating a unified naming system of photos, which completely or sufficiently eliminates the occurrence of files of the same name.

## Requirements for the solution

The solution should strive for the most possible freedom for the conditions of creation, use and maintenance of photos.

## Solution

### General provisions

- The system is based on chronology and use of values of specific metadata for naming.
- The system is not strict and is only the basis, if necessary or if desired, digressions with preservation of the essence are permissible under user's personal responsibility.
- Shooting conditions are assumed preferably within a single time zone on the Earth planet.
- Metadata values for naming are taken from original files of photos — raw files.
- All raw files must have at least sufficient for the system array of reliable original metadata.
- Software tool for realization of the system is ExifTool application by Phil Harvey.

  [https://exiftool.org](https://exiftool.org)

- It is expected that user has at least a primary level of understanding of the ExifTool and Perl-compatible regular expressions.
- Because of the diversity of composition and content of metadata by different equipment manufacturers, the ExifTool commands proposed here reflects a particular case only, and it is assumed that, perhaps, there will be a need to adapt them with preservation of their essence to personal conditions and preferences.
- There must be an intermediate folder to collect raw files before ordering and using of them:

  `STORAGE_MEDIUM\INTERMEDIATE_FOLDER\`

- The resulting structure of folders and files must be at the root of storage medium in order to more likely keep within length limit of full file name in different control digital systems; for example, the Windows provides a maximum of 260 characters for a full name.
- Only Latin, numbers and underscore are used:

  `a-Z, 0-9, _`

  This enables to make the names of folders and files uniform for easy visual perception, especially by people with poor eyesight, and also this enables to simplify the writing of personal scripts using these names.
- Names and hierarchy of folders are based on the chronology of intra-camera creation dates of raw files, because it is predisposed more than other parameters to unambiguity and clearness at the same time:

  `STORAGE_MEDIUM\YYYY\YYYYMMDD\FILES`

- Only specific and in total sufficient for relative global uniqueness metadata are used for the system:

  **20190718** — date (YYYYMMDD).\
  **032000** — time written in the 24-hour notation (HHMMSS).\
  **f0300** or **b0230** — time zone (**f** — forward, **b** — backward, f/bHHMM).\
  **CanonEOS5DMarkIV** — camera model (this can be neglected and only camera serial number can be used, probability of coincidence of which with serial numbers of other manufacturers is negligible).\
  **163066096287** — camera serial number.\
  **IMG_0024** — original name of raw file (some cameras writes number of raw file into metadata, for example, **FileNumber:100-0024** in **IMG_0024.cr2**, which also can be used as original name after replacing hyphen with underscore or removing it at all).\
  **v02** — version of the result for derivative works of raw files (**v** — version).

- Some cameras may not write the necessary metadata, in this case user must add this metadata before naming manually.

### Procedure

- Gathering of raw files in intermediate folder, preferably at it's root.
- Deleting of unnecessary raw files.
- Filing of copyright information in metadata of raw files.

  `exiftool -progress: -progress -r -EXIF:Artist="Author Name" -EXIF:Copyright="Author Name" -IPTC:By-Line="Author Name" -IPTC:CopyrightNotice="Author Name" -XMP:Creator="Author Name" -XMP:Rights="Author Name" -ext cr2 .`

- Filing of original names of raw files in their metadata.

  `exiftool -progress: -progress -r "-IPTC:ObjectName<Filename" "-XMP:PreservedFileName<Filename" "-XMP:CameraFilename<Filename" "-XMP:OriginalFileName<Filename" "-XMP:RawFileName<Filename" -ext cr2 .`

- If there is no time zone information in raw files metadata, it is added manually.

  `exiftool -progress: -progress -r -EXIF:OffsetTime="+03:00" -EXIF:OffsetTimeOriginal="+03:00" -EXIF:OffsetTimeDigitized="+03:00" -ext cr2 .`

- Distributing and with renaming of the remained raw files among structure of folders.

  `exiftool -progress: -progress -r -d "%Y/%Y%m%d/%Y%m%d_%H%M%S" "-FileName<D:\${DateTimeOriginal}_${OffsetTimeOriginal;s/\+/f/;s/-/b/;s/://}_${Model;s/ //g}_${SerialNumber}_${FileName}.%le" -ext cr2 .`

  **…D:\…** — the drive letter is set manually.

- Creating of derivative works of raw-files (psd, jpg…). Derivative works are created in the same folder as the raw files are, and also they get refined names if needed, for example, with the version added.

## Examples

### Full compliance with the system

`D:\2019\20190718\20190718_032000_f0300_CanonEOS5DMarkIV_163066096287_IMG_0024.cr2`\
`D:\2019\20190718\20190718_032000_f0300_CanonEOS5DMarkIV_163066096287_IMG_0024.psd`\
`D:\2019\20190718\20190718_032000_f0300_CanonEOS5DMarkIV_163066096287_IMG_0024_v02.psd`\
`D:\2019\20190718\20190718_032000_f0300_CanonEOS5DMarkIV_163066096287_IMG_0024.jpg`\
`D:\2019\20190718\20190718_032000_f0300_CanonEOS5DMarkIV_163066096287_IMG_0024_v02.jpg`

### Custom digressions

`D:\2019\20190718\20190718_032000_f0300_163066096287_IMG_0024.cr2`\
`D:\2019\20190718\20190718_032000_f0300_163066096287_IMG_0024_v02.jpg`\
`D:\2019\20190718_Minsk\20190718_032000_f0300_CanonEOS5DMarkIV163066096287IMG0024.cr2`\
`D:\2019\20190718_Photography_workshop\20190718032000_f0300163066096287IMG0024.cr2`\
`D:\2019\20190718\20190718_032000f0300_IMG0024.cr2`\
`D:\2019\20190718\20190718_IMG0024.cr2` (this is one of the variants having low uniqueness of the name, not recommended)

---

© Andrei Korzhyts, Elena Abrazhevich, 2019–∞\
gmail: andreikorzhyts