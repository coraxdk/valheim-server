# Valheim Docker Server
This is a pretty basic, yet fully customizable valheim server - acording to the official server documentations - you can run in a docker container.
All server files are contained in the image, so no downloading, but does require image update whenever there is a update to the game server.
The only required parameter is the password, but i suggest you at least also change the default server name.
## Environmental parameters
| Value| Default| Description|
|---|---|---|
| NAME| My Server|  Enter the name of your server that will be visible in the Server list.|
| PORT| 2456|  Choose the Port which you want the server to communicate with. Please note that this has to correspond with the Port Forwarding settings on your Router.|
| WORLD| Dedicated| A World with the name entered will be created. You may also choose an already existing World by entering its name.|
| PASSWORD| |  Set the password.|
| PUBLIC| 1|  Set the visibility of your server. 1 is default and will make the server visible in the browser. Set it to 0 to make the server invisible and only joinable via the ‘JoinIP’-button. Setting public to 0 is a good option if you wish to run a local LAN server, where players can join via the local IP of the server.|
| SAVEINTERVAL| 1800|  Change how often the world will save in seconds.|
| BACKUPS| 4|  Sets how many automatic backups will be kept. The first is the ‘short’ backup length, and the rest are the ‘long’ backup length.|
| BACKUPSHORT| 7200| Sets the interval between the first automatic backups.|
| BACKUPLONG| 43200| Sets the interval between the subsequent automatic backups.|
| CROSSPLAY| true| Runs the Server on the Crossplay backend (PlayFab), which lets users from any platform join.|
|INSTANCEID| 1|  If you’re hosting multiple servers with the same port from the same MACaddress, write something unique here for each server to ensure that they get unique PlayFab IDs.|
| PRESET| <i>empty</i>| Sets the world modifier preset.|
| MODIFIER| <i>empty</i>| Sets specific world modifiers.|
| SETKEY| <i>empty</i>| Sets world modifier checkbox key.|