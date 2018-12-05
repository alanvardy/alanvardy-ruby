# 8. Issues

Last Updated: 29 Nov 2018

Linux has issues, these are the ones that I encounter.

## Bluetooth mouse won't stay connected

Credit to [joegry](https://ubuntuforums.org/showthread.php?t=2390542)

This one is a repeat offender for me.

```bash
# Open bluetooth controllers
bluetoothctl
# List controllers
list
# Choose the controller to work with i.e. select 01:23:45:67:89:AB
select <address>
# Turn on
power on
# Scan for bluetooth devices (make sure your mouse is in discovery mode before running this command)
scan on
# Scan off once you have found your device
scan off
# Pair it, i.e. pair 34:88:5D:87:C0:A6
pair <address>
# Connect it
connect <address>
# Trust it
trust <address>
```