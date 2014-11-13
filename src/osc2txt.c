#include <stdio.h>
#include <string.h>
#include <inttypes.h>

#include "osc.h"

#include "../../CNMAT/CNMAT/libo/osc_bundle_s.h"
#include "../../CNMAT/CNMAT/libo/osc_message_s.h"
#include "../../CNMAT/CNMAT/libo/osc_atom_s.h"

#include "../../CNMAT/CNMAT/libo/osc_bundle_u.h"
#include "../../CNMAT/CNMAT/libo/osc_message_u.h"
#include "../../CNMAT/CNMAT/libo/osc_atom_u.h"

#include "../../CNMAT/CNMAT/libo/osc_bundle_iterator_s.h"
#include "../../CNMAT/CNMAT/libo/osc_message_iterator_s.h"

long _a(char *buf, long n, t_osc_atom_s *a)
{
	switch(osc_atom_s_getTypetag(a)){
	case 'f':
	case 'd':
		return snprintf(buf, n, "%g", osc_atom_s_getDouble(a));
	case OSC_TIMETAG_TYPETAG:
		{
			if(buf && n){
				char tmp[n + 1];
				long nn = osc_atom_s_nformat(tmp, n, a, 0);
				snprintf(buf, n, "\"%s\"", tmp);
				return nn + 2;
			}else{
				return osc_atom_s_nformat(NULL, n, a, 0) + 2;
			}
		}
		return 0;
	default:
		return osc_atom_s_nformat(buf, n, a, 0);
	}
}

long _m(char *buf, long n, t_osc_msg_s *m)
{
	t_osc_msg_it_s *it = osc_msg_it_s_get(m);
	long offset = 0;
	if(buf && n){
		offset += snprintf(buf + offset, n - offset, "(%s ", osc_message_s_getAddress(m));
		while(osc_msg_it_s_hasNext(it)){
			t_osc_atom_s *a = osc_msg_it_s_next(it);
			offset += _a(buf + offset, n - offset, a);
			if(osc_msg_it_s_hasNext(it)){
				offset += snprintf(buf + offset, n - offset, " ");
			}
		}
		offset += snprintf(buf + offset, n - offset, ")");
	}else{
		offset += snprintf(NULL, 0, "(%s ", osc_message_s_getAddress(m));
		while(osc_msg_it_s_hasNext(it)){
			t_osc_atom_s *a = osc_msg_it_s_next(it);
			offset += _a(NULL, 0, a);
			if(osc_msg_it_s_hasNext(it)){
				offset += snprintf(NULL, 0, " ");
			}
		}
		offset += snprintf(NULL, 0, ")");
	}
	osc_msg_it_s_destroy(it);
	return offset;
}

long _b(char *buf, long n, long bndllen, char *bndl)
{
	t_osc_bndl_it_s *it = osc_bndl_it_s_get(bndllen, bndl);
	long offset = 0;
	if(buf && n){
		offset += snprintf(buf + offset, n - offset, "(");
		while(osc_bndl_it_s_hasNext(it)){
			t_osc_msg_s *m = osc_bndl_it_s_next(it);
			offset += _m(buf + offset, n - offset, m);
		}
		offset += snprintf(buf + offset, n - offset, ")");
	}else{
		offset += snprintf(NULL, 0, ")");
		while(osc_bndl_it_s_hasNext(it)){
			t_osc_msg_s *m = osc_bndl_it_s_next(it);
			offset += _m(NULL, 0, m);
		}
	}
	osc_bndl_it_s_destroy(it);
	return offset;
}

int main(int argc, char **argv)
{
	if(argc < 2){
		printf("error: you must supply a filename\n");
		return 0;
	}
	for(int i = 1; i < argc; i++){
		FILE *in = fopen(argv[i], "r");
		if(!in){
			printf("couldn't open %s for reading\n", argv[i]);
		}
		char *ext = ".lisp";
		long filenamelen = strlen(argv[i]) + strlen(ext) + 1;
		char outfile[filenamelen];
		snprintf(outfile, filenamelen, "%s%s", argv[i], ext);
		FILE *out = fopen(outfile, "w");
		if(!out){
			printf("couldn't open %s for writing\n", outfile);
		}
		fseek(in, 0, SEEK_END);
		size_t size = ftell(in);
		fseek(in, SEEK_SET, 0);
		char *buf = malloc(size);
		if(!buf){
			printf("couldn't malloc %ld bytes\n", size);
			return 0;
		}
		size_t read = 0;
		if((read = fread(buf, 1, size, in)) != size){
			printf("tried to read %ld bytes but read %ld instead!\n", size, read);
			return 0;
		}
		fclose(in);
		char *ptr = buf;
		while(ptr - buf < size){
			long len = ntoh32(*((int32_t *)ptr));
			long n = _b(NULL, 0, len, ptr + 4);
			char lisp[n + 1];
			_b(lisp, n + 1, len, ptr + 4);
			fprintf(out, "%s\n", lisp);
			ptr += len + 4;
		}
		fclose(out);
		free(buf);
	}
	return 0;
}

/*
int main(int argc, char **argv)
{
	if(argc < 3){
		printf("you must supply at least one filename and OSC address\n");
		return 0;
	}
	char *filenames[128];
	int nfiles = 0;
	char *addresses[128];
	int naddresses = 0;
	char **av = argv + 1;
	while(av - argv < argc){
		if(strcmp(*av, "-f") == 0){
			av++;
			while(av - argv < argc && **av != '-'){
				filenames[nfiles++] = *av;
				av++;
			}
		}else if(strcmp(*av, "-a") == 0){
			av++;
			while(av - argv < argc && **av != '-'){
				addresses[naddresses++] = *av;
				av++;
			}
		}
	}

	double *data[nfiles][naddresses];
	int nbndls[nfiles];
	for(int i = 0; i < nfiles; i++){
		FILE *fp = fopen(filenames[i], "r");
		fseek(fp, 0, SEEK_END);
		size_t size = ftell(fp);
		fseek(fp, SEEK_SET, 0);
		char *buf = malloc(size);
		size_t read = 0;
		if((read = fread(buf, 1, size, fp)) != size){
			printf("tried to read %ld bytes but read %ld instead!\n", size, read);
			return 0;
		}
		fclose(fp);
		nbndls[i] = 0;
		int pos = 0;
		while(pos < size){
			int len = ntohl(*((int32_t *)(buf + pos)));
			nbndls[i]++;
			pos += len + 4;
		}
		for(int j = 0; j < naddresses; j++){
			data[i][j] = calloc(nbndls[i], sizeof(double));
			pos = 0;
			int k = 0;
			while(pos < size){
				long len = ntohl(*((int32_t *)(buf + pos)));
				char *ptr = (buf + pos + 4);
				t_osc_msg_ar_s *ar = NULL;
				osc_bundle_s_lookupAddress(len, ptr, addresses[j], &ar, 1);
				if(ar){
					t_osc_msg_s *m = osc_message_array_s_get(ar, 0);
					t_osc_atom_s *a = NULL;
					osc_message_s_getArg(m, 0, &a);
					if(a){
						data[i][j][k] = osc_atom_s_getDouble(a);
					}
				}
				k++;
				pos += len + 4;
			}
		}
	}

	for(int i = 0; i < nfiles; i++){
		for(int j = 0; j < naddresses; j++){
			char filename[128];
			for(int k = 0; k < strlen(addresses[j]); k++){
				if(addresses[j][k] == '/'){
					addresses[j][k] = '_';
				}
			}
			sprintf(filename, "%s%s.txt", filenames[i], addresses[j]);
			FILE *fp = fopen(filename, "w");
			for(int k = 0; k < nbndls[i]; k++){
				fprintf(fp, "%0.12f ", data[i][j][k]);
			}
		}
	}

	return 0;
}
*/
