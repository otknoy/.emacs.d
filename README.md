# .emacs.d/

```
$ emacs --batch -f batch-byte-compile init.el
```

- https://github.com/conao3/leaf.el
- https://github.com/emacs-lsp/lsp-mode

## パッケージ管理（straight.el）

- 更新: Emacs で `M-x straight-pull-all` を実行する。
- ロックファイル作成: `M-x straight-freeze-versions` を実行し、生成された `straight/versions/default.el` をコミットする。
- 再現: 設定とロックファイルを配置して Emacs を起動する。既存環境をロックファイルの版に戻す場合は `M-x straight-thaw-versions` を実行する。

## LSP

https://github.com/emacs-lsp/lsp-mode

- [Go (gopls)](https://emacs-lsp.github.io/lsp-mode/page/lsp-gopls/)
- [Python](https://emacs-lsp.github.io/lsp-mode/page/lsp-pyls/)
- [JavaScript/TypeScript (RECOMMENDED)](https://emacs-lsp.github.io/lsp-mode/page/lsp-typescript/)
- [YAML](https://emacs-lsp.github.io/lsp-mode/page/lsp-yaml/)

## Go

```sh
$ go install golang.org/x/tools/gopls@latest
$ go install github.com/nametake/golangci-lint-langserver@latest

$ go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest
$ go install golang.org/x/tools/cmd/goimports@latest
$ go install github.com/rinchsan/gosimports/cmd/gosimports@latest
$ go install github.com/cweill/gotests/gotests@latest
```

## Misc

```sh
$ go install github.com/google/yamlfmt/cmd/yamlfmt@latest
```
