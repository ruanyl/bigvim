bigvim
======================

Inspired by [k-vim](https://github.com/wklken/k-vim), but more front-end stuffs

### 配置步骤

> 注意，该配置需要vim7.4.x. 在MacOS下测试过。

1. clone到本地任意目录
  ```
  git clone https://github.com/ruanyl/bigvim.git
  ```

2. 安装Nodejs，建议使用nvm
  ```
  brew install nvm
  nvm install v0.xx.x
  ```

3. 安装相关node module（install.sh会默认检查并安装，如果失败需要手动安装）
  ```
  npm i -g eslint #JS 语法，代码规范检查
  npm i -g js-beautify # JS, CSS, HTML 快速格式化
  npm i -g git+https://github.com/ramitos/jsctags.git # tagbar JS 支持
  ```
  相关eslint插件请自行安装

4. 其他依赖
  ```
  ctags, ag
  ```
  安装YouCompleteMe如果出现问题，请前往项目主页寻找解决方法,
  [Ubuntu Linux x64 super-quick installation](https://github.com/Valloric/YouCompleteMe#ubuntu-linux-x64-super-quick-installation)
  [Mac OS X super-quick installation](https://github.com/Valloric/YouCompleteMe#mac-os-x-super-quick-installation)

5. 安装插件
  ```
  cd bigvim/
  sh -x install.sh
  install.sh
  ```

6. 安装powerline美化字体:
  推荐[Monaco for Powerline](https://gist.github.com/ruanyl/ea38de37683951c20bf5/raw/5fa73caa4af86285f11539a6b4b6c26cfca2c04b/Monaco%20for%20Powerline.otf) 或者去[Lokaltog/powerline-fonts](https://github.com/Lokaltog/powerline-fonts) 自行寻找

7. 复制vimrc.bundles.example 到 vimrc.bundles，在这里加入你自己的自定配置

### 内置主题

solarized主题

![solarized](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/solarized.png)

molokai主题

![molokai](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/molokai.png)


### 常用自定义快捷键(`<leader>`映射为`,`)

```
空格  开启查找(Easymotion模式)
:W    以sudo的权限保存
,sa  全选(select all)
ctrl + jkhl 进行上下左右窗口跳转,不需要ctrl+w+jkhl
,f   开启文件搜索 ctrlp
,/   去除匹配高亮
'    :b
qq   关闭当前Buffer
qo   关闭除当前buffer之外的所有buffer
m    在Buffer之间顺序切换
M    在Buffer之间逆序切换
Tab  最大化当前split窗口/切换
,r   快速运行当前文件
H    到行首
L    到行尾
```

> 更多地快捷键，请在vimrc中对应的插件查找


## 主要插件列表

####[junegunn/vim-plug](https://github.com/junegunn/vim-plug)
使用vim-plug来管理插件，vim-plug能够选择branch，执行插件初始命令,
延迟加载插件等功能

```
:PlugInstall     install
:PlugUpdate      update
:PlugClean       remove plugin not in list
```

####[scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
文件浏览器
```
,e
```

![thenerdtree](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/nerdtree.gif)


####[majutsushi/tagbar](https://github.com/majutsushi/tagbar)
浏览taglist

```
,t
```

####[kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
快速文件搜索+导航
```
,f  默认查找 最近使用的+文件搜索+buffer
,m  相当于mru功能，most recently used
,b  查找buffer
```

ctrl + j/k 进行上下移动 或者小键盘方向键
![ctrlp](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/ctrlp.gif)

####[tacahiroy/ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)
CtrlP插件，类似go to definition的功能

```
,fu 打开搜索
```
![ctrlp-funky](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/ctrlp-funky.gif)

####[dyng/ctrlsf.vim](https://github.com/tacahiroy/ctrlp-funky)
CtrlP插件，提供sublime类似的grep搜索

```
,s      #在可视模式下选择要搜索内容
```

![dyng/ctrlsf.vim](https://camo.githubusercontent.com/a7eef846eae3efe4f021f34c9b8526300b872b0f/687474703a2f2f692e696d6775722e636f6d2f4e4f793867776a2e676966)

####[rking/ag.vim](https://github.com/rking/ag.vim)
提供快速grep功能

```
,,a     #然后输入要检索的内容
```

####[bling/vim-airline](https://github.com/bling/vim-airline)
状态栏，buffer兰美化

![vim-airline](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/vim-airline.png)

####[gorodinskiy/vim-coloresque](https://github.com/gorodinskiy/vim-coloresque)
高亮显示文档中颜色代码

![vim-coloresque](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/vim-colorsque.png)

####[bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)
将代码行最后无效的空格标红

```
,空格    去掉多余空格
```

####[dhruvasagar/vim-prosession](https://github.com/dhruvasagar/vim-prosession)
保存当前打开文件、slpit窗口、buffer的状态，下次在该目录下运行`vim`的时候自动还原

####[MattesGroeger/vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)
在左侧添加书签、注释等。

```
,,m  # 切换书签显示\关闭，更多快捷键请查看vimrc
```

####[Valloric/MatchTagAlways](https://github.com/Valloric/MatchTagAlways)
高亮显示匹配的标签

![matchtagalways](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/matchtagalways.gif)

####[szw/vim-maximizer](https://github.com/szw/vim-maximizer)
最大化当前窗口\返回之前状态切换，在多个split窗口的非常有用

```
tab    # 快捷键设置为tab
```

####[Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
跳转到任意位置

```
空格  搜索两个字符，快速跳转
/    替代vim默认的搜索功能，如果不喜欢可以去除
```

![easy_motion](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/easy-motion.gif)

####[vim-scripts/matchit.zip](https://github.com/vim-scripts/matchit.zip)
快速匹配() [] {} 等

   `%` 匹配标签，不只是单个的字符，还可以匹配单词，如html标签


####[gcmt/wildfire.vim](https://github.com/gcmt/wildfire.vim)
快速选取代码块

![wildfire](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/wildfire.gif)

####[alvan/vim-closetag](https://github.com/alvan/vim-closetag)
自动关闭html, xml标签

![closetag](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/CloseTag.gif)

####[Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
强大的自动补全，如果安装失败，请前往该项目的github wiki查找帮助
![YCM](https://camo.githubusercontent.com/1f3f922431d5363224b20e99467ff28b04e810e2/687474703a2f2f692e696d6775722e636f6d2f304f50346f6f642e676966)


###[SirVer/ultisnips](https://github.com/SirVer/ultisnips)
代码片段工具
```
<C-\> 触发
```
![ultisnips](https://camo.githubusercontent.com/296aecf30e1607233814196db6bd3f5f47e70c73/68747470733a2f2f7261772e6769746875622e636f6d2f5369725665722f756c7469736e6970732f6d61737465722f646f632f64656d6f2e676966)


####[scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
快速注释工具
```
shift+v 选择要注释的行
,cc  注释单行或者选中行
,cm  多行注释
,cu  解开注释
,ci  在注释和取消注释之间切换
```
![nerdcomment](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/nerdcomment.gif)


####[tpope/vim-surround](https://github.com/tpope/vim-surround)
快速给单词添加 单引号，双引号，中括号等
```
ysiw"
Hello -> "Hello"
cs"'
"Hello world!" -> 'Hello world!'
ds"
"Hello world!" -> Hello world!
```
![surround](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/surround.gif)


###[tpope/vim-repeat](https://github.com/tpope/vim-repeat)
重复上一次命令
```
 . # 快捷键
```


#### [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)
自动补全：(), [], {}, <>


####[godlygeek/tabular](https://github.com/godlygeek/tabular)
代码按=或者: 对齐
```
,a=   按等号对齐
,a:   安冒号对齐
```
![tabular](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/tabular.gif)


####[terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
多光标操作
```
,n  开始选择
,x  跳过当前
,p  返回选择
```
![multicursor](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/multicursor.gif)


####[mattn/emmet-vim](https://github.com/mattn/emmet-vim)
快速书写html
```
<C-y>,  触发
```
![emmet](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/emmet.gif)


####[scrooloose/syntastic](https://github.com/scrooloose/syntastic)
语法检查插件，写javascript配合eslint使用非常有帮助
![syntastic](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/syntastic.png)


####[hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)
css3语法高亮

####[tpope/vim-markdown](https://github.com/tpope/vim-markdown)
markdown语法高亮


## Javascript相关插件
####[pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)
JS语法高亮

###[kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
coffee script语法高亮

###[mxw/vim-jsx](https://github.com/mxw/vim-jsx)
React JSX语法高亮

####[othree/javascript-libraries-syntax.vim](https://github.com/othree/javascript-libraries-syntax.vim)
一些javascript library的语法高亮

####[burnettk/vim-angular](https://github.com/othree/burnettk/vim-angular)
Angular相关

####[ruanyl/vim-fidget](https://github.com/othree/ruanyl/vim-fidget)
vim版jsfiddle，打开3个split窗口，分别是css,js,html，快速写点小demo时比较实用
```
:VimFidget   # 进入3个窗口，并自动打开浏览器。并且是livereload的
:VimFidgetBrowse    # 上传代码到jsfiddle
```

####[heavenshell/vim-jsdoc](https://github.com/heavenshell/vim-jsdoc)
```
,,d  光标定位在方法上面，自动生成js doc
```

###[marijnh/tern_for_vim](https://github.com/marijnh/tern_for_vim)
非常强大javascript代码自动补全，支持node，jquery，浏览器相关api的
相关配置可以看[这篇博客](http://efe.baidu.com/blog/vim-javascript-completion/)
```
,d  #go to definition功能
```

## PHP相关插件
####[StanAngeloff/php.vim](https://github.com/StanAngeloff/php.vim)
php语法高亮

####[shawncplus/phpcomplete.vim](https://github.com/shawncplus/phpcomplete.vim)
php自动补全增强

####[mkusher/padawan.vim](https://github.com/mkusher/padawan.vim)
更加强大的php自动补全，能够检索composer项目，对相关依赖library进行补全
>安装方法请见项目主页
![padawan](https://camo.githubusercontent.com/2d1bebc7052809b43ac7e051b86149dab60e454f/687474703a2f2f69312e7974696d672e636f6d2f76692f59353450324e3154362d492f6d617872657364656661756c742e6a7067)

####[ruanyl/vim-php-manual](https://github.com/ruanyl/vim-php-manual)
php手册
```
K    # 查找当前光标下的关键字
```

####[sjl/gundo.vim](https://github.com/sjl/gundo.vim)
查看文件历史修改记录，移动到某一个时间点，`r` 来查看改动，`enter`返回到这个状态
```
,h
```
![gundo](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/gundo.png)


####[Chiel92/vim-autoformat](https://github.com/Chiel92/vim-autoformat)
格式化js,json,html,css,scss
```
,,f  自动格式化
```

####[thinca/vim-quickrun](https://github.com/thinca/vim-quickrun)
```
,r  运行当前文件，如运行javascript
```

####[tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
git整合

####[moll/vim-bbye](https://github.com/moll/vim-bbye)
```
qq 删除当前buff
```

####[vim-scripts/BufOnly.vim](https://github.com/vim-scripts/BufOnly.vim)
```
qo 关闭所有buff，当前除外
```

####[editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
支持.editorconfig文件
