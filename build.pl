use strict;
use warnings;

# Скопировать оригиналы ПИФ из их репозитория.
use File::Copy; copy("../vc_pif/PIF.md", "original/PIF.md");
use File::Copy; copy("../vc_pif/PIF_en.md", "original/PIF_en.md");

# Создать HTML-версию содержимого оригиналов ПИФ.
system('cmark -t html original/PIF.md > PIF_content.html');
system('cmark -t html original/PIF_en.md > PIF_content_en.html');
