# 3. Installing rbenv and Ruby on Linux

Last Updated: 26 Nov 2018, Credit to: [The Odin Project](https://www.theodinproject.com/courses/web-development-101/lessons/installing-ruby?ref=lnav)

Update:

```bash
sudo apt-get update
sudo apt-get upgrade
```

Install misc packages:

```bash
sudo apt-get install curl git nodejs gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev
```

Install rbenv: (last command closes your terminal deliberately)

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exit
```

Get ruby plugin:

```bash
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
```

Install ruby: (2.5.3 was the current version as of this writing)

```bash
rbenv install 2.5.3 --verbose
```

Set Ruby version and verify it is installed:

```bash
rbenv global 2.5.3
ruby -v
```

Done!
