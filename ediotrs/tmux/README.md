# 安装
```shell
brew install tmux
配置文件：
	～/.tmux.conf
```
# 命令
```shell
tmux [command]     # 运行一条命令
                     # 如果单独使用 'tmux' 而不指定某个命令，将会建立一个新的会话

    new              # 创建一个新的会话
	    -s "Session"    # 创建一个会话，并命名为“Session”
	    -n "Window"     # 创建一个窗口，并命名为“Window”

    attach           # 连接到上一次的会话（如果可用）
	    -t "#"          # 连接到指定的会话
	    -d              # 断开其他客户端的会话

	ls               # 列出打开的会话
	    -a              # 列出所有打开的会话

    lsw              # 列出窗口
	    -a              # 列出所有窗口
	    -s              # 列出会话中的所有窗口

    kill-window      # 关闭当前窗口
	    -t "#"          # 关闭指定的窗口
	    -a              # 关闭所有窗口
	    -a -t "#"       # 关闭除指定窗口以外的所有窗口

    kill-session     # 关闭当前会话
	    -t "#"          # 关闭指定的会话
	    -a              # 关闭所有会话
	    -a -t "#"       # 关闭除指定会话以外的所有会话
	source ~/.tmux.conf       # 重新加载配置文件
```
## 前缀
ctrl + b +
### 分屏
	% 竖分屏  
	" 横分屏
	o 顺时针切换
	; 切换上一个
	方向键  也可以切换
	C-o 将窗口位置进行转换
	x 关闭
	(不加C-b)C-d  关闭
### window
	c 在同一个会话里面创建一个window 
	n 下窗格切换  
	p 上窗格切换
	w 查找会话里面的window
	, 对window进行重命名  
	s 列出所有session
	& 关闭当前窗口
	？查找，相当于help
# 插件
```shell
tmux配置：
	～/.tmux
安装 Tmux Plugin Manager
	1、git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	2、将配置加到配置文件，重载配置文件
	3、在配置文件中添加 set ... 即可
	4、prefix + I 安装，安装完会有提示
```
## 主题
```shell
https://draculatheme.com/tmux
使用：
	set -g @plugin 'dracula/tmux'
	可额外设置状态栏显示
```
## 保存窗口
```shell
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
-   `prefix + Ctrl-s` - save
-   `prefix + Ctrl-r` - restore
```
## 命令
```shell
prefix + I  安装
prefix + U  更新
prefix + alt + u 卸载，或者 ~/.tmux/plugins/ 直接删除插件
```