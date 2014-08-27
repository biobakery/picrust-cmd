###########
picrust_cmd
###########

A Handy wrapper around picrust scripts
######################################
Be sure to refer to the picrust documentation_.

.. _documentation: http://picrust.github.io/picrust/index.html


Usage
#####
Just prefix any picrust script with picrust-cmd::
  $ picrust-cmd normalize_by_copy_numpy.py ...

Install
#######
**For Ubuntu only.**
Installation should be done via the apt-get command::
  
  # apt-get install -y qiime-cmd

You may need to install the Huttenhower lab repository::

  $ echo "deb http://huttenhower.sph.harvard.edu/biobakery-shop/deb-packages /" \
	| sudo bash -c "cat - >> /etc/apt/sources.list "
 
  $ wget -O- -q "http://huttenhower.sph.harvard.edu/biobakery-shop/deb-packages/biobakery.asc" \
	| sudo apt-key add -
