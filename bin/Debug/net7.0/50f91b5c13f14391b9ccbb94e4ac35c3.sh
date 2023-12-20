function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 25792;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 25792 > /dev/null;
done;

for child in $(list_child_processes 25879);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/Maryam/Desktop/demo/my-new-app/bin/Debug/net7.0/50f91b5c13f14391b9ccbb94e4ac35c3.sh;
