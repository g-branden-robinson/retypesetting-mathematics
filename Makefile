# Set this macro to where your groff executable is located.  For best
# results, ensure that it locates an s.tmac file with some fixes applied
# (Savannah #62686, #62687, #62688).
GROFF:=groff
GROFFOPTS:=-ww -e -ms -M . -m sbtl -P -pletter -T ps

ALL=eqnsystem.ps eqnuser.ps

all: $(ALL)

EQNSYSTEMSRCS:=e.mac e0 e1 e2 e3 e4 e5 e6 e7
EQNUSERSRCS:=g.mac g0 g1 g2 g3 g4 g5

eqnsystem.ps: sbtl.tmac $(EQNSYSTEMSRCS)
	$(GROFF) $(GROFFOPTS) $(EQNSYSTEMSRCS) >$@

eqnuser.ps: sbtl.tmac $(EQNUSERSRCS)
	$(GROFF) $(GROFFOPTS) $(EQNUSERSRCS) >$@

clean:
	rm -f $(ALL)
