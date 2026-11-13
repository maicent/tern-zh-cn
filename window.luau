-- 中文汉化插件：以中文标题注册内置命令的包装，让命令面板可以用中文搜索。
-- 每个命令只调用对应的内置命令，不改动其行为。

local commands = {
	-- 标签页
	{ id = "new_tab", title = "新建标签页", group = "标签页" },
	{ id = "close_tab", title = "关闭标签页", group = "标签页" },
	{ id = "next_tab", title = "下一个标签页", group = "标签页" },
	{ id = "previous_tab", title = "上一个标签页", group = "标签页" },
	{ id = "rename_tab", title = "重命名标签页…", group = "标签页" },
	{ id = "move_tab_right", title = "标签页右移", group = "标签页" },
	{ id = "move_tab_left", title = "标签页左移", group = "标签页" },
	{ id = "show_previous_tab", title = "显示上一个标签页", group = "标签页" },
	{ id = "tidy_tab_title", title = "整理标签页标题", group = "标签页" },

	-- 会话
	{ id = "switch_session", title = "切换会话…", group = "会话" },
	{ id = "new_session", title = "新建会话", group = "会话" },
	{ id = "rename_session", title = "重命名会话…", group = "会话" },
	{ id = "lock_session", title = "锁定会话", group = "会话" },
	{ id = "close_session", title = "关闭会话", group = "会话" },

	-- 分屏与块
	{ id = "split_right", title = "向右拆分", group = "分屏与块" },
	{ id = "split_down", title = "向下拆分", group = "分屏与块" },
	{ id = "close_pane", title = "关闭块", group = "分屏与块" },
	{ id = "zoom", title = "缩放块", group = "分屏与块" },
	{ id = "equalize", title = "均分分屏", group = "分屏与块" },
	{ id = "next_pane", title = "下一个块", group = "分屏与块" },
	{ id = "previous_pane", title = "上一个块", group = "分屏与块" },
	{ id = "move_pane_left", target = "move_pane:left", title = "块左移", group = "分屏与块" },
	{ id = "move_pane_right", target = "move_pane:right", title = "块右移", group = "分屏与块" },
	{ id = "move_pane_up", target = "move_pane:up", title = "块上移", group = "分屏与块" },
	{ id = "move_pane_down", target = "move_pane:down", title = "块下移", group = "分屏与块" },
	{ id = "new_shell_block", title = "新建 Shell 块", group = "分屏与块", icon = "terminal" },
	{ id = "new_agent_block", title = "新建智能体块", group = "分屏与块", icon = "sparkle" },
	{ id = "new_browser_block", title = "新建浏览器块…", group = "分屏与块" },
	{ id = "new_git_block", title = "新建 Git 块", group = "分屏与块", icon = "branch" },
	{ id = "new_board_block", title = "新建看板块", group = "分屏与块" },
	{ id = "new_notebook", title = "新建笔记本", group = "分屏与块" },
	{ id = "new_database", title = "新建数据库…", group = "分屏与块" },

	-- 终端
	{ id = "copy", title = "复制", group = "终端" },
	{ id = "paste", title = "粘贴", group = "终端" },
	{ id = "paste_selection", title = "粘贴选区", group = "终端" },
	{ id = "find", title = "滚动缓冲区查找", group = "终端" },
	{ id = "scroll_top", title = "滚动到顶部", group = "终端" },
	{ id = "scroll_bottom", title = "滚动到底部", group = "终端" },
	{ id = "clear", title = "清屏并清滚动缓冲区", group = "终端" },
	{ id = "restart", title = "重启 Shell", group = "终端" },
	{ id = "open_scrollback", title = "在编辑器中打开滚动缓冲区", group = "终端" },

	-- 文件
	{ id = "files", title = "显示/隐藏文件", group = "文件", icon = "file" },
	{ id = "focus_files", title = "聚焦文件", group = "文件", icon = "file" },
	{ id = "open_file", title = "打开文件…", group = "文件", icon = "file" },
	{ id = "open_folder", title = "打开文件夹…", group = "文件", icon = "file" },
	{ id = "reveal_active_file", title = "定位当前文件", group = "文件", icon = "file" },
	{ id = "files_toggle_hidden", title = "显示/隐藏隐藏文件", group = "文件", icon = "file" },

	-- 外观
	{ id = "theme", title = "更改主题…", group = "外观" },
	{ id = "appearance_system", target = "appearance:system", title = "跟随系统外观", group = "外观" },
	{ id = "appearance_light", target = "appearance:light", title = "浅色外观", group = "外观" },
	{ id = "appearance_dark", target = "appearance:dark", title = "深色外观", group = "外观" },
	{ id = "increase_font_size", title = "增大字号", group = "外观" },
	{ id = "decrease_font_size", title = "减小字号", group = "外观" },
	{ id = "reset_font_size", title = "重置字号", group = "外观" },
	{ id = "next_layout", title = "下一个布局", group = "外观" },
	-- 0.9.17 起状态栏改叫控件栏，status_bar 命令已移除，改用它的继任者。
	{ id = "edit_widgets", title = "编辑控件栏…", group = "外观" },

	-- 设置
	{ id = "preferences", title = "设置…", group = "设置" },
	{ id = "open_config", title = "打开 settings.json", group = "设置" },
	{ id = "reload_config", title = "重新加载设置", group = "设置" },
	{ id = "reload_plugins", title = "重新加载插件", group = "设置" },
	{ id = "help", title = "帮助与文档", group = "设置" },
	{ id = "release_notes", title = "更新日志", group = "设置" },
	{ id = "screenshot", title = "截图", group = "设置" },
}

for _, c in ipairs(commands) do
	local target = c.target or c.id
	tern.command({
		id = c.id,
		title = c.title,
		group = c.group,
		icon = c.icon,
		run = function(cx)
			cx:command(target)
		end,
	})
end
