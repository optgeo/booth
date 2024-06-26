GATEWAY := 12D3KooWHfRi5wLsK6yu6rQdgVqtcdJ6m8jVLSmrd66wRK9Uh8BC
GATEWAY2 := 12D3KooWEjsGPUQJ4Ej3d1Jcg4VckWhFbhc6mkGunMm1faeSzZMu
MAIN_NODE:= 12D3KooWRS41c8b11hMeQQgFCLYcMuoZAEVjua24EhMzKBHsCzbP

prepare:
	sudo sysctl -w net.core.rmem_max=2500000; \
	sudo sysctl -w net.core.wmem_max=2500000; \
	sudo sysctl -w vm.swappiness=0; \

connect:
	ipfs id ${GATEWAY} | jq .Addresses[] |\
        ruby -e 'ARGF.each{|l| print "ipfs swarm connect #{l}" }' | sh
	ipfs id ${GATEWAY2} | jq .Addresses[] |\
        ruby -e 'ARGF.each{|l| print "ipfs swarm connect #{l}" }' | sh

node_connect:
	ipfs id ${MAIN_NODE} | jq .Addresses[] |\
	ruby -e 'ARGF.each{|l| system "ipfs swarm connect #{l}" }'

pin:
	ipfs pin add --progress QmWsTYyEq9Trn31ZuU8cAJRnCm2WbzduiQLm4Uy7AfcNSs # Smart Maps Global Elevation Tiles
	ipfs pin add --progress QmSMpoELQsJjpYYEuNhaoQPsQdq8dVTkbt63vt9ZSu9Dja # OSMFJ OpenStreetMap PMTiles

