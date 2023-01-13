
CFLAGS       = -fPIC
LDFLAGS      = -shared

all: scipy_a scipy_b scipy_a_hidden athenb athenb_hidden athenb_hidden_last bthena

scipy_a: scipy_a.o
	$(CC) -o scipy_a.so scipy_a.o $(CFLAGS) $(LDFLAGS)

scipy_b: scipy_b.o
	$(CC) -o scipy_b.so scipy_b.o $(CFLAGS) $(LDFLAGS)

scipy_a_hidden: scipy_a.o
	$(CC) -o scipy_a_hidden.so scipy_a.o $(CFLAGS) $(LDFLAGS) -Wl,--version-script=symbols.map

athenb: athenb.o
	$(CC) -o athenb athenb.o scipy_a.so scipy_b.so -Wl,-rpath .

athenb_hidden: athenb.o
	$(CC) -o athenb_hidden_last athenb.o scipy_a_hidden.so scipy_b.so -Wl,-rpath .

athenb_hidden_last: athenb.o
	$(CC) -o athenb_hidden_last athenb.o scipy_b.so scipy_a_hidden.so -Wl,-rpath .

bthena: bthena.o
	$(CC) -o bthena bthena.o scipy_b.so scipy_a.so -Wl,-rpath .
