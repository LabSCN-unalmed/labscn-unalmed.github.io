# https://sqlite.org/contrib/download/extension-functions.c

default:
	wget -c "https://sqlite.org/contrib/download/extension-functions.c/download/extension-functions.c?get=25" -O extension-functions.c
	gcc -fPIC -lm -shared extension-functions.c -o libsqlitefunctions.so
	@echo "Usage:"
	@echo "  sqlite> SELECT load_extension('/path/to/libsqlitefunctions.so');"
	@echo "  sqlite> select value, log(value) from test;1|0.0"

clean:
	@rm -f libsqlitefunctions.so
