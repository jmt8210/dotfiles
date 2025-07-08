local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s(
		"useState",
		fmt("const [{}, set{setter}] = useState({})", {
			i(1, "state"),
			i(2, "initialValue"),
			setter = l(l._1:sub(1, 1):upper() .. l._1:sub(2, -1), 1),
		})
	),
	s("hi", t("Hello, world!")),
}
