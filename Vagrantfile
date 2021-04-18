# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/amazonlinux-2"
end

# I know these should be done automatic using provisioning scripts
# but i want to do this manually to make sure i am installing everything correctly
#
# sudo yum update
#
# # Postgres 13
# sudo amazon-linux-extras install epel
# sudo tee /etc/yum.repos.d/pgdg.repo<<EOF
# [pgdg13]
# name=PostgreSQL 13 for RHEL/CentOS 7 - x86_64
# baseurl=https://download.postgresql.org/pub/repos/yum/13/redhat/rhel-7-x86_64
# enabled=1
# gpgcheck=0
# EOF
#
# sudo yum install postgresql13 postgresql13-server
# sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
# sudo systemctl enable --now postgresql-13
# systemctl status postgresql-13
# sudo su - postgres
# psql
#
# sudo yum install -y gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel gcc-c++ jq git
# curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
# gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# # Install RVM
# curl -sSL https://get.rvm.io | bash -s stable
# rvm install 3.0.0
# rvm use 3.0.0 --default
# rvm rubygems current
# gem install bundler -v 2.2.16
#
# sudo yum install -y libxml2 libxml2-devel libxslt libxslt-devel
# sudo mkdir -pv /var/www
# sudo chown -R vagrant:vagrant /var/www/
# rvm rvmrc warning ignore all.rvmrcs
#
#
# amazon-linux-extras enable BCC
# sudo yum install clang clang-devel llvm llvm-devel
# sudo yum install postgresql13 postgresql13-contrib postgresql13-docs postgresql13-libs postgresql13-llvmjit postgresql13-server
#
# # postgresql13-devel can't be installed because missing llvm-toolset-7-clang package
# # so we use this fallback although this uses these packages
# #          postgresql-libs-9.2.24-1.amzn2.0.1.x86_64                                                                                  1/3
# #          postgresql-9.2.24-1.amzn2.0.1.x86_64                                                                                       2/3
# #          postgresql-devel-9.2.24-1.amzn2.0.1.x86_64
# #  but seems to resolve the issue with installing pg gem
# sudo yum install postgresql-devel
#
# sudo -u postgres createuser -s -i -d -r -l -w vagrant
# sudo -u postgres psql -c "ALTER ROLE vagrant WITH PASSWORD '';"
#
#
# # NOT USED --- do not run them
# # Use MD5 Authentication
# sudo sed -i.bak -e 's/ident$/md5/' -e 's/peer$/md5/' /var/lib/pgsql9/data/pg_hba.conf
# sudo /sbin/chkconfig --levels 235 postgresql on
# sudo service postgresql start