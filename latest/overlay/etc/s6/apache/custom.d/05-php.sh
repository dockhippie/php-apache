#!/bin/bash
source /usr/bin/entrypoint

echo "> writing php config"
/usr/bin/gomplate -V \
  -o /etc/php7/php.ini \
  -f /etc/templates/php.ini.tmpl

if [[ $? -ne 0 ]]
then
  /bin/s6-svscanctl -t /etc/s6
  exit 1
fi

find /etc/php7/custom.d -mindepth 1 -type d -print0 | while read -d $'\0' TEMPLATE
do
  RELATIVENAME=${TEMPLATE//\/etc\/php7\/custom.d\//}

  if [ ! -d "/etc/php7/conf.d/${RELATIVENAME}" ]
  then
    mkdir "/etc/php7/conf.d/${RELATIVENAME}"
  fi
done

find /etc/php7/custom.d -mindepth 1 -type f -print0 | while read -d $'\0' TEMPLATE
do
  RELATIVENAME=${TEMPLATE//\/etc\/php7\/custom.d\//}

  ln -sf \
    "/etc/php7/conf.d/${RELATIVENAME}" \
    "/etc/php7/custom.d/${RELATIVENAME}"
done

pushd ${PHP_COMPOSER_ROOT} > /dev/null
  if [ -f composer.json ]
  then
    if [ -n "${GITHUB_TOKEN}" ]
    then
      echo "> set github token"
      su-exec \
        apache \
        /usr/bin/composer \
        config \
        -n \
        -g github-oauth.github.com \
        ${GITHUB_TOKEN}
    fi

    if [[ "${PHP_COMPOSER_INSTALL}" == "true" ]]
    then
      echo "> install composer deps"
      n=0
      until [ $n -ge 5 ]
      do
        su-exec \
          apache \
          /usr/bin/composer \
          install \
          --no-dev \
          --no-scripts \
          -n \
          -q \
          --working-dir ${PHP_COMPOSER_ROOT} && break

        n=$(($n+1))
        sleep 3
      done
    fi
  fi
popd > /dev/null
