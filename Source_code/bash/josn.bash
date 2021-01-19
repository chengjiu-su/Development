执行保存：curl "http://backend.popcornie.com/api/sg/ops/save"，相当于区服列表里的save按钮

修改group：curl "http://backend.popcornie.com/api/sg/ops/mv_group?serverId=4001&targetGroupId=5"

返回格式：
{
    "state": true,
    "msg": "",
    "extra": null,
    "attachment": null
}

修改gourp成功
{
    "state": true,
    "msg": "",
    "extra": null,
    "attachment": {
        "server": "4001",
        "from": "5",
        "to": "5"
    }
}
修改group失败
{
    "state": false,
    "msg": "server [400] not found",
    "extra": null,
    "attachment": null
}


[{
  "group":9,
  "server":735,
  "server_name":"无双35服",
  "time":"2021-01-06 18:00:00"
},{
  "group":9,
  "server":736,
  "server_name":"无双36服",
  "time":"2021-01-07 10:00:00"
},{
  "group":9,
  "server":737,
  "server_name":"无双37服",
  "time":"2021-01-07 18:00:00"
},{
  "group":9,
  "server":738,
  "server_name":"无双38服",
  "time":"2021-01-08 10:00:00"
},{
  "group":9,
  "server":739,
  "server_name":"无双39服",
  "time":"2021-01-08 18:00:00"
}]