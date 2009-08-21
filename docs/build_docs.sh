#!/bin/bash

function clone {
    dir=$1
    ref=$2

    if [ -d $dir ] && grep "$ref" $dir/.git/config >/dev/null ; then
	cd $dir
	echo "updating $ref"
	git pull origin master
	cd ..
    else
	rm -rf $dir
	echo "cloning $ref"
	git clone -q $ref
    fi
}

mkdir -p external/repos
cd external/repos

clone django-email-confirmation\
      git://github.com/jezdez/django-email-confirmation.git

clone django-timezones\
      git://github.com/brosner/django-timezones.git

clone django-threadedcomments\
      git://github.com/ericflo/django-threadedcomments.git

clone django-ajax-validation\
      git://github.com/alex/django-ajax-validation.git

clone django-flag\
      git://github.com/pinax/django-flag.git

clone django-pagination\
      git://github.com/ericflo/django-pagination.git

clone django-oembed\
      git://github.com/ericflo/django-oembed.git

clone django-notification\
      git://github.com/brosner/django-notification.git

clone django-mailer\
      git://github.com/jtauber/django-mailer.git

clone django-dbtemplates\
      git://github.com/jezdez/django-dbtemplates.git

clone django-robots\
      git://github.com/jezdez/django-robots.git

clone django-announcements\
      git://github.com/pinax/django-announcements.git

echo "checking out django-messages"
rm -rf django-messages
svn checkout --quiet http://django-messages.googlecode.com/svn/trunk/ django-messages

cd ../
find . -maxdepth 1 -type l | xargs rm -f
ln -s repos/django-email-confirmation/docs emailconfirmation
ln -s repos/django-timezones/docs timezones
ln -s repos/django-threadedcomments/docs threadedcomments
ln -s repos/django-ajax-validation/docs ajax-validation
ln -s repos/django-flag/docs flag
ln -s repos/django-pagination/docs pagination
ln -s repos/django-oembed/docs oembed
ln -s repos/django-notification/docs notification
ln -s repos/django-mailer/docs mailer
ln -s repos/django-dbtemplates/docs dbtemplates
ln -s repos/django-robots/docs robots
ln -s repos/django-announcements/docs announcements
ln -s repos/django-messages/docs messages

cd ../
rm -rf _build
make html