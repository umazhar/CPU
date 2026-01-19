SRCDIR   := src
RTLDIR   := $(SRCDIR)/rtl
TBDIR    := $(SRCDIR)/tb

RTL_SRCS := $(shell find $(RTLDIR) -name '*.sv')
TB_SRCS  := $(shell find $(TBDIR)  -name '*.sv')

SIM      := cpu_exec

IVERILOG := iverilog         # the compiler
VVP      := vvp              # the runtime
IVERFLAGS := -g2012 -Wall    # SystemVerilog 2012 + warnings

.PHONY: all run clean

run: $(SIM)
	@echo "Running $(SIM)..."
	$(VVP) $(SIM)

$(SIM): $(RTL_SRCS) $(TB_SRCS)
	@echo "Compiling $(shell echo $^ | tr ' ' ', ') ..."
	$(IVERILOG) $(IVERFLAGS) -o $@ $^

clean:
	rm -f $(SIM) *.vcd