# 6. Visual Studio Code

Last Updated: 27 Nov 2018

My favourite code editor.

This one is easy! Install the [settings sync extension](https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync) and use the gist:

```bash
d437298a643172027750781275d349c9
```

The extensions and settings will be automatically installed for you.

Now you need to increase the number of user watches to accomodate larger git projects (this will allocate up to 256mb)

```bash
sudo sh -c "echo 'fs.inotify.max_user_watches=524288' >> /etc/sysctl.conf"
sudo sysctl -p
```