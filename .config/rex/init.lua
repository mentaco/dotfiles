-- Prefix: Ctrl+Q

rex.mode("tmux", { exclusive = true })

rex.bind("ctrl+q", "client.mode.enter", {
	name = "tmux",
	once = true,
})

-- ========================================
-- Pane
-- ========================================

-- 上下分割
rex.bind("tmux/s", "pane.split.down")

-- 左右分割
rex.bind("tmux/v", "pane.split.right")

-- 移動
rex.bind("tmux/h", "pane.focus.left")

rex.bind("tmux/j", "pane.focus.down")

rex.bind("tmux/k", "pane.focus.up")

rex.bind("tmux/l", "pane.focus.right")

-- ペインのリサイズ
rex.bind("tmux/shift+h", "pane.resize", {
	amount = 3,
})

rex.bind("tmux/shift+j", "pane.resize", {
	direction = "down",
	amount = 3,
})

rex.bind("tmux/shift+k", "pane.resize", {
	direction = "up",
	amount = 3,
})

rex.bind("tmux/shift+l", "pane.resize", {
	direction = "right",
	amount = 3,
})

-- ========================================
-- Window / Tab
-- ========================================

rex.bind("tmux/c", "client.tab.new")

-- タブ移動
rex.bind("tmux/n", "client.tab.next")
rex.bind("tmux/p", "client.tab.previous")

-- タブの並び替え
rex.bind("tmux/shift+p", "client.tab.move.backward")
rex.bind("tmux/shift+n", "client.tab.move.forward")

-- ========================================
-- Resize Mode（連続リサイズ用）
-- ========================================

rex.mode("resize", { exclusive = true })

-- Prefix + r でリサイズモードへ
rex.bind("tmux/r", "client.mode.enter", {
	name = "resize",
})

rex.bind("resize/shift+h", "pane.resize", {
	direction = "left",
	amount = 3,
})

rex.bind("resize/shift+j", "pane.resize", {
	direction = "down",
	amount = 3,
})

rex.bind("resize/shift+k", "pane.resize", {
	direction = "up",
	amount = 3,
})

rex.bind("resize/shift+l", "pane.resize", {
	direction = "right",
	amount = 3,
})

-- リサイズモードを終了
rex.bind("resize/escape", "client.mode.exit")
