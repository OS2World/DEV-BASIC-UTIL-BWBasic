CC = gcc
CFLAGS = -O2 -s -Zomf -Zsys

OBJS = bwbasic.obj \
bwb_cmd.obj \
bwb_cnd.obj \
bwb_dio.obj \
bwb_elx.obj \
bwb_exp.obj \
bwb_fnc.obj \
bwb_inp.obj \
bwb_int.obj \
bwb_mth.obj \
bwb_ops.obj \
bwb_prn.obj \
bwb_str.obj \
bwb_tbl.obj \
bwb_tcc.obj \
bwb_var.obj \

default:        bwbasic.exe bwbasic.inf
	copy bwbasic.exe ..
	del bwbasic.exe
	copy bwbasic.inf ..
	del bwbasic.inf

bwbasic.exe:    $(OBJS)
	$(CC) $(CFLAGS) -o bwbasic.exe $(OBJS)

bwbasic.inf:	bwbasic.ipf
	ipfc /inf bwbasic.ipf

bwbasic.obj: bwbasic.c
	$(CC) $(CFLAGS) -o bwbasic.obj -c bwbasic.c

bwb_cmd.obj: bwb_cmd.c
	$(CC) $(CFLAGS) -o bwb_cmd.obj -c bwb_cmd.c

bwb_cnd.obj: bwb_cnd.c
	$(CC) $(CFLAGS) -o bwb_cnd.obj -c bwb_cnd.c

bwb_dio.obj: bwb_dio.c
	$(CC) $(CFLAGS) -o bwb_dio.obj -c bwb_dio.c

bwb_elx.obj: bwb_elx.c
	$(CC) $(CFLAGS) -o bwb_elx.obj -c bwb_elx.c

bwb_exp.obj: bwb_exp.c
	$(CC) $(CFLAGS) -o bwb_exp.obj -c bwb_exp.c

bwb_fnc.obj: bwb_fnc.c
	$(CC) $(CFLAGS) -o bwb_fnc.obj -c bwb_fnc.c

bwb_inp.obj: bwb_inp.c
	$(CC) $(CFLAGS) -o bwb_inp.obj -c bwb_inp.c

bwb_int.obj: bwb_int.c
	$(CC) $(CFLAGS) -o bwb_int.obj -c bwb_int.c

bwb_mth.obj: bwb_mth.c
	$(CC) $(CFLAGS) -o bwb_mth.obj -c bwb_mth.c

bwb_ops.obj: bwb_ops.c
	$(CC) $(CFLAGS) -o bwb_ops.obj -c bwb_ops.c

bwb_prn.obj: bwb_prn.c
	$(CC) $(CFLAGS) -o bwb_prn.obj -c bwb_prn.c

bwb_str.obj: bwb_str.c
	$(CC) $(CFLAGS) -o bwb_str.obj -c bwb_str.c

bwb_tbl.obj: bwb_tbl.c
	$(CC) $(CFLAGS) -o bwb_tbl.obj -c bwb_tbl.c

bwb_tcc.obj: bwb_tcc.c
	$(CC) $(CFLAGS) -o bwb_tcc.obj -c bwb_tcc.c

bwb_var.obj: bwb_var.c
	$(CC) $(CFLAGS) -o bwb_var.obj -c bwb_var.c
