#!/bin/bash

dep_url="https://github.com/picrust/picrust/releases/download/1.0.0/picrust-1.0.0.tar.gz"
here=$(readlink -f "${0}" | sed -e 's#\(.*/\).*#\1#g')

install_dir="${1}"

# install the picrust scripts
wget -O- "${dep_url}" | tar -C "${install_dir}" -xzf -
virtualenv "${install_dir}/env"
source "${install_dir}/env/bin/activate"
pip install numpy 
pip install cogent
pip install biom-format
python setup.py install
deactivate

# install the picrust data dependencies
datadir="${install_dir}/picrust-1.0.0/picrust/data"
mkdir -p "${datadir}"
wget_="wget -P ${datadir}"
$wget_ ftp://thebeast.colorado.edu/pub/picrust-references/picrust-1.0.0/16S_13_5_precalculated.tab.gz 
$wget_ ftp://thebeast.colorado.edu/pub/picrust-references/picrust-1.0.0/ko_13_5_precalculated.tab.gz 
$wget_ https://github.com/picrust/picrust/releases/download/0.9.2/16S_18may2012_precalculated.tab.gz
$wget_ https://github.com/picrust/picrust/releases/download/0.9.2/ko_18may2012_precalculated.tab.gz
$wget_ https://github.com/picrust/picrust/releases/download/0.9.2/cog_18may2012_precalculated.tab.gz 

# Prime the wrapper script with the virtualenv
sed -i -e 's|LOCATION|'"${install_dir}"'/picrust-1.0.0/env/bin/activate.sh|' \
    "${here}/picrust_cmd"

