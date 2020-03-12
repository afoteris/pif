use strict;
use warnings;
use File::Copy;

# Копирование оригиналов ПИФ из их репозитория.
copy("../vc_pif/PIF.md", "original/PIF.md");
copy("../vc_pif/PIF_en.md", "original/PIF_en.md");

# Создание HTML-версий содержимого оригиналов ПИФ.
system("cmark -t html original/PIF.md > assembly_parts/PIF_content.html");
system("cmark -t html original/PIF_en.md > assembly_parts/PIF_content_en.html");
