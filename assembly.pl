use strict;
use warnings;
use utf8;
use open qw(:std :utf8);


print "----\n";
print "Perl $]\n";
print "$0\n";
print "----\n";
print "Assembly started!\n";


# Создание HTML-версий содержимого оригиналов ПИФ.

system("cmark -t html pif/PIF.md > assembly_parts/PIF_content.html");
system("cmark -t html pif/PIF_en.md > assembly_parts/PIF_content_en.html");


# Переменные для сборки сайта ПИФ.

my $fh;
my $path_PIF_framework        = 'assembly_parts/PIF_framework.html';
my $PIF_framework             = '';
my $path_PIF_head_integration = 'assembly_parts/PIF_head_integration.html';
my $PIF_head_integration      = '';
my $path_PIF_link_to_ru       = 'assembly_parts/PIF_link_to_ru.html';
my $PIF_link_to_ru            = '';
my $path_PIF_link_to_en       = 'assembly_parts/PIF_link_to_en.html';
my $PIF_link_to_en            = '';
my $path_PIF_content          = 'assembly_parts/PIF_content.html';
my $PIF_content               = '';
my $path_PIF_content_en       = 'assembly_parts/PIF_content_en.html';
my $PIF_content_en            = '';
my $PIF;
my $PIF_en;

open $fh, '<', $path_PIF_framework or die $!;
while (<$fh>) {
    $PIF_framework .= $_;
}
close $fh;

open $fh, '<', $path_PIF_head_integration or die $!;
while (<$fh>) {
    $PIF_head_integration .= $_;
}
close $fh;

open $fh, '<', $path_PIF_link_to_ru or die $!;
while (<$fh>) {
    $PIF_link_to_ru .= $_;
}
close $fh;

open $fh, '<', $path_PIF_link_to_en or die $!;
while (<$fh>) {
    $PIF_link_to_en .= $_;
}
close $fh;

open $fh, '<', $path_PIF_content or die $!;
while (<$fh>) {
    $PIF_content .= $_;
}
close $fh;

open $fh, '<', $path_PIF_content_en or die $!;
while (<$fh>) {
    $PIF_content_en .= $_;
}
close $fh;


# Сборка версии ПИФ на русском.

$PIF = $PIF_framework;
$PIF =~ s/%html_language%/ru/;
$PIF =~ s/%head_integration%/$PIF_head_integration/;
$PIF =~ s/%head_title%/Порядок именования фотографий (ПИФ)/;
$PIF =~ s/%link_to_other_language%/$PIF_link_to_en/;
$PIF =~ s/%content%/$PIF_content/;
open $fh, '>', 'html/PIF.html' or die $!;
print $fh $PIF;
close $fh;
print "+ html/PIF.html\n";


# Сборка версии ПИФ на английском.

$PIF_en = $PIF_framework;
$PIF_en =~ s/%html_language%/en/;
$PIF_en =~ s/%head_integration%/$PIF_head_integration/;
$PIF_en =~ s/%head_title%/Naming order of photos (PIF)/;
$PIF_en =~ s/%link_to_other_language%/$PIF_link_to_ru/;
$PIF_en =~ s/%content%/$PIF_content_en/;
open $fh, '>', 'html/PIF_en.html' or die $!;
print $fh $PIF_en;
close $fh;
print "+ html/PIF_en.html\n";


# Готово!

print "Assembly completed!";
