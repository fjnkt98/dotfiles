# dotfiles

自分用のVimコンフィグリポジトリ

## Usage

Ubuntu 18.04LTSでのみ動作確認済み

### Install Vim

Vimをインストールする．UbuntuにデフォルトでインストールされているVimはtinyなものなのでフルバージョンをインストールする．

```
$ sudo apt update
$ sudo apt install vim
```

### Clone This Repository

このリポジトリをホームディレクトリにクローンする．

```
$ cd ~/
$ git clone git@github.com:fjnkt98/dotfiles.git # Use SSH

$ git clone https://github.com/fjnkt98/dotfiles.git # Use HTTPS
```

### Add Symbolic-Link

`.vimrc`をシンボリックリンクで作成する．リポジトリ内の`link.sh`を実行することでシンボリックリンクを作成することが出来る．

```
$ cd ~/dotfiles
$ sh ./link.sh
```

### Launch Vim

Vimを実行してみる．

```
$ vim
```

### Install Plugins

Vimを実行し，セミコロンを押してコマンドモードにして`PlugInstall`を実行する．

```
:PlugInstall
```
