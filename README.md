# rmb
RMB archiving tool for NationStates


You should have a Python interpreter/IDE installed to use this.

This Python program uses the messages shard of the Region API to get messages from a region's RMB and save them in a (somewhat) neat format in a text file. The data saved are the post author, date and time, post ID, sequential post number (first post 1, etc), number and name of likes, whether the post is suppressed, self-deleted or mod deleted, and if suppressed, by whom, and of course the message content.

Steps to use:
1. Download the rmb.py file.
2. Run it by double-clicking, or (preferably) in your IDE.
3. Follow the instructions on the command window. When entering the file name, enter it with full path (using backslashes \ on Windows) and extension (.txt). You can skip entering the path if the file is saved in the same folder as the script (not necessarily the Python folder, please ignore what the script's message says for this). You can use the command line arguments as well.

Syntax for arguments:
```
usage: rmb.py [-h] [-u USERAGENT] [-r REGION] [-o FILE] [-i STARTID]
              [-s STARTNO]

optional arguments:
  -h, --help            show this help message and exit
  -u USERAGENT, --useragent USERAGENT
                        NS API user agent
  -r REGION, --region REGION
                        Region name
  -o FILE, --file FILE  File to output the result (with path if required)
  -i STARTID, --startid STARTID
                        Starting Post ID
  -s STARTNO, --startno STARTNO
                        Starting serial number
```
If run without the u, r and f arguments it prompts for input.

Running may take some time depending on the size of your RMB. The output screen (console) will print out the number of messages done every 100 messages, so you can keep track. When the program ends, the output window may close on its own. Check your text file to see if the program worked successfully.

## Examples
```
--------------------------------------------------------------------------------
20657581: Post 1665 by vavax on 2016-08-04 at 22:42:33 GMT
Likes: 1(merni)

[quote=united_meme_alliance;20656723]NS logic at its finest[/quote]
Damnit Max Barry
```
where 20657581 is the post ID and 1665 is the sequential number of the post.
```
--------------------------------------------------------------------------------
19893583: Post 1246 by dragosi on 2016-06-21 at 06:54:32 GMT
Likes: 0()
self-deleted
Message deleted by author
```
```
--------------------------------------------------------------------------------
24078428: Post 7532 by please_stay_hydrated on 2017-02-24 at 22:59:44 GMT
Likes: 2(federal_southern_cities:calapsia)
moderator deleted
Message suppressed by a moderator
```
```
--------------------------------------------------------------------------------
26640002: Post 11630 by calapsia on 2017-08-04 at 23:03:49 GMT
Likes: 1(new_cheeseland)
suppressed by vavax
[quote=vavax;26631431]Which means I therefore also have positive 0 power.To be fair, this is a real thing that happened.[/quote]
HA. Got you there, dad! Negative zero doesn't exist, therefore neither does your power! :D
```

## Errors
If the script stops with an error (starting with "Traceback (most recent call last)" etc on the first line) and the last line of the error contains "invalid token" or something like that, please note the last post ID saved to the text file, start up the script again, enable advanced options, and enter a starting post ID about 100 or 1000 more than that one. (Post IDs are not sequential in a region, so you probably will not miss any posts or maybe a few at most. You may need to advance by a lot if your RMB was inactive at the time of that post.) This error may be caused due to an invalid (control) character in a certain post.

If the output contains ? or weird symbols in unexpected places, please just live with it. This and the above error are caused by inconsistent encoding in the API messages shard.

If you get any other error, or if these fixes don't work, please contact me via TG.

