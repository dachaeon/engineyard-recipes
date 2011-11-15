# Engine Yard Recipes

Tools to generate, upload, test and apply chef recipes for Engine Yard Cloud.

[![Build Status](https://secure.travis-ci.org/engineyard/engineyard-recipes.png)](http://travis-ci.org/engineyard/engineyard-recipes)

## Installation

    gem install engineyard-recipes
    
## Usage

Getting started:

```
$ cd /path/to/my/app
$ ey-recipes init
    create  cookbooks/main/attributes/recipe.rb
    create  cookbooks/main/definitions/ey_cloud_report.rb
    create  cookbooks/main/libraries/ruby_block.rb
    create  cookbooks/main/libraries/run_for_app.rb
    create  cookbooks/main/recipes/default.rb
```

Quickly generate recipes from git repositories or local folders.

Either repos that describe a recipe such as [ey-dnapi](https://github.com/damm/ey-dnapi):

```
$ mkdir /tmp/recipes/
$ git clone git://github.com/damm/ey-dnapi.git /tmp/recipes/ey-dnapi
$ ey-recipes clone /tmp/recipes/ey-dnapi
```

Generate scaffolding for a package/service.

```
$ ey-recipes recipe newthing
    create  cookbooks/newthing/attributes/recipe.rb
    create  cookbooks/newthing/recipes/default.rb
    create  cookbooks/newthing/recipes/install.rb
    append  cookbooks/main/recipes/default.rb
```

Generate scaffolding for helper functions:

```
$ ey-recipes definition myhelpers some_helper
    create  cookbooks/mylibrary/definitions/helper1.rb
```

## Community recipe repos to clone

### Components

* mongodb [[repo](https://github.com/engineyard/ey-cloud-recipes/tree/master/cookbooks/mongodb)]

```
$ git clone https://github.com/engineyard/ey-cloud-recipes.git /tmp/recipes/ey-cloud-recipes
$ ey-recipes clone /tmp/recipes/ey-cloud-recipes/cookbooks/mongodb
```

* [elasticsearch](http://www.elasticsearch.org/)

```
$ git clone https://github.com/damm/ey-elasticsearch.git /tmp/recipes/ey-elasticsearch
$ ey-recipes clone /tmp/recipes/ey-elasticsearch -n elasticsearch
```

* [riak](http://basho.com/products/riak-overview/) [[repo](https://github.com/damm/ey-riak)]

```
$ git clone https://github.com/damm/ey-riak.git /tmp/recipes/ey-riak
$ ey-recipes clone /tmp/recipes/ey-riak -n riak
```

* [riaksearch](http://basho.com/products/riak-overview/) [[repo](https://github.com/damm/ey-riaksearch)]

Either use riak above or riaksearch, not both!

```
$ git clone https://github.com/damm/ey-riaksearch.git /tmp/recipes/ey-riaksearch
$ ey-recipes clone /tmp/recipes/ey-riaksearch -n riaksearch
```



### Environment Customizations

* database.yml [[repo](https://github.com/damm/ey-database)]

```
$ git clone https://github.com/damm/ey-database.git /tmp/recipes/ey-database
$ ey-recipes clone /tmp/recipes/ey-database
```

Also install ey-dnapi below.

### Helpers

* ey-emerge - additional helpers to install/use masked packages [[repo](https://github.com/damm/ey-emerge)]

```
$ git clone https://github.com/damm/ey-emerge.git /tmp/recipes/ey-emerge
$ ey-recipes clone /tmp/recipes/ey-emerge -n emerge
```

* ey-dnapi - access the internal dna.json metadata via `node[:engineyard]` [[repo](https://github.com/damm/ey-dnapi)]

```
$ git clone https://github.com/damm/ey-dnapi.git /tmp/recipes/ey-dnapi
$ ey-recipes clone /tmp/recipes/ey-dnapi -n dnapi
```

