#!/usr/bin/env python3
"""Sort lazy.nvim plugin specs in lua/plugins.lua by category and repository.

Run from any directory. Add new repositories to CATEGORIES before sorting.
The parser deliberately rejects unfamiliar top-level formatting rather than
risking rewriting Lua it does not understand.
"""

from pathlib import Path
import re
import sys

PLUGIN_FILE = Path(__file__).resolve().parent.parent / "lua" / "plugins.lua"
CATEGORIES = {
    "AI": ["copilotlsp-nvim/copilot-lsp", "milanglacier/minuet-ai.nvim"],
    "Completion": ["saghen/blink.cmp"],
    "Editing": [
        "jdhao/better-escape.vim",
        "numToStr/Comment.nvim",
        "tpope/vim-surround",
        "windwp/nvim-autopairs",
    ],
    "File navigation": ["nvim-neo-tree/neo-tree.nvim", "nvim-telescope/telescope.nvim"],
    "Git": ["lewis6991/gitsigns.nvim", "tpope/vim-fugitive"],
    "Languages": [
        "edgedb/edgedb-vim",
        "mrcjkb/haskell-tools.nvim",
        "mrcjkb/rustaceanvim",
        "p00f/clangd_extensions.nvim",
        "purescript-contrib/purescript-vim",
        "scalameta/nvim-metals",
    ],
    "LSP": [
        "antosha417/nvim-lsp-file-operations",
        "aznhe21/actions-preview.nvim",
        "elentok/format-on-save.nvim",
        "neovim/nvim-lspconfig",
        "pmizio/typescript-tools.nvim",
        "smjonas/inc-rename.nvim",
    ],
    "Themes": [
        "0x706b/crumbling.nvim",
        "0x706b/monotone.nvim",
        "0x706b/parchment.nvim",
        "0x706b/zenburn.nvim",
        "AlexvZyl/nordic.nvim",
        "baliestri/aura-theme",
        "catppuccin/nvim",
        "ellisonleao/gruvbox.nvim",
        "lifepillar/vim-solarized8",
        "mcchrish/zenbones.nvim",
        "Mofiqul/dracula.nvim",
        "projekt0n/github-nvim-theme",
        "ramojus/mellifluous.nvim",
        "rebelot/kanagawa.nvim",
        "rktjmp/lush.nvim",
        "sainnhe/everforest",
        "sainnhe/sonokai",
        "vague2k/vague.nvim",
    ],
    "Treesitter": [
        "luckasRanarison/tailwind-tools.nvim",
        "nvim-treesitter/nvim-treesitter",
        "windwp/nvim-ts-autotag",
    ],
    "UI": [
        "folke/drop.nvim",
        "folke/noice.nvim",
        "glepnir/galaxyline.nvim",
        "lukas-reineke/indent-blankline.nvim",
        "mvllow/modes.nvim",
        "norcalli/nvim-colorizer.lua",
        "nvim-tree/nvim-web-devicons",
        "petertriho/nvim-scrollbar",
        "romgrk/barbar.nvim",
        "ryanoasis/vim-devicons",
        "swaits/zellij-nav.nvim",
    ],
}

REPO = re.compile(r"['\"]([\w.-]+/[\w.-]+)['\"]")


def sort_plugins(text):
    lines = text.splitlines(keepends=True)
    start = next(
        i for i, line in enumerate(lines) if line.strip() == 'require("lazy").setup({'
    )
    end = next(i for i in range(start + 1, len(lines)) if lines[i].rstrip("\n") == "})")
    lookup = {}
    for category, repositories in CATEGORIES.items():
        for repo in repositories:
            if repo in lookup:
                raise ValueError(f"duplicate mapping: {repo}")
            lookup[repo] = category

    entries = []
    i = start + 1
    while i < end:
        line = lines[i]
        stripped = line.strip()
        if not stripped or (
            stripped.startswith("-- ")
            and stripped[3:] in CATEGORIES
        ):
            i += 1
            continue
        first = i
        if line.startswith("  -- {"):
            i += 1
            while i < end and not re.match(r"^  -- },?\s*$", lines[i]):
                i += 1
            if i == end:
                raise ValueError(f"unterminated commented plugin at line {first + 1}")
            i += 1
        elif line.startswith("  {"):
            if not REPO.search(line):
                i += 1
                while i < end and not re.match(r"^  },?\s*$", lines[i]):
                    i += 1
                if i == end:
                    raise ValueError(f"unterminated plugin at line {first + 1}")
            i += 1
        elif re.match(r'^  [\'"]', line):
            i += 1
        else:
            raise ValueError(
                f"unexpected top-level content at line {i + 1}: {stripped}"
            )
        block = "".join(lines[first:i]).rstrip("\n")
        match = REPO.search(block)
        if not match:
            raise ValueError(f"no repository found at line {first + 1}")
        repo = match.group(1)
        if repo not in lookup:
            raise ValueError(f"add {repo} to CATEGORIES (line {first + 1})")
        entries.append((lookup[repo], repo, block))

    entries.sort(key=lambda item: (item[0].casefold(), item[1].casefold()))
    sections = []
    for category, _, block in entries:
        if not sections or sections[-1][0] != category:
            sections.append((category, []))
        sections[-1][1].append(block)
    body = "\n\n".join(
        "  -- " + category + "\n\n" + "\n\n".join(blocks)
        for category, blocks in sections
    )
    return "".join(lines[: start + 1]) + body + "\n" + "".join(lines[end:])


def main():
    try:
        original = PLUGIN_FILE.read_text(encoding="utf-8")
        result = sort_plugins(original)
        if result != original:
            PLUGIN_FILE.write_text(result, encoding="utf-8")
    except (ValueError, StopIteration, OSError) as error:
        print(f"Cannot sort {PLUGIN_FILE}: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
