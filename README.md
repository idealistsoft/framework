Infuse Framework
=====

[![Build Status](https://travis-ci.org/infusephp/framework.png?branch=master)](https://travis-ci.org/infusephp/framework)

Modular PHP framework built with infuse/libs

## What is Infuse Framework?

Infuse Framework is a tool for building modern web applications. It is built on top of [infuse/libs](https://github.com/infusephp/libs). The goal of this framework is scalability and an increase in developer productivity through a simple modular design.

## Features

- Modular
- MVC style
- Dependency Injection
- Database agnostic and migrations with [phinx](http://phinx.org)
- Flexible URL routing
- Templating with [Smarty](http://smarty.net) or pure PHP
- Logging with [monolog](https://github.com/Seldaek/monolog)

## Requirements

- PHP >= 5.4
- [Composer](http://getcomposer.org)
- [PDO](http://php.net/manual/en/book.pdo.php) (if using models)
- mod_rewrite (if using Apache)

### Optional

- [redis](http://redis.io/): Alternative for sessions and model caching
- [memcached](http://www.memcached.org/): Alternative for model caching
- [grunt](http://gruntjs.com/): Compiles front-end assets

### Available Modules

#### Authentication

- [Auth](https://github.com/infusephp/auth): Adds user authentication to the framework
- [OAuth2](https://github.com/infusephp/oauth2): Adds support for OAuth2 and JWT access tokens
- [Facebook](https://github.com/infusephp/facebook): Adds Facebook as an authentication method
- [Twitter](https://github.com/infusephp/twitter): Adds Twitter as an authentication method
- [Instagram](https://github.com/infusephp/instagram): Adds Instagram as an authentication method

#### Services

- [API](https://github.com/infusephp/rest-api): RESTful API scaffolding for models
- [Cron](https://github.com/infusephp/cron): Processes scheduled tasks in the background
- [Email](https://github.com/infusephp/email): Provides a mailer dependency for queueing and sending email templates
- [IronMQ](https://github.com/infusephp/iron-mq): Use iron.io push queues

#### Admin

- [Admin](https://github.com/infusephp/admin): Generates an admin panel CRUD operations on models
- [Statistics](https://github.com/infusephp/statistics): Statistics collection with admin dashboard


## Demo

A demo has been setup at [infuse.jaredtking.com](http://infuse.jaredtking.com).

## Getting Started

### 1. Install with composer

```
composer create-project infuse/framework ./path/to/dir
```

Infuse Framework is served through the `public` directory to prevent the framework files from being served. This requires a small amount of configuration for the web server to work properly.

### 2. Nginx

Here is a sample configuration:

```nginx
server {
	listen 80;

 	server_name example.com;

	root /var/www/example.com/public;

	access_log /var/log/nginx/example.com-access.log;
	error_log /var/log/nginx/example.com-error.log;
	
	location / {
		try_files $uri $uri/ /index.php?q=$uri&$args;
	}

	location ~ \.php$ {
		fastcgi_pass   127.0.0.1:9000;
		fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
		include        fastcgi_params;
	}
}
```

### 2. Apache

A .htaccess file is already included in the `/public` directory for url rewrites. You must also make sure that `DocumentRoot` points to `{FRAMEWORK_PATH}/public`.

### 3. config.php

Copy the contents of `config-example.php` into `config.php` and update the settings to match your app's configuration.

### 4. Database Migrations

Once you have setup the config and have a working connection to the database you are ready to install the schema. Run:

```
php infuse migrate
```

### 5. Compile Static Assets

If you will be using grunt for managing your static assets then you first need to ensure that all the proper packages are installed:

```
npm install
grunt
```

You can use `grunt` to recompile all assets and `grunt watch` to watch for changes to the asset source files.

## Why another PHP framework?

Infuse Framework has served me well on many projects in the past. My hope by open sourcing it is that others may benefit. If something does not look right, I would love to hear about it in the issues.

## Documentation

Learn more about Infuse Framework in the [wiki](https://github.com/infusephp/framework/wiki).

## Contributing

Please feel free to contribute by participating in the issues or by submitting a pull request. :-)

## License

The MIT License (MIT)

Copyright © 2014 Jared King

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.