local M = {}

function M.setup(capabilities)
	-- Basic jdtls config (for simple Java projects)
	vim.lsp.config("jdtls", {
		capabilities = capabilities,
		settings = {
			java = {
				signatureHelp = { enabled = true },
				contentProvider = { preferred = "fernflower" },
				completion = {
					favoriteStaticMembers = {
						"org.junit.Assert.*",
						"org.junit.Assume.*",
						"org.junit.jupiter.api.Assertions.*",
						"org.junit.jupiter.api.Assumptions.*",
						"org.junit.jupiter.api.DynamicTest.*",
						"org.mockito.Mockito.*",
					},
					importOrder = {
						"java",
						"javax",
						"com",
						"org",
					},
				},
				sources = {
					organizeImports = {
						starThreshold = 9999,
						staticStarThreshold = 9999,
					},
				},
				codeGeneration = {
					toString = {
						template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
					},
					useBlocks = true,
				},
				configuration = {
					runtimes = {
						-- Add your Java installations here
						-- {
						--   name = "JavaSE-17",
						--   path = "/usr/lib/jvm/java-17-openjdk",
						-- },
					},
				},
			},
		},
	})

	-- Java compile and run keymaps
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "java",
		callback = function()
			local buf = vim.api.nvim_get_current_buf()

			-- Compile current file
			vim.keymap.set("n", "<leader>jc", function()
				local file = vim.fn.expand("%:p")
				local cmd = string.format('javac "%s"', file)
				vim.cmd("write")
				vim.fn.execute("!" .. cmd)
			end, { buffer = buf, desc = "Compile Java file" })

			-- Compile and run current file
			vim.keymap.set("n", "<leader>jr", function()
				local file = vim.fn.expand("%:p")
				local filename = vim.fn.expand("%:t:r") -- filename without extension
				local dir = vim.fn.expand("%:p:h")

				vim.cmd("write")

				-- Compile
				local compile_cmd = string.format('cd "%s" && javac "%s"', dir, file)
				local compile_result = vim.fn.system(compile_cmd)

				if vim.v.shell_error ~= 0 then
					print("Compilation failed!")
					print(compile_result)
					return
				end

				-- Run in a new terminal buffer
				vim.cmd("botright 7split")
				vim.cmd('terminal cd "' .. dir .. '" && java ' .. filename)
				vim.cmd("startinsert")
			end, { buffer = buf, desc = "Compile and run Java" })

			-- Run (assumes already compiled)
			vim.keymap.set("n", "<leader>jR", function()
				local filename = vim.fn.expand("%:t:r")
				local dir = vim.fn.expand("%:p:h")

				vim.cmd("botright 7split")
				vim.cmd('terminal cd "' .. dir .. '" && java ' .. filename)
				vim.cmd("startinsert")
			end, { buffer = buf, desc = "Run Java (no compile)" })

			-- Maven commands (if pom.xml exists in current or parent dirs)
			local function find_maven_root()
				local current = vim.fn.expand("%:p:h")
				while current ~= "/" do
					if vim.fn.filereadable(current .. "/pom.xml") == 1 then
						return current
					end
					current = vim.fn.fnamemodify(current, ":h")
				end
				return nil
			end

			local maven_root = find_maven_root()
			if maven_root then
				vim.keymap.set("n", "<leader>jm", function()
					vim.cmd('!cd "' .. maven_root .. '" && mvn compile')
				end, { buffer = buf, desc = "Maven compile" })

				vim.keymap.set("n", "<leader>jt", function()
					vim.cmd('!cd "' .. maven_root .. '" && mvn test')
				end, { buffer = buf, desc = "Maven test" })

				vim.keymap.set("n", "<leader>jp", function()
					vim.cmd('!cd "' .. maven_root .. '" && mvn package')
				end, { buffer = buf, desc = "Maven package" })

				vim.keymap.set("n", "<leader>jx", function()
					vim.cmd("botright 7split")
					vim.cmd('terminal cd "' .. maven_root .. '" && mvn exec:java')
					vim.cmd("startinsert")
				end, { buffer = buf, desc = "Maven run" })
			end
		end,
	})
end

return M
