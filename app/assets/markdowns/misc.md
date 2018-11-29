# 6. Miscellaneous

Last Updated: 27 Nov 2018, Credit to: [Bryce Johnston](https://gist.github.com/beaorn)

Add Git information:

```bash
git config --global user.name "Your Name"
git config --global user.email YOUR@EMAIL.com
```

Generate an SSH keypair

```bash
ssh-keygen -t rsa -C "YOUR@EMAIL.com"
```

Copy the output of this command and paste into github SSH key settings.

```bash
cat ~/.ssh/id_rsa.pub
```

Check to make sure SSH to Github works with your key

```bash
ssh -T git@github.com
```

Install Inconsolata font

```bash
sudo apt-get install fonts-inconsolata -y
sudo fc-cache -fv
```

And finally don't forget to set up:

- Email signatures
