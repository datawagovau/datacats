#! /bin/bash

CKAN_HOME=/usr/lib/ckan
CKAN_CONFIG=/etc/ckan/default
CKAN_SRC=/project/src

$CKAN_HOME/bin/paster make-config ckan $CKAN_CONFIG/ckan.ini
$CKAN_HOME/bin/paster --plugin=ckan config-tool "$CKAN_CONFIG/ckan.ini" -e \
    "sqlalchemy.url             =   postgresql://ckan:password@db:5432/ckan" \
    "ckan.datastore.read_url    =   postgresql://ckan_datastore_readonly:password@db:5432/ckan_datastore" \
    "ckan.datastore.write_url   =   postgresql://ckan:ckan_datastore_readwrite@db:5432/ckan_datastore" \
    "solr_url                   =   http://solr:8080/solr" \
    "ckan.storage_path          =   /var/www/storage"
