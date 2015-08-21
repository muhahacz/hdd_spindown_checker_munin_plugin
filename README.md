# hdd_spindown_checker_munin_plugin

sudo nano /usr/share/munin/plugins/spindown

sudo ln -s /usr/share/munin/plugins/spindown /etc/munin/plugins/
sudo chmod +x /usr/share/munin/plugins/spindown

sudo nano /etc/munin/plugin-conf.d/spindown

[spindown]

user root

sudo munin-run spindown

/etc/init.d/munin-node reload
