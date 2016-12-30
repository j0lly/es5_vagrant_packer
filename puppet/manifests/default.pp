$instances = hiera_hash('elasticsearch_instances')

# make elasticserach instance
include elasticsearch
create_resources('::elasticsearch::instance', $instances)

# install basic monitoring
include base_monitor
