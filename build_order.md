# Создание HTML-версии ПИФ

## Инструменты

- Perl
- cmark

## Порядок действий

1. Скопировать оригиналы ПИФ из их репозитория
    ```
    perl -e 'use File::Copy; copy("../vc_pif/PIF.md", "original/PIF.md");'
    perl -e 'use File::Copy; copy("../vc_pif/PIF_en.md", "original/PIF_en.md");'
    ```
2. Создать HTML-версию содержимого оригиналов ПИФ
    ```
    cmark -t html original/PIF.md > PIF_content.html
    cmark -t html original/PIF_en.md > PIF_content_en.html
    ```
3. Вручную обновить HTML-версии ПИФ в папке **html**