[New solution](https://github.com/lervag/vimtex/issues/1576#issuecomment-578488153)

***backward search*** (Archived)

Skim Perference => PDF-TeX Sync Support

- neovim-remote
  - Install with brew's pip3 and `pip3 install neovim-remote`.
  - Add `let g:vimtex_compiler_progname='nvr'` to your `init.vim`.
  - Download [skim2vir](https://raw.githubusercontent.com/znculee/dotfiles/master/bin/skim2vir) and `chmod +x /path/to/skim2vir`.
  - Set in Skim:

    --        | --
    Preset    | Custom
    Command   | /path/to/skim2vir
    Arguments | "%file" %line
  - Run neovim-remote by [vir](https://raw.githubusercontent.com/znculee/dotfiles/master/bin/vir) under the project's root path.
  - Hold down the Shift and Apple key and click on a point in the PDF document.
