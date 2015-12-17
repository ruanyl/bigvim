v1.3 - 2015-12-13
=======

### Important
Update installation script, new there is a new way to install this vim configuration. see `README` for more information

### New plugins
####1. [ruanyl/vim-eslint](https://github.com/ruanyl/vim-eslint)
This is temporaly fix for slow linting of eslint. 

v1.2 - 2015-11-28
=======

### Important
1. `vimrc.bundle` is more readable now
2. Add settings(experimental feature) for selective loading plugin groups, for example:
```
let g:bigvim_minor_plugins=['php', 'css',]
```
Remove plugin group from the array to disable the plugins, settings can be changed at `vimrc.before`
The idea here is, since the number of plugin is growing, give it the capability to only load the plugins that are needed.

### New plugins
####1. [inside/vim-search-pulse](https://github.com/inside/vim-search-pulse)

![vim-search-pulse](https://camo.githubusercontent.com/d2668b3edb833254fa8f235651df3d6e52e7e8db/687474703a2f2f692e696d6775722e636f6d2f756b5a757469322e676966)

####2. [fantasyczl/blade-php-vim](https://github.com/fantasyczl/blade-php-vim)
Use this `balde` syntax plugin instead of `jwalton512/vim-blade`, because the old one causes vim sometimes gets stucked

### Minor changes
Add setting `let tern_show_argument_hints = 'on_hold'` for `tern_for_vim`, it will shows the argument hint when cursor
stay on a function for a while

### Removed
####1. [mattn/webapi-vim](https://github.com/mattn/webapi-vim)
this plugin should be installed as a dependency.


v1.1 - 2015-11-01
=======
### New plugins
####1. [ggVGc/vim-fuzzysearch](https://github.com/ggVGc/vim-fuzzysearch)

![fuzzysearch](https://github.com/ggVGc/vim-fuzzysearch/raw/master/doc/example.gif)

####2. [unblevable/quick-scope](https://github.com/unblevable/quick-scope)

![qs1](https://cloud.githubusercontent.com/assets/723755/8228897/6603ab28-1580-11e5-82cc-b048e3801edb.gif)
![qs2](https://cloud.githubusercontent.com/assets/723755/8230149/6ecbed28-158b-11e5-9474-89e846e7682c.gif)

####3. [airblade/vim-gitgutter](https://github.com/airblade/vim-gitgutter)

![gitgutter](https://camo.githubusercontent.com/f88161827e0cbb3144455b9e5c7582fdd5b5fc83/68747470733a2f2f7261772e6769746875622e636f6d2f616972626c6164652f76696d2d6769746775747465722f6d61737465722f73637265656e73686f742e706e67)

### Kep mappings
1. Removed key mapping for :CtrlP, use default `ctrl+p`

### Minor changes
1. User `noremap` instead of `map`

### Removed
####1. [Ioannis-Kapoulas/vim-autoprefixer](https://github.com/Ioannis-Kapoulas/vim-autoprefixer)
	auto prefix usually done by building tools
