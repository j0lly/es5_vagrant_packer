
# make elasticserach instance
include elasticsearch
elasticsearch::instance { 'node01': }
# install basic monitoring
include base_monitor
