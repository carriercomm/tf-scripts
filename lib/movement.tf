/def _bind_kb_key_nkp1      = /_movement_go_exec sw
/def _bind_kb_key_nkp2      = /_movement_go_exec s
/def _bind_kb_key_nkp3      = /_movement_go_exec se
/def _bind_kb_key_nkp4      = /_movement_go_exec w
/def _bind_kb_key_nkp6      = /_movement_go_exec e
/def _bind_kb_key_nkp7      = /_movement_go_exec nw
/def _bind_kb_key_nkp8      = /_movement_go_exec n
/def _bind_kb_key_nkp9      = /_movement_go_exec ne
/def _bind_kb_key_nkp0      = /_movement_go_exec d
/def _bind_kb_key_nkpDot    = /_movement_go_exec u
/def _bind_kb_key_nkpMinus  = /_movement_go_exec wyjscie

/def _bind_kb_key_nkp5      = /send zerknij

/def _movement_go_exec =    \
\
    /send %{1}

/def -ag -mregexp -t'((Jest|Sa) tutaj ([^ ]*) (widoczne|widocznych) (wyjsc|wyjscia|wyjscie): |Trakt wiedzie na |W mroku nocy dostrzegasz .* widoczn(e|ych) wyjsc(|ia|ie): |Trakt rozgalezia sie na |W gestych ciemnosciach dostrzegasz trakt wiodacy na |W gestych ciemnosciach dostrzegasz, ze trakt rozgalezia sie na |Sciezka prowadzi tutaj w .* (kierunkach|kierunku): |Szlak.* tutaj w .* kierunk.*: |Wyjsc.* prowadz.* tutaj w .* (kierunkach|kierunku): |Tunel.* ciagn.* na |Wedrowke przez rozlegle laki mozesz kontynuowac udajac sie na )' _movement_match_exists = \
    /let _movement_exists=$[replace(".", "", replace(" i ", ", ", {PR}))]%;\
    /_movement_exists %{_movement_exists}%;\
    /let _movement_exists=$[replace(", ", " ", {_movement_exists})]%;\
    /_statusbar_update_compass %{_movement_exists}

/def _movement_exists = \
    /echo -p @{BCyellow} ==  @{BCgreen}%{*}