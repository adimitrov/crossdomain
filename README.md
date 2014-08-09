# Crossdomain

## Typical usage

```
gem install crossdomain
sudo crossdomain --policy-path "/path/to/crossdomain.xml"
```

`Crossdomain` is a standalone daemon to serve flash policy file on the default flash port (843). It uses a crossdomain.xml file you provide, which is validated against adobes schema before served. It requires `root` so it can bind to 843, but after this drops privileges to `nobody`.

## Who needs this?
If you use flash fallback for websockets and you can't serve crossdomain.xml on the same port you probably need this.

## Requirements

- Ruby 2.1.2 or greater
- root access to bind to port 843

## Configuration optiosn
```
-p, --port PORT                  Port to bind to (Default: 843).
-H, --host HOST                  Address to bind to (Default: 0.0.0.0)
-x, --policy-path PATH           crossdomain.xml policy file path (Default: pwd + /crossdomain.xml)

```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# Author

- Alexander Dimitrov

Copyright (c) 2014 Alexander Dimitrov. See LICENSE.txt for further details.