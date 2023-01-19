#!/bin/bash

# repeat(){
# 	local start=1
# 	local end=${1:-80}
# 	local str="${2:-=}"
# 	local range=$(seq $start $end)
# 	for i in $range ; do echo -n "${str}"; done
# }

for letter in {a..z}
do
	qemu-x86_64 -d in_asm,nochain ~/hackathon/naive/target/debug/naive "$letter" 2>~/hackathon/logs/"$letter"_naive.asm
	echo "$letter: $(shasum ~/hackathon/logs/"$letter"_naive.asm)" >> ~/hackathon/logs/sums_naive.txt
	qemu-x86_64 -d in_asm,nochain ~/hackathon/bespoke/target/debug/bespoke "$letter" 2>~/hackathon/logs/"$letter"_bespoke.asm
	echo "$letter: $(shasum ~/hackathon/logs/"$letter"_bespoke.asm)" >> ~/hackathon/logs/sums_bespoke.txt
done
