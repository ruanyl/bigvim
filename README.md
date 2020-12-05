bigvim
======================

### 配置步骤

> 注意，需要vim8.0 或者Neovim 0.4.0以上

1. 安装依赖(必须)
```
git, node, npm, yarn
```

2. 安装步骤
```
// 1. clone 该仓库到任意目录
git clone https://github.com/ruanyl/bigvim.git /path/to/bigvim

// 2. 创建相关软链
ln -s /path/to/bigvim/vimrc ~/.vimrc
ln -s /path/to/bigvim ~/.vim

// 3. 安装Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

// 4. 运行vim，然后安装vim插件
:PlugInstall
```

#### 选装

> 建议安装以下依赖以达到最好的使用体验

1. 其他依赖

  ag快速搜索插件：
  - Mac: `brew install ctags silversearcher-ag`
  - Ubuntu: `apt-get install ctags silversearcher-ag`

2. 安装powerline美化字体:
  推荐[Monaco for Powerline](https://gist.github.com/ruanyl/ea38de37683951c20bf5/raw/5fa73caa4af86285f11539a6b4b6c26cfca2c04b/Monaco%20for%20Powerline.otf) 或者去[Lokaltog/powerline-fonts](https://github.com/Lokaltog/powerline-fonts) 自行寻找


### 内置主题

solarized主题

![solarized](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/solarized.png)

molokai主题

![molokai](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/molokai.png)


### 常用自定义快捷键(`<leader>`映射为`,`)

```
空格  开启查找(Easymotion模式)
:W    以sudo的权限保存
(     左括号，在changelist 逆序切换
)     右括号，在changelist 顺序切换，文件内跳转非常有用
,sa  全选(select all)
ctrl + jkhl 进行上下左右窗口跳转,不需要ctrl+w+jkhl
ctrl+p   开启文件搜索 ctrlp
,/   去除匹配高亮
'    :b
qq   关闭当前Buffer
qo   关闭除当前buffer之外的所有buffer
m    在Buffer之间顺序切换
M    在Buffer之间逆序切换
Tab  最大化当前split窗口/切换
,r   快速运行当前文件
H    到行首
L    到行尾
,d   javascript go to defination
,,d  快速添加JS Doc
```

> 更多地快捷键，请在vimrc中对应的插件寻找


## 主要插件列表

#### [junegunn/vim-plug](https://github.com/junegunn/vim-plug)
使用vim-plug来管理插件，vim-plug能够选择branch，执行插件初始命令,
延迟加载插件等功能

```
:PlugInstall     install
:PlugUpdate      update
:PlugClean       remove plugin not in list
```

#### [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)
文件浏览器
```
,e
```

![thenerdtree](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/nerdtree.gif)


#### [kien/ctrlp.vim](https://github.com/kien/ctrlp.vim)
快速文件搜索+导航
```
f   默认CtrlP查找
,m  相当于mru功能，most recently used
,b  查找buffer
```

ctrl + j/k 进行上下移动 或者小键盘方向键
![ctrlp](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/ctrlp.gif)


#### [rking/ag.vim](https://github.com/rking/ag.vim)
提供快速grep功能

```
,,a     #然后输入要检索的内容
```

#### [bling/vim-airline](https://github.com/bling/vim-airline)
状态栏，buffer兰美化

![vim-airline](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/vim-airline.png)

#### [bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)
将代码行最后无效的空格标红

```
,空格    去掉多余空格
```

#### [dhruvasagar/vim-prosession](https://github.com/dhruvasagar/vim-prosession)
保存当前打开文件、slpit窗口、buffer的状态，下次在该目录下运行`vim`的时候自动还原


#### [Valloric/MatchTagAlways](https://github.com/Valloric/MatchTagAlways)
高亮显示匹配的标签

![matchtagalways](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/matchtagalways.gif)

#### [szw/vim-maximizer](https://github.com/szw/vim-maximizer)
最大化当前窗口\返回之前状态切换，在多个split窗口的非常有用

```
tab    # 快捷键设置为tab
```

#### [Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)
跳转到任意位置

```
空格  搜索两个字符，快速跳转
/    替代vim默认的搜索功能，如果不喜欢可以去除
```

![easy_motion](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/easy-motion.gif)

#### [vim-scripts/matchit.zip](https://github.com/vim-scripts/matchit.zip)
快速匹配() [] {} 等

   `%` 匹配标签，不只是单个的字符，还可以匹配单词，如html标签

#### [gcmt/wildfire.vim](https://github.com/gcmt/wildfire.vim)
快速选取代码块

![wildfire](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/wildfire.gif)

#### [alvan/vim-closetag](https://github.com/alvan/vim-closetag)
自动关闭html, xml标签

![closetag](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/CloseTag.gif)


#### [scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)
快速注释工具
```
shift+v 选择要注释的行
,cc  注释单行或者选中行
,cm  多行注释
,cu  解开注释
,ci  在注释和取消注释之间切换
```
![nerdcomment](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/nerdcomment.gif)


#### [tpope/vim-surround](https://github.com/tpope/vim-surround)
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


#### [tpope/vim-repeat](https://github.com/tpope/vim-repeat)
重复上一次命令
```
 . # 快捷键
```

#### [terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
多光标操作
```
,n  开始选择
,x  跳过当前
,p  返回选择
```
![multicursor](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/multicursor.gif)


#### [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
git整合

#### [moll/vim-bbye](https://github.com/moll/vim-bbye)
```
qq 删除当前buff
```

#### [vim-scripts/BufOnly.vim](https://github.com/vim-scripts/BufOnly.vim)
```
qo 关闭所有buff，当前除外
```

#### [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
支持.editorconfig文件

#### Inspired by:
1. [k-vim](https://github.com/wklken/k-vim)
2. [spf13-vim](https://github.com/spf13/spf13-vim)
3. [coc.nvim](https://github.com/neoclide/coc.nvim)
