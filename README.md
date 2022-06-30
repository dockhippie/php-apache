# php-apache

[![Docker Build](https://github.com/dockhippie/php-apache/actions/workflows/docker.yml/badge.svg)](https://github.com/dockhippie/php-apache/actions/workflows/docker.yml) [![GitHub Repo](https://img.shields.io/badge/github-repo-yellowgreen)](https://github.com/dockhippie/php-apache)

These are docker images for [PHP][upstream] running on our
[Apache image][parent].

## Versions

For the available versions please look at [Docker Hub][dockerhub] or
[Quay][quayio] or check the existing folders within the
[GitHub repository][github].

## Volumes

*  /srv/www
*  /etc/php8/custom.d

## Ports

*  8080

## Available environment variables

```console
PHP_ALLOW_URL_FOPEN = On
PHP_ALLOW_URL_INCLUDE = Off
PHP_COMPOSER_INSTALL = true
PHP_COMPOSER_ROOT = ${APACHE_WEBROOT}
PHP_DATE_TIMEZONE = UTC
PHP_DISPLAY_ERRORS = On
PHP_DISPLAY_STARTUP_ERRORS = On
PHP_ENABLE_DL = Off
PHP_ERROR_LOG = /proc/self/fd/2
PHP_ERROR_REPORTING = E_ALL & ~E_DEPRECATED & ~E_STRICT
PHP_EXPOSE_HEADER = On
PHP_HTML_ERRORS = On
PHP_IGNORE_REPEATED_ERRORS = Off
PHP_IGNORE_REPEATED_SOURCE = Off
PHP_LOG_ERRORS = On
PHP_LOG_ERRORS_MAX_LEN = 1024
PHP_MAX_EXECUTION_TIME = 3600
PHP_MAX_FILE_UPLOADS = 20
PHP_MAX_INPUT_TIME = 3600
PHP_MEMORY_LIMIT = 1G
PHP_OUTPUT_BUFFERING = 4096
PHP_POST_MAX_SIZE = 2G
PHP_REPORT_MEMLEAKS = On
PHP_SKIP_TEMPLATES = false
PHP_TRACK_ERRORS = Off
PHP_UPLOAD_MAX_FILESIZE = 2G
```

## Inherited environment variables

*  [webhippie/apache](https://github.com/dockhippie/apache#available-environment-variables)
*  [webhippie/alpine](https://github.com/dockhippie/alpine#available-environment-variables)

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

*  [Thomas Boerger](https://github.com/tboerger)

## License

MIT

## Copyright

```console
Copyright (c) 2015 Thomas Boerger <http://www.webhippie.de>
```

[upstream]: https://secure.php.net
[parent]: https://github.com/dockhippie/apache
[dockerhub]: https://hub.docker.com/r/webhippie/php-apache/tags
[quayio]: https://quay.io/repository/webhippie/php-apache?tab=tags
[github]: https://github.com/dockhippie/php-apache
