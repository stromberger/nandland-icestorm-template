space = $(noop) $(noop)

#syntesis
out/synth.blif: src/*.v
	yosys -p "read_verilog $(subst $(space),; read_verilog ,$^); synth_ice40 -blif out/synth.blif"

# route & place
out/routing.txt: out/synth.blif
	arachne-pnr -d 1k -p constraints.pcf -P vq100 -o out/routing.txt out/synth.blif

# pack to bin
out/out.bin: out/routing.txt
	icepack $^ $@

all: out/out.bin

# programm
prog: out/out.bin
	iceprog $^