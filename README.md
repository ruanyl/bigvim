bigvim
======================

Inspired by [k-vim](https://github.com/wklken/k-vim), but more front-end stuffs

### 配置步骤

1. clone到本地任意目录

        git clone https://github.com/ruanyl/bigvim.git

2. 安装依赖包

        sudo apt-get install ctags
        sudo apt-get install python-pip
        sudo apt-get install build-essential cmake python-dev  #编译YCM自动补全插件依赖
        brew install ctags     (mac用户)

3. 安装Nodejs
        nodejs.org

4. 安装插件

        cd bigvim/

        sh -x install.sh

        install.sh
        本质上做的事情
        1.将vimrc/vim文件夹软链接到$HOME，编程系统vim配置
        2.git clone安装vundle（clone到bundle目录下）
        3.通过vundle安装其他所有插件（相当于进入vimrc, 命令行执行:BundleInstall）,从github全部搞到本地
        4.安装必须的nodejs包

5. 可能遇到的问题:

   * 相对行号

   vimrc中配置,如果不习惯,可以去掉,[相关参考](http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/)

   * 配置主题

   到vimrc中修改colortheme,可以使用molokai(用惯sublimetext2的童鞋很熟悉)

   默认配置的是[solarized dark主题](https://github.com/altercation/vim-colors-solarized)

   想要修改终端配色为solarized可以参考 [这里](https://github.com/sigurdga/gnome-terminal-colors-solarized)

   * Powerline美化字体

   推荐[Monaco for Powerline](https://gist.github.com/ruanyl/ea38de37683951c20bf5/raw/5fa73caa4af86285f11539a6b4b6c26cfca2c04b/Monaco%20for%20Powerline.otf) 或者去[Lokaltog/powerline-fonts](https://github.com/Lokaltog/powerline-fonts) 自行寻找


### 其他

5. 安装/卸载/更新插件：

   可能发现打开vim很慢，可能是插件有点多了，这个配置插件全开

   去掉某些自己用不到的插件: 编辑vimrc，注释掉插件对应Bundle行即可(加一个双引号),保存退出即可

        "Bundle 'scrooloose/syntastic'

   如果想从物理上清除（删除插件文件），注释保存后再次进入vim

   命令行模式，执行:

        :BundleClean

   如果要安装新插件，在vimrc中加入bundle，然后执行

        :BundleInstall

   更新插件

        :BundleUpdate

6. 给mac用户

   安装[homebrew](http://brew.sh/)

   使用brew install vim

7. 冲突和问题排查

   插件很多，并且其默认快捷键或者配置可能发生冲突

   当加入新插件发现有冲突或者展现有问题

   排除法进行排查：注掉所有插件或配置，然后二分法逐一恢复，可以定位到出现问题的插件或配置

-------------

### 截图

solarized主题

![solarized](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/solarized.png) 我的终端颜色显示不对，不过这个色调也很舒服

molokai主题

![molokai](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/molokai.png)

-------------

### 自定义快捷键说明

    F1  关掉，防止跳出帮助
    F2  set nu/nonu
    F3  set list/nolist
    F4  set wrap/nowrap
    F5  set paste/nopaste
    F6  syntax on/off
    空格 /开启查找
    Y   =y$   复制到行尾
    w!!  以sudo的权限保存
    t    新起一行，下面，不进入插入模式
    T    新起一行，上面
    ,sa   全选(select all)
    ctrl + jkhl 进行上下左右窗口跳转,不需要ctrl+w+jkhl

    ,y 展示历史剪贴板
    ,yc 清空
    yy/dd -> p -> ctrl+p可以替换非最近一次剪贴内容

    ,f 开启文件搜索 ctrlp
    ,/ 去除匹配高亮

    当打开多个Buffer时：
    映射：' :b，输入数字，:b3快速切换到第三个Tab
    qq 关闭当前Buffer
    qo 关闭除当前buffer之外的所有buffer
    m 在Buffer之间顺序切换
    M 在Buffer之间逆序切换

--------------------

### 插件及其快捷键说明

##### 插件管理

1. ####[gmarik/vundle](https://github.com/gmarik/vundle)

    必装,用于管理所有插件

    命令行模式下管理命令:

        :BundleInstall     install
        :BundleInstall!    update
        :BundleClean       remove plugin not in list


##### 导航及搜索

1. ####[scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

   必装,开启目录树导航

            ,e  打开 关闭树形目录结构

            m   根据提示执行新建文件，目录，拷贝等操作

            在nerdtree窗口常用操作：(小写当前，大写root)
            x.......Close the current nodes parent收起当前目录树
            R.......Recursively refresh the current root刷新根目录树
            r.......Recursively refresh the current directory刷新当前目录
            P.......Jump to the root node
            p.......Jump to current nodes parent
            K.......Jump up inside directories at the current tree depth  到同目录第一个节点
            J.......Jump down inside directories at the current tree depth 最后一个节点
            o.......Open files, directories and bookmarks
            i.......Open selected file in a split window上下分屏
            s.......Open selected file in a new vsplit左右分屏
   演示

   ![thenerdtree](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/nerdtree.gif)

2. ####[majutsushi/tagbar](https://github.com/majutsushi/tagbar)

        <F9> 打开

   演示

   ![tagbar](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/tagbar.gif)

3. ####[kien/ctrlp.vim](https://github.com/hdima/python-syntax)

   文件搜索,ack/Command-T需要依赖于外部包,不喜欢有太多依赖的,除非十分强大, 具体 [文档](http://kien.github.io/ctrlp.vim/)

        ,f  默认查找 最近使用的+文件搜索+buffer
        ,m  相当于mru功能，most recently used
        ,b  查找buffer

        ctrl + j/k 进行上下移动 或者小键盘方向键

   演示

   ![ctrlp](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/ctrlp.gif)

4. ####[tacahiroy/ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)

   CtrlP插件，类似go to definition的功能

        ,fu 打开搜索

   演示

   ![ctrlp-funky](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/ctrlp-funky.gif)

##### 显示增强

    被动技能,无快捷键

1. ####[bling/vim-airline](https://github.com/bling/vim-airline)

   ![vim-airline](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/vim-airline.png)

2. ####[gorodinskiy/vim-coloresque](https://github.com/gorodinskiy/vim-coloresque)

   高亮显示文档中颜色代码

   ![vim-coloresque](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/vim-colorsque.png)

3. ####[bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)

   将代码行最后无效的空格标红

        ,空格    去掉当前行末尾空格

4. ####[altercation/vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)

   经典主题, 但是颜色需要终端导入色彩方案，我的颜色显示不对，但是看着还是舒服，就那样了。。

5. ####[tomasr/molokai](https://github.com/tomasr/molokai)

   另外一个经典主题

##### 快速移动

    主动技能,需要快捷键

1. ####[Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)

   跳转到任意位置

        s  查找2个字符，例如想要跳到某个方法，只需输入该方法前2个字符，就能跳转到该位置
        ,, + f  向后查找1个字符
        /  替代vim默认的搜索功能，如果不喜欢可以去除

   ![easy_motion](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/easy-motion.gif)

2. ####[Valloric/MatchTagAlways](https://github.com/Valloric/MatchTagAlways)

   高亮显示匹配的标签

   ![matchtagalways](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/matchtagalways.gif)

3. ####[vim-scripts/matchit.zip](https://github.com/vim-scripts/matchit.zip)

   % 匹配标签，不只是单个的字符，还可以匹配单词，如html标签

##### 快速编辑

1. ###[gcmt/wildfire.vim](https://github.com/gcmt/wildfire.vim)

   快速选取代码块

   ![wildfire](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/wildfire.gif)

2. ###[alvan/vim-closetag](https://github.com/alvan/vim-closetag)

    自动关闭html, xml标签

    ![closetag](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/CloseTag.gif)

3. ###[drmingdrmer/xptemplate](https://github.com/drmingdrmer/xptemplate)

    代码片段工具

        <C-\> 触发
        
    ![xptemplate](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/xptemplate.gif)

4. ####[scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)


        shift+v 选择要注释的行
        ,cc  注释单行或者选中行
        ,cm  多行注释
        ,cu  解开注释
        ,ci  在注释和取消注释之间切换

    ![nerdcomment](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/nerdcomment.gif)

5. ####[tpope/vim-surround](https://github.com/tpope/vim-surround)

   配合vim-repeat进行增强,'.'可以重复命令

        ysiw"
        Hello -> "Hello"
        cs"'
        "Hello world!" -> 'Hello world!'
        ds"
        "Hello world!" -> Hello world!

   ![surround](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/surround.gif)

6. ###[tpope/vim-repeat](https://github.com/tpope/vim-repeat)

    重复命令

         .  重复上一次命令

7. ### [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)

    自动补全：(), [], {}, <>

8. ###[godlygeek/tabular](https://github.com/godlygeek/tabular)

    代码按=或者: 对齐

        ,a=   按等号对齐
        ,a:   安冒号对齐

    ![tabular](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/tabular.gif)

9. ###[terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

    多光标操作

        ,n  开始选择
        ,x  跳过当前
        ,p  返回选择

    ![multicursor](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/multicursor.gif)

10. ###[mattn/emmet-vim](https://github.com/mattn/emmet-vim)

    快速书写html

        <C-y>,  触发

    ![emmet](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/emmet.gif)

#### 自动补全

1. ###[davidhalter/jedi-vim](https://github.com/davidhalter/jedi-vim)

   Python 自动补全以及快速跳转，详情请见其Github主页

2. ###[Shougo/neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim)

    自动补全，演示请见项目主页


#### 语法检查

1. ###[scrooloose/syntastic](https://github.com/scrooloose/syntastic)

   建议安装，静态语法及风格检查,支持多种语言

   修改了下标记一列的背景色,原有的背景色在solarized下太难看了…..

   演示

   ![syntastic](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/syntastic.png)

2. ###[kevinw/pyflakes-vim](https://github.com/kevinw/pyflakes-vim)

   Python语法检查


#### 语法高亮

1. ###[python-syntax](https://github.com/hdima/python-syntax)

2. ###[tpope/vim-markdown](https://github.com/tpope/vim-markdown)

   markdown语法高亮

3. ###[pangloss/vim-javascript](https://github.com/pangloss/vim-javascript)

4. ###[hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax)

5. ###[kchmck/vim-coffee-script](https://github.com/kchmck/vim-coffee-script)


#### 语言相关

1. ###[heavenshell/vim-jsdoc](https://github.com/heavenshell/vim-jsdoc)

		,,d  光标定位在方法上面，自动生成js doc

2. ###[marijnh/tern_for_vim](https://github.com/marijnh/tern_for_vim)

	前端开发需要，支持jquery自动补全，还有其它插件支持

        ,d  go to definition功能

3. ###[spf13/PIV](https://github.com/spf13/PIV)

	PHP手册

    	K 大写的K，打开光标下方法的PHP Doc

4. ###[fatih/vim-go](https://github.com/fatih/vim-go)

	go语言支持

#### 其他

1. [mattn/gist-vim](https://github.com/mattn/gist-vim)

		:Gist  github gist, 支持查看自己和别人的gist，以及编辑修改新建gist

2. ####[sjl/gundo.vim](https://github.com/sjl/gundo.vim)

   历史操作记录

        ,h  查看文件编辑历史

	![gundo](https://raw.githubusercontent.com/ruanyl/ruanyl.github.io/master/images/gundo.png)

3. ####[Chiel92/vim-autoformat](https://github.com/Chiel92/vim-autoformat)

	格式化js,json,html,css,scss

        ,,f  自动格式化

4. ###[thinca/vim-quickrun](https://github.com/thinca/vim-quickrun)

		,r  运行当前文件，如运行javascript

5. ###[mattn/webapi-vim](https://github.com/mattn/webapi-vim)

6. ###[tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)

    git 支持

7. ###[maxbrunsfeld/vim-yankstack](https://github.com/maxbrunsfeld/vim-yankstack)

	剪切板历史
    	zn
        zp

8. ###[moll/vim-bbye](https://github.com/moll/vim-bbye)

		qq 删除当前buff

9. ###[vim-scripts/BufOnly.vim](https://github.com/vim-scripts/BufOnly.vim)

		qo 关闭所有buff，当前除外

10. ###[editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)

	支持.editorconfig文件
