# 6. Visual Studio Code

Last Updated: 27 Nov 2018

My favourite code editor.

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders
```

Install the [settings sync extension](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and use the gist:

```bash
d437298a643172027750781275d349c9
```

The extensions and settings will be automatically installed for you.

Now you need to increase the number of user watches to accomodate larger git projects (this will allocate up to 256mb)

```bash
sudo sh -c "echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf"
sudo sysctl -p
```