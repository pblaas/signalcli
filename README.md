# signal-cli


## Create intial config
`mkdir $HOME/signal`
`docker run -v $HOME/signal:/config --rm -it pblaas/signal-cli:latest link`

Paste entire tsdevice:/? string in https://www.nayuki.io/page/qr-code-generator-library and read with Signal APP to add connected device.

## Start messaging
After device is connected you can start sending messages:
`docker run -v $HOME/signal:/config --rm -it pblaas/signal-cli:latest -u YOURREGISTEREDNR send RECEIVER -m "your message"`


## show CLI help
`docker run -v $HOME/signal:/config --rm -it pblaas/signal-cli:latest -h`
