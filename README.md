# I Choo Choo Choooes You

````

    选    |                | |       |
  _--  /------            -----   _______
    }     |                |_|       |
   /   _______            _____   _________
  }                      |  鞋  |
 }       / \             -------     |
}       /   \               |     _______
}      /     \__/         -----      |
 ~~~~_           _~~~~      |    _________
      ~~____~~~~


````

Choes helps you to switch between various [implementations](https://github.com/shoes/shoes4/wiki/Shoes-Implementations) of "the best little DSL for GUI programming there is" [Shoes](http://github.com/shoes/shoes)!


To use it, stick all your Shoes in a single directory. Choes will look in `/opt/shoes` or `$HOME/.shoes` by default. Or you can set `$SHOES_DIR` to where you keep yours.

Suppose you cloned Choes to a directory named ${CHOES}, then in your `.bashrc` or `.zshrc` simply

````bash
. ${CHOES}/share/choes/choes.sh
````

Now you can `choes green`, `choes red` or `choes 4` to switch back and forth. It works by altering the `$PATH` and `$RUBYLIB` environment variables.

Choes is still very, very young. I'm only testing it on Ubuntu Linux at the moment. It should probably work on Mac OS X as well. Any feedback running it your platform of choice is very appreciated! Open an issue or come talk on the Shoes mailing list. (just mail to `shoes [at] librelist [dot] com` and it will automatically subscribe you.)

## Chruby / RVM integration

Choes has a generic hook to run extra commands after switching to a certain Shoes. This can be used to do some implementation specific changes to your environment, like activating a specific Ruby. Have a look at `choes-chruby.sh` and `choes-rvm.sh` to see how this can be used.

## Notes on implementations

Choes expects to find an executable `bin/shoes` or `dist/shoes`. Some colors use different names like `gshoes` or `swt-shoooes`. In those cases make a symlink from `bin/shoes` and you're good to go.

### Red Shoes

When cloning [Red Shoes](http://github.com/shoes/shoes), I recommend naming the directory `red_shoes` to prevent ambiguities.

### shoes-install.sh

I'm documenting extra steps needed beyond `git clone` to install specific implementations in the `shoes-install.sh` file. At this point I don't recommend running those functions directly, but rather to use them as documentation.

## Thank you <3 <3 <3

All the great people who have contributed to all these colorful shoes! And a big thanks to @postmodern for [Chruby](https://github.com/postmodern/chruby), since Choes borrows heavily from Chruby.

## License

see `LICENSE.txt`
