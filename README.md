# signal-cli


## Create intial config
```
mkdir $HOME/signal
docker run -v $HOME/signal:/config --rm -it pblaas/signalcli:latest link
```

Paste entire tsdevice:/? string in https://www.nayuki.io/page/qr-code-generator-library and read with Signal APP to add connected device.

## Start messaging
After device is connected you can start sending messages:
```
docker run -v $HOME/signal:/config --rm -it pblaas/signalcli:latest -u YOURREGISTEREDNR send RECEIVERNR -m "your message"
```

## show CLI help
```
docker run -v $HOME/signal:/config --rm -it pblaas/signalcli:latest -h
```

## having some fun
```
echo `curl --silent https://api.chucknorris.io/jokes/random | jq '. | .value'` | docker run -v $HOME/signal:/config --rm -i signalcli:latest -u YOURREGISTRATIONNR send --g GROUPID
```

# Signal container images

Two container images are currenly provided. 
* signalcli:latest
    - based on AsamK/signal-cli release 
* signalcli:source
    - based on AsamK/signal-cli master branch


