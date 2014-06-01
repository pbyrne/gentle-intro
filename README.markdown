A Gentle Introduction to Running Your Own Server
================================================

This project is a simple proof-of-concept of using [Chef] and [Berkshelf] to configure a simple web server, testing your configuration locally with [Vagrant] and then being able to deploy to a production server on [Digital Ocean][do].

What the What?
--------------

* [Chef] is configuration management software, where you set up rules (in cookbooks) about how you want your servers to be set up in a repeatable fashion.
* [Berkshelf] helps you manage your cookbooks as well as use [third-party, open-source cookbooks][third-party-cookbooks].
* [Vagrant] manages virtual machines to test out your configuration. It can talk to lots of services, but for this exercise we'll use [VirtualBox] for local virtual machines and [Digital Ocean][do] for public servers.
* [VirtualBox] is an open-source project which gives you virtual machines on your computer.

Visit the project sites to learn more about any of these tools.

Getting Started
---------------

1. Install [VirtualBox] and [Vagrant].
2. Install the following Vagrant plugins:
    1. `vagrant plugin install vagrant-omnibus` (to install Chef on our servers)
    2. `vagrant plugin install vagrant-digitalocean` (to spin up production servers on Digital Ocean)
3. `bundle` to install the gems you need.
4. `vagrant up dev` to spin up a virtual server and install everything with Chef.
    * Once the server is spun up, `vagrant provision dev` will re-run Chef, if you make any changes.
5. `vagrant up prod --provider=digital_ocean` to create the server on Digital Ocean with an identical configuration.
    * Once the server is spun up, `vagrant provision prod` will re-run Chef, if you make any changes.


[berkshelf]:http://berkshelf.com/
[chef]:http://www.getchef.com/chef/
[do]:https://www.digitalocean.com
[third-party-cookbooks]:http://community.opscode.com/cookbooks
[vagrant]:http://www.vagrantup.com/
[virtualbox]:https://www.virtualbox.org
