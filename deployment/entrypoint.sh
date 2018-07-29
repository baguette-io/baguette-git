#!/bin/bash
set -e

# Clone gitolite-admin
if [ ! -d /home/baguette/admin ] ; then
    git config --global push.default simple
    git clone git@127.0.0.1:gitolite-admin /home/baguette/admin
    mkdir -p /home/baguette/admin/conf/repos
    mkdir -p /home/baguette/admin/conf/groups
    echo 'repo    @all' >> /home/baguette/admin/conf/gitolite.conf
    echo '    R     = admin.rsa' >> /home/baguette/admin/conf/gitolite.conf
    echo 'include     "repos/*.conf"' >> /home/baguette/admin/conf/gitolite.conf
    echo 'include     "groups/*.conf"' >> /home/baguette/admin/conf/gitolite.conf
    (cd /home/baguette/admin/ && git add conf/gitolite.conf && git commit -m "init" && git push)
fi

echo "Executing ${@} ..."
exec "$@"
