local ok, toggleterm = pcall(require, "toggleterm")

if ok then toggleterm.setup({open_mapping = [[<Leader-\>]], direction = 'float'}) end
