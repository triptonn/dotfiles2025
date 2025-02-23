return {
	{
		"Civitasv/cmake-tools.nvim",
		ft = { "c", "cpp", "cmake" },
		opts = {
			cmake_command = "cmake",
			cmake_build_directory = "build",
			cmake_generate_options = { "-DCMAEK_EXPORT_COMPILE_COMMANDS=1" },
			cmake_build_options = {},
		},
	},
	{
		"p00f/clangd_extensions.nvim",
		ft = { "c", "cpp" },
		opts = {
			inlay_hints = {
				inline = false,
			},
		},
	},
}
