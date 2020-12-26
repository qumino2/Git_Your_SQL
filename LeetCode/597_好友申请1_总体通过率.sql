-- select 一个标量;  注意嵌套函数的时候运用换行来保持格式清晰

select round(
    coalesce(
    (select count(distinct requester_id ,accepter_id) from RequestAccepted) / 
    (select count(distinct sender_id ,send_to_id) from FriendRequest)
    ,0)
    ,2) as accept_rate ;