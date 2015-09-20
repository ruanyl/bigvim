bigvim
======================

Inspired by [k-vim](https://github.com/wklken/k-vim), but more front-end stuffs

### 配置步骤

> 注意，该配置需要vim7.4.x

1. clone到本地任意目录

	```
	git clone https://github.com/ruanyl/bigvim.git
	```

2. 安装Nodejs，建议使用nvm

	```
    brew install nvm
	nvm install v0.xx.x
    ```

3. 安装相关node module

	```
    npm install -g eslint js-beautify
    ```

4. 安装插件

	```
    cd bigvim/
    sh -x install.sh
    install.sh
	```

5. 可能遇到的问题:

   界面显示乱码

   * 需要安装Powerline美化字体

   推荐[Monaco for Powerline](https://gist.github.com/ruanyl/ea38de37683951c20bf5/raw/5fa73caa4af86285f11539a6b4b6c26cfca2c04b/Monaco%20for%20Powerline.otf) 或者去[Lokaltog/powerline-fonts](https://github.com/Lokaltog/powerline-fonts) 自行寻找


-------------

### 截图

solarized主题

![solarized](https://github.com/altercation/solarized/raw/master/img/solarized-vim.png)

molokai主题

![molokai](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/molokai.png)

-------------

### 自定义快捷键

    空格  开启查找(Easymotion模式)
    W    以sudo的权限保存
    ,sa  全选(select all)
    ctrl + jkhl 进行上下左右窗口跳转,不需要ctrl+w+jkhl
    ,f   开启文件搜索 ctrlp
    ,/   去除匹配高亮
    '    :b
    :b3  快速切换到number 3 buffer
    qq   关闭当前Buffer
    qo   关闭除当前buffer之外的所有buffer
    m    在Buffer之间顺序切换
    M    在Buffer之间逆序切换
    Tab  最大化当前split窗口/切换

> 更多地快捷键，请在vimrc中对应的插件查找


### 插件及其快捷键说明

##### 插件管理

1. ####[gmarik/vundle](https://github.com/gmarik/vundle)

    必装,用于管理所有插件

    命令行模式下管理命令:

        :BundleInstall     install
        :BundleUpdate      update
        :BundleClean       remove plugin not in list


##### 导航及搜索

1. ####[scrooloose/nerdtree](https://github.com/scrooloose/nerdtree)

	```
	,e
    ```

   ![thenerdtree](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/nerdtree.gif)

2. ####[majutsushi/tagbar](https://github.com/majutsushi/tagbar)

	```
	F9
    ```

3. ####[kien/ctrlp.vim](https://github.com/hdima/python-syntax)

        ,f  默认查找 最近使用的+文件搜索+buffer
        ,m  相当于mru功能，most recently used
        ,b  查找buffer

        ctrl + j/k 进行上下移动 或者小键盘方向键

   ![ctrlp](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/ctrlp.gif)

4. ####[tacahiroy/ctrlp-funky](https://github.com/tacahiroy/ctrlp-funky)

   CtrlP插件，类似go to definition的功能

        ,fu 打开搜索

   ![ctrlp-funky](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/ctrlp-funky.gif)

##### 显示增强

1. ####[bling/vim-airline](https://github.com/bling/vim-airline)

   ![vim-airline](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/vim-airline.png)

2. ####[gorodinskiy/vim-coloresque](https://github.com/gorodinskiy/vim-coloresque)

   高亮显示文档中颜色代码

   ![vim-coloresque](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/vim-colorsque.png)

3. ####[bronson/vim-trailing-whitespace](https://github.com/bronson/vim-trailing-whitespace)

   将代码行最后无效的空格标红

        ,空格    去掉多余空格


##### 快速移动

    主动技能,需要快捷键

1. ####[Lokaltog/vim-easymotion](https://github.com/Lokaltog/vim-easymotion)

   跳转到任意位置

        空格  搜索两个字符，快速跳转
        /    替代vim默认的搜索功能，如果不喜欢可以去除

   ![easy_motion](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/easy-motion.gif)

2. ####[Valloric/MatchTagAlways](https://github.com/Valloric/MatchTagAlways)

   高亮显示匹配的标签

   ![matchtagalways](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/matchtagalways.gif)

3. ####[vim-scripts/matchit.zip](https://github.com/vim-scripts/matchit.zip)

   % 匹配标签，不只是单个的字符，还可以匹配单词，如html标签

##### 快速编辑

1. ###[gcmt/wildfire.vim](https://github.com/gcmt/wildfire.vim)

   快速选取代码块

   ![wildfire](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/wildfire.gif)

2. ###[alvan/vim-closetag](https://github.com/alvan/vim-closetag)

    自动关闭html, xml标签

    ![closetag](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/CloseTag.gif)

3. ###[drmingdrmer/xptemplate](https://github.com/drmingdrmer/xptemplate)

    代码片段工具

        <C-\> 触发

    ![xptemplate](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/xptemplate.gif)

4. ####[scrooloose/nerdcommenter](https://github.com/scrooloose/nerdcommenter)


        shift+v 选择要注释的行
        ,cc  注释单行或者选中行
        ,cm  多行注释
        ,cu  解开注释
        ,ci  在注释和取消注释之间切换

    ![nerdcomment](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/nerdcomment.gif)

5. ####[tpope/vim-surround](https://github.com/tpope/vim-surround)

   配合vim-repeat进行增强,'.'可以重复命令

        ysiw"
        Hello -> "Hello"
        cs"'
        "Hello world!" -> 'Hello world!'
        ds"
        "Hello world!" -> Hello world!

   ![surround](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/surround.gif)

6. ###[tpope/vim-repeat](https://github.com/tpope/vim-repeat)

    重复命令

         .  重复上一次命令

7. ### [Raimondi/delimitMate](https://github.com/Raimondi/delimitMate)

    自动补全：(), [], {}, <>

8. ###[godlygeek/tabular](https://github.com/godlygeek/tabular)

    代码按=或者: 对齐

        ,a=   按等号对齐
        ,a:   安冒号对齐

    ![tabular](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/tabular.gif)

9. ###[terryma/vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

    多光标操作

        ,n  开始选择
        ,x  跳过当前
        ,p  返回选择

    ![multicursor](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/multicursor.gif)

10. ###[mattn/emmet-vim](https://github.com/mattn/emmet-vim)

    快速书写html

        <C-y>,  触发

    ![emmet](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/emmet.gif)

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

   ![syntastic](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/syntastic.png)

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


#### 其他

1. [mattn/gist-vim](https://github.com/mattn/gist-vim)

		:Gist  github gist, 支持查看自己和别人的gist，以及编辑修改新建gist

2. ####[sjl/gundo.vim](https://github.com/sjl/gundo.vim)

   历史操作记录

        ,h  查看文件编辑历史

	![gundo](https://raw.githubusercontent.com/ruanyl/bigvim/gh-pages/images/gundo.png)

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
