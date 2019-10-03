# Ping-Out
A `bash` script and a `systemd` service that check internet connectivity by pinging `8.8.8.8`.

The `bash` script `ping-out.sh` pings every 60 seconds to the presumably always available IP address
`8.8.8.8`. If packages may be lost, an error will be logged into a file.


## Prerequisites
The script requires `bash`. The service requires also `systemd`.


## Usage
Review and adjust the script `ping-out.sh` according to your gusto. E.g. adjust the log file path,
the time interval or the IP adress to which to ping to.

Start the script like:
```bash
bash ping-out.sh
```

You can detach the script from the terminal session and run it in the background:
```bash
nohup ./ping-out.sh &
```

### Running `ping-out` as a Service
The script `setup-systemd-service.sh` can set up the service on platforms that support `systemd`,
e.g. `Ubuntu`.
Running `ping-out.sh` as a service allows for autostart and running in the backgorund.

To install the `systemd` service for `ping-out` on `Ubuntu`, run:
```bash
sudo bash setup-systemd-service.sh
```

This copies the script `ping-out.sh` into the directory `/usr/local/bin` and the file
`ping-out.service` into the directories of the `systemd` installation.
On other platforms than `Ubuntu`, you might have to adjust the setup-script.

After installation, you may control the service via typical `systemd` commands:
```bash
sudo systemctl enable ping-out  # run service at system startup
sudo systemctl start ping-out
sudo systemctl stop ping-out
sudo systemctl restart ping-out
sudo systemctl status ping-out
```

If you want to make changes to the program, change the script and replace the script file in
`/usr/local/bin/`.


## Contributing
Work on your stuff locally, branch, commit and modify to your heart's content.
If there is anything you can extend, fix or improve, please do so!
Happy coding!


## TODO
