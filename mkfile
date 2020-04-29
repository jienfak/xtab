<mkconfig

VERSION = 0.6
CPPFLAGS = -DVERSION=\"$VERSION\" -D_DEFAULT_SOURCE \
	$INC
CFLAGS = $ADDCFLAGS $CPPFLAGS
LDFLAGS = -s $LIB

SRC = `{ ls *.c }
OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = $NAME

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $ADDFLAGS $CFLAGS $CPPFLAGS -c -o $target $prereq
%.c :Q: $HDR
	echo -n
%.h :Q:
	echo -n
install : $TGT
	cp -f $TGT $ROOT/bin/
	chmod 0755 $ROOT/bin/$TGT
	sed s/VERSION/$VERSION/g < $NAME.1 > $ROOT/share/man/man1/$NAME.1
	chmod 644 $ROOT/share/man/man1/$NAME.1
uninstall: 
	rm -f $ROOT/share/man/man1/$TGT.1 $ROOT/bin/$TGT
clean :
	rm -rf $TGT *.o 
